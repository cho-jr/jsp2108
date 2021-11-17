<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>adMemberList.jsp</title>
    <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
    <p><br/></p>
    <div class="container">
    	<h2>전체 회원 리스트</h2>
    	<br/>
    	<table class="table table-hover">
    		<tr class="table-success">
    			<th>번호</th>
    			<th>아이디</th>
    			<th>별명</th>
    			<th>성명</th>
    			<th>성별</th>
    			<th>방문횟수</th>
    			<th>최종 접속일</th>
    			<th>등급</th>
    			<th>정보 공개</th>
    			<th>탈퇴 유무</th>
    		</tr>
    		<c:forEach var="vo" items="${vos}" >
    			<tr>
    				<td>${vo.idx}</td>
    				<td>${vo.mid}</td>
    				<td>${vo.nickName}</td>
    				<td>${vo.name}</td>
    				<td>${vo.gender}</td>
    				<td>${vo.visitCnt}</td>
    				<td>${vo.lastDate}</td>
    				<td>${vo.level}</td>
    				<td>${vo.userInfor=='비공개'?'<font color=blue>비공개</font>':'<font color=blue>공개</font>'}</td>
    				<td>${vo.userDel=='OK'?'<font color=red>탈퇴신청</font>':'<font color=blue>활동중</font>'}</td>
    			</tr>
    		</c:forEach>
    	</table>
    </div>
    <br/>
</body>
</html>