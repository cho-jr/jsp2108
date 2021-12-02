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
    	<h2></h2>
    	<table class="table">
		  <tbody>
		    <tr style="height:100px;">
		      <td class="align-baseline">baseline</td>
		      <td class="align-top">top</td>
		      <td class="align-middle">middle</td>
		      <td class="align-bottom">bottom</td>
		      <td class="align-text-top">text-top</td>
		      <td class="align-text-bottom">text-bottom</td>
		    </tr> 
		  </tbody>
		</table>
    </div>
    <br/>
    <%@ include file="/include/footer.jsp" %>
    
</body>
</html>