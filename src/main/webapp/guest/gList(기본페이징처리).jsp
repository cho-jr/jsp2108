<%@page import="guest.GuestVO"%>
<%@page import="java.util.List"%>
<%@page import="guest.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String mid = session.getAttribute("sAdmin")==null ? "" : (String) session.getAttribute("sAdmin");

    GuestDAO dao = new GuestDAO();
    GuestVO vo = new GuestVO();
  
/* 
	페이징 처리
	1. 한 페이지 분량을 정한다. : pageSize = 10건(사용자가 정한다. ) 
	2. 총 레코드 건수를 구한다. : totRecCnt => SQL 함수 중 count(*) 함수 사용
	3. 총 페이지 수를 구한다. : totPage => 나머지가 0이면 (총레코드수 / 페이지 분량), 나머지가 0이 아니면 (총레코드수 / 페이지 분량) + 1 
	4. 현재 페이지의 시작 index 번호 : startIndexNo => (현재 페이지-1) * 페이지 분량
	5. 현재 화면에 보이는 방문 소감 시작 번호 : curScrStartNo =>  총 레코드 수 - 현재 페이지의 시작 index 번호
	
*/
/* 이 곳부터 페이징 처리 변수 지정 시작 */
	int pag = request.getParameter("pag")==null ? 1: Integer.parseInt(request.getParameter("pag"));

	int pageSize = 5;					// 1. 한 페이지 분량
	int totRecCnt = dao.totRecCnt();		// 2. 총 레코드 건수
	int totPage = (totRecCnt % pageSize)==0? totRecCnt/pageSize: totRecCnt/pageSize + 1;	//3. 총 페이지 수
  	int startIndexNo = (pag - 1) * pageSize; 	// 4. 현재 페이지의 시작 index 번호
	int curScrStartNo = totRecCnt - startIndexNo; // 5. 현재 화면에 보이는 방문 소감 시작 번호
  	
/* 이 곳까지 페이징 처리 변수 지정 끝 */

	List<GuestVO> vos = dao.gList(startIndexNo, pageSize);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>gList.jsp(기본 페이지 처리_이전/다음)</title>
  <%@ include file="../include/bs4.jsp" %>
  <script>
    function delCheck(idx) {
    	var ans = confirm("현재 방문소감 글을 삭제하시겠습니까?");
    	if(ans) location.href="<%=request.getContextPath()%>/GDelete?idx="+idx;
    }
  </script>
  <style>
    th {
    	background-color: #ccc;
    	text-align: center;
    }
  </style>
</head>
<body>
<%@ include file="../include/header_home.jsp" %>
<%@ include file="../include/nav.jsp" %>
<p><br></p>
<div class="container">
  <table class="table table-borderless">
    <tr>
      <td colspan="2" style="text-align:center;"><h2>방 명 록 리 스 트</h2></td>
    </tr>
    <tr>
      <td>
<%
        if(mid.equals("admin")) {
          out.println("<a href='"+request.getContextPath()+"/AdminLogOut' class='btn btn-secondary'>관리자 로그아웃</a>");
        }
        else {
        	out.println("<a href='adminLogin.jsp' class='btn btn-secondary'>관리자</a>");
        }
%>
      </td>
      <td style="text-align:right;"><a href="<%=request.getContextPath()%>/guest/gInput.jsp" class="btn btn-secondary">글쓰기</a></td>
    </tr>
    <tr>
    	<td colspan="2" style="text-align:right;">
    		<!-- 페이징 처리 시작 -->
			<div class="container" style="text-align: center;">
			<%  if(pag != 1) {%>
					<a href="gList.jsp?pag=1">첫 페이지</a>			
			<%	}%>
			<%  if(pag > 1) {%>
					<a href="gList.jsp?pag=<%=pag - 1%>" style="color:gray; font-size: 16pt;">&lt;&lt;&lt;</a>			
			<%	}%>
				<span style="font-weight: border;"><%=pag %> Page / <%=totPage%> Pages</span>
			<%  if(pag < totPage) {%>
					<a href="gList.jsp?pag=<%=pag + 1%>" style="color:gray; font-size: 16pt;">&gt;&gt;&gt;</a>			
			<%	}%>
			<%  if(pag != totPage) {%>
					<a href="gList.jsp?pag=<%=totPage%>">마지막 페이지</a>			
			<%	}%>
			
			</div>
			<!-- 페이징 처리 끝 -->
    	</td>
    </tr>
  </table>
<%
	for(int i=0; i<vos.size(); i++) {
		vo = vos.get(i);
		
		String email = vo.getEmail();
		if(email.equals("") || email == null) email = "-없음-";
		String homepage = vo.getHomepage();
		// if(homepage.equals("") || homepage == null) homepage = "-없음-";
		
		String vDate = vo.getvDate().substring(0, vo.getvDate().length()-2);
		
		String content = vo.getContent().replace("\n", "<br/>");
%>
	  <table class="table table-borderless">
	    <tr>
	      <td>
	        방문번호 : <%=curScrStartNo %> &nbsp;
<%
					if(mid.equals("admin")) {
					  out.println("<a href='javascript:delCheck("+vo.getIdx()+")' class='btn btn-secondary btn-sm'>삭제</a>");
					}
%>
	      </td>
	      <td style="text-align:right;">
	        방문IP : <%=vo.getHostIp() %>
	      </td>
	    </tr>
	  </table>
	  <table class="table table-bordered">
	    <tr>
	      <th style="width:20%;">성명</th>
	      <td style="width:25%;"><%=vo.getName() %></td>
	      <th style="width:20%;">방문일자</th>
	      <td style="width:35%;"><%=vDate %></td>
	    </tr>
	    <tr>
	      <th>전자우편</th>
	      <td colspan="3"><%=email %></td>
	    </tr>
	    <tr>
	      <th>홈페이지</th>
	      <td colspan="3">
<%
					if(homepage.length() <=8) {
						out.println("-없음-");
					}
					else {
						out.println("<a href='"+homepage+"' target='_blank'>"+homepage+"</a>");
					}
%>
	      </td>
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td colspan="3"><%=content %></td>
	    </tr>
	  </table>
	  <br/>
<%
		curScrStartNo--;
	} 
%>
</div>

<!-- 페이징 처리 시작 -->
<div style="text-align: center;">
<%  if(pag != 1) {%>
		<a href="gList.jsp?pag=1">첫 페이지</a>			
<%	}%>
<%  if(pag > 1) {%>
		<a href="gList.jsp?pag=<%=pag - 1%>" style="color:gray; font-size: 16pt;">&lt;&lt;&lt;</a>			
<%	}%>
	<span style="font-weight: 600;"><%=pag %> Page / <%=totPage%> Pages</span>
<%  if(pag < totPage) {%>
		<a href="gList.jsp?pag=<%=pag + 1%>" style="color:gray; font-size: 16pt;">&gt;&gt;&gt;</a>			
<%	}%>
<%  if(pag != totPage) {%>
		<a href="gList.jsp?pag=<%=totPage%>">마지막 페이지</a>			
<%	}%>

</div>
<!-- 페이징 처리 끝 -->
<br/>
<%@ include file="../include/footer.jsp" %>
</body>
</html>