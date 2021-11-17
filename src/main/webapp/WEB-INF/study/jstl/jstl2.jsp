<%@page import="study.mapping2.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="study.mapping2.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl2.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<jsp:include page="/include/nav.jsp"/>
<p><br></p>
<div class="container">
  <h2>JSTL 제어문(core라이브러리 사용)</h2>
  <p><b>조건문 : 참일때 수행내용만 기술할 수 있다.(else문이 없다)</b></p>
  <b>문법 : &lt; c :if test="$ {조건식}">참일때수행내용< /c :if></b><br/>
  <p>일반 비교연산은 '문자'로 연산처리한다. 숫자로 변형하려면 변수명뒤에 '+0'을 붙인다.</p>
  <c:set var="su1" value="100"/>
  <c:set var="su2" value="500"/>
  su1 = ${su1} / su2 = ${su2}<br/>
  1.su1 > su2 ==>> <c:if test="${su1+0 > su2}">su1이 더 크다</c:if><br/>
  2.<c:if test="${su1 == su2+0}">su1과 su2는 같다.</c:if><br/>
  3.<c:if test="${su1 != su2+0}">su1과 su2는 같지않다.</c:if><br/>
  4.<c:if test="${su1 >= su2+0}">su1이 su2보다 크거나 같다.</c:if><br/>
  5.<c:if test="${su1 < su2+0}">su1이 su2보다 작다.</c:if><br/>
  6.<c:if test="${su1 <= su2+0}">su1이 su2보다 작거나 같다.</c:if><br/><br/>
  <hr/>
  <b>다중조건비교(choose ~when~when~ otherwise)</b><br/>
  <c:choose>
    <c:when test="${su1+0 > su2}">su1이 더 크다</c:when>
    <c:when test="${su1+0 >= su2}">su1이 더 크거나 같다</c:when>
    <c:when test="${su1+0 < su2}">su1이 더 작다</c:when>
    <c:when test="${su1+0 <= su2}">su1이 더 작거나 같다</c:when>
    <c:when test="${su1+0 == su2}">su1이 같다</c:when>
    <c:when test="${su1+0 != su2}">su1이 같지않다</c:when>
    <c:otherwise>해당사항없음</c:otherwise>
  </c:choose>
  <br/><br/>
  점수할당 : <c:set var="jumsu" value="100"/>
  <c:choose>
    <c:when test="${jumsu > 90}"><c:set var="grade" value="A"/></c:when>
    <c:when test="${jumsu > 80}"><c:set var="grade" value="B"/></c:when>
    <c:when test="${jumsu > 70}"><c:set var="grade" value="C"/></c:when>
    <c:when test="${jumsu > 60}"><c:set var="grade" value="D"/></c:when>
    <c:otherwise><c:set var="grade" value="F"/></c:otherwise>
  </c:choose>
  <br/>
  학점은 <font color='red'><b>${grade}</b></font> 학점<br/>
  <hr/>
  <h3>반복문(forEach문)</h3>
  <p>문법1 : &lt;c:forEach var="변수" items="$ {배열/객체}"&gt;수행할 내용&lt;/c:forEach&gt;</p>
  <p>문법2 : &lt;c:forEach var="변수" begin="초기값" step="증감값" varStatus="인자"&gt;수행할 내용&lt;/c:forEach&gt;</p>
  <p>
  	1. 반복문 예 <br/>
  	<c:forEach var="no" begin="1" end="20" step="2" varStatus="st">
  		${no} .안녕 :&nbsp;
  	</c:forEach>
  </p>
  <p>
  	2. 반복문 예 <br/>
  	<c:forEach var="no" begin="10" end="20" step="2" varStatus="st">
  		${no} .안녕 : ${st.count }/ ${st.index }<br/>
  	</c:forEach>
  </p>
  <p>
  	3. 반복문 예 <br/>
  	<c:forEach var="no" begin="1" end="20" step="2" varStatus="st">
  		${no} .안녕 : ${st.first }/ ${st.last }<br/>
  	</c:forEach>
  </p>
  <p>
  	4. 반복문 예 <br/>
  	<%
  		UserDAO dao = new UserDAO();
  		List<UserVO> vos = dao.getUserList();
  		request.setAttribute("vos", vos);
  		/* 
  		for(UserVO vo: vos) {
  			out.println("성명 : " + vo.getName() + "<br/>");
  		}
  		 */
  	%>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		${st.count}. (인덱스 : ${st.index}) 성명 : ${vo.name} / 나이 : ${vo.age}<br/>
  	</c:forEach>
  </p>
  <p>
  	6. 반복문 예 <br/>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<c:if test="${st.first}">성명 : ${vo.name} / 나이 : ${vo.age}<br/></c:if>
  		<c:if test="${st.last}">성명 : ${vo.name} / 나이 : ${vo.age}<br/></c:if>
  	</c:forEach>
  </p>
  <p>
  	7. 반복문 예 <br/>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<c:if test="${st.count%2==0}">${st.count}. 성명 : ${vo.name} / 나이 : ${vo.age}<br/></c:if>
  	</c:forEach>
  </p>
  <p>
  	8. 반복문 예 (begin ~ end)<br/>
  	<c:set var="vosCnt" value="<%=vos.size() %>" />
  	<c:forEach var="vo" items="${vos}" begin="0" end="${vosCnt-1}" varStatus="st">
  		<c:if test="${st.count%2==0}">${st.count}. 성명 : ${vo.name} / 나이 : ${vo.age}<br/></c:if>
  	</c:forEach>
  </p>
  <p>
  	9. 이중반복구조<br/>
  	<c:set var="cnt" value="0" />
  	<c:forEach var="i" begin="1" end="5">
  		<c:forEach var="j" begin="1" end="3">
  			<c:set var="cnt" value="${cnt + 1 }"/>
  			${cnt }번째 / 
  		</c:forEach>
  	</c:forEach>
  </p>
  <hr/>
  <%
  	String hobbys = "등산/낚시/바둑/영화감상/수영";
  	pageContext.setAttribute("hobbys", hobbys);
  %>
  <p>토큰(특정 기호값)을 이용한 분리 : forTokens<br/>
  	취미 : 
  	<c:forTokens var="hobby" items="${hobbys}" delims="/">
  		${hobby} /
  	</c:forTokens>
  	
  <p/>
  <hr/>

  <p>문제 : 바둑 = 빨/ 수영=파<br/>
  	취미 : 
  	<c:forTokens var="hobby" items="${hobbys}" delims="/">
  		<c:if test="${hobby == '바둑'}"><font color="red">${hobby} </font>/</c:if>
  		<c:if test="${hobby == '수영'}"><font color="blue">${hobby} </font>/</c:if>
  		<c:if test="${hobby != '수영' && hobby != '바둑'}">${hobby} /</c:if>
  	</c:forTokens>
  	
  <p/>
  <hr/>
	  
</div>
<br/>
<%@ include file="/include/footer.jsp" %>
</body>
</html>








