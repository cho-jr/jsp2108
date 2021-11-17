<%@page import="member.MemberVO"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <%@ include file="/include/bs4.jsp" %>
</head>
<body>
	<%@ include file="/include/header_home.jsp" %>
    <%@ include file="/include/nav.jsp" %>
    <p><br/></p>
    <div class="container">
    	<h2>JSTL(Java Stander Tag Library)</h2>
     	<table>
     		<tr>
     			<th>라이브러리 명</th>
     			<th>주소(URL)</th>
     			<th>접두어(Prefix)</th>
     			<th>문법</th>
     		</tr>
     		<tr>
     			<td>Core</td>
     			<td>http://java.sun.com/jsp/jstl/core</td>
     			<td>c</td>
     			<td>< c : 태그... ></td>
     		</tr>
     		<tr>
     			<td>Function</td>
     			<td>http://java.sun.com/jsp/jstl/functions</td>
     			<td>fn</td>
     			<td>{fn : 태그..}</td>
     		</tr>
     		<tr>
     			<td>Formatting</td>
     			<td>http://java.sun.com/jsp/jstl/fmt</td>
     			<td>fmt</td>
     			<td>< fmt : 태그... ></td>
     		</tr>
     		<tr>
     			<td>SQL</td>
     			<td>http://java.sun.com/jsp/jstl/sql</td>
     			<td>sql</td>
     			<td>< sql : 태그... ></td>
     		</tr>
     	</table>
     	<hr/>
     	<h3>Core라이브러리 : 변수제어(선언/ 할당), 제어문/반복문</h3>
     	<p>변수 선언 : < c:set var="변수명" value="값"/></p>
     	<p>변수(값) 출력: < c:out value="변수/값"/></p>
     	<p>변수 제거: < c:remove var="변수명"/> 설정한 변수를 메모리에서 제거한다. </p>
     	<p>예외처리 : < c : catch 문장 ... /></p>

     	<%-- su1 변수 선언: < c:set var="su1" value="500"/>  아래 줄과 동일--%>
     	su1 변수 선언: <c:set var="su1">500</c:set>
     	'100' 값 출력: <c:out value="100"/><br/>
     	su1 값 출력: <c:out value="${su1}"/><br/>
     	<%String name = "홍길동"; %>
     	<c:set var="name" value="<%=name %>" />
     	name : ${name}<br/>
     	
     	<hr/>
     	<h3>jstl core 라이브러리 응용</h3>
     	<p>연산</p>
     	< c:set var="su2" value="100" /> <br/>
     	su1 + su2 : ${su1 + su2 }<br/>
     	su1 + su2 : <c:out value="${su1 + su2 }"/><br/>
     	<hr/>
     <%
   		MemberVO vo = new MemberVO();  	
     	vo.setName("홍길동");
     	vo.setAddress("서울");
     	vo.setEmail("a567@gmail.com");
     	request.setAttribute("vo", vo);
     	
   	%>
   		VO 객체의 name : ${vo.name }<br/>
   		VO 객체의 Address : ${vo.address }<br/>
   		VO 객체의 email : ${vo.email }<br/>
   		<c:set var="name" value="${vo.name }"/>
   		name : ${name }
   		
   		<h4>vo 객체의 name 필드에 '김말숙'을 저장시켜보자. </h4>
   		<c:set target="${vo }" property="name" value="김말숙" />
   		저장된 vo객체의 name 필드 값은? ${vo.name } 또는 <%=vo.getName() %><br/>
    </div>
    <br/>
    <%@ include file="/include/footer.jsp" %>
    
</body>
</html>