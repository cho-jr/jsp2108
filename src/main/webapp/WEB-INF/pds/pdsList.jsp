<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
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
    	<table class="table">
    		<tr>
    			<td colspan="2"><h2>자료실 리스트</h2></td>
    		</tr>
    		<tr>
    			<td class="text-left">
    				<form name="partForm">
    					<select name="part" onchange="partCheck()" class="form-control">
    						<option value="전체">전체</option>
    						<option value="학습">학습</option>
    						<option value="여행">여행</option>
    						<option value="음식">음식</option>
    						<option value="기타">기타</option>
    					</select>
    				</form>
    			</td>
    			<td><a href="" class="btn btn-outline-secondary btn-sm">자료 올리기</a></td>
    		</tr>
    	</table>
    	<table>
    		<tr>
    			<td>번호</td>
    			<td>자료 제목</td>
    			<td>올린이</td>
    			<td>올린 날짜</td>
    			<td>파일명</td>
    			<td>다운로드 수</td>
    			<td>비고</td>
    		</tr>
    		<c:forEach var="vo" items="${vos}">
    			<tr>
    				<td>${vo.idx}</td>
    				<td>${vo.title}</td>
    				<td>${vo.nickName}</td>
    				<td>${vo.fDate}</td>
    				<td>${vo.fName}</td>
    				<td>${vo.downNum}</td>
    				<td><a href="#" class="btn btn-outline-secondary btn-sm">삭제</a></td>
    			</tr>
    		</c:forEach>
    	</table>
    </div>
    <br/>
    <%@ include file="/include/footer.jsp" %>
    
</body>
</html>