<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmList.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<p><br></p>
<div class="container">
  <table class="table table-hover">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>보낸사람</th>
      <th>메세지 제목</th>
      <th>받은날짜</th>
    </tr>
    <c:set var="mCount" value="${fn:length(vos)}"/>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${mCount}</td>
        <td>${vo.sendId}</td>
        <td>
          <a href="${ctp}/wmMessage.wm?mSw=6&idx=${vo.idx}">${vo.title}</a>
          <c:if test="${vo.receiveSw=='n'}"><img src="${ctp}/images/new.gif"/></c:if>
        </td>
        <td>${fn:substring(vo.receiveDate,0,10)}</td>
      </tr>
      <c:set var="mCount" value="${mCount - 1}"/>
    </c:forEach>
  </table>
</div>
<br/>
</body>
</html>