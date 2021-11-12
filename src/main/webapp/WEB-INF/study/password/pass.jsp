<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <%@ include file="../../../include/bs4.jsp" %>
    <script type="text/javascript">
	    function fCheck(idx) {
			var pwd = myform.pwd.value;
			if(pwd.trim() == "") {
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			} else {
				if(idx==1) {
					myform.action = "<%=request.getContextPath() %>/passwordOk";				
					myform.submit();					
				} else {
					myform.action = "<%=request.getContextPath() %>/passwordOk2";				
					myform.submit();
				}
				
			}
		}
    </script>
</head>
<body>
	<%@ include file="../../../include/header_guest.jsp" %>
    <%@ include file="../../../include/nav.jsp" %>
    <p><br/></p>
    <div class="container">
    	<h2>비밀번호 암호화 연습</h2>
    	<p>(비밀번호를 10자 이내로 입력하세요. )</p>
    </div>
    <form name="myform" method="post" action="<%=request.getContextPath() %>/passwordOk">
	    <table class="table table-bordred">
	    	<tr>
	    		<td>
	    			<p> 아이디 : <input type="text" name="mid" value="hkd1234" class="form-control"/></p>
	    			<p>비밀번호 : <input type="password" name="pwd" maxlength="9" class="form-control"/></p>
	    			<p><input type="button" value="확인(숫자 비밀번호)" onclick="fCheck(1)" class="form-control"/></p>
	    			<p><input type="button" value="확인(혼합 비밀번호)" onclick="fCheck(2)" class="form-control"/></p>
	    		</td>
	    	</tr>
	    </table>
	</form>
    <br/>
    <%@ include file="../../../include/footer.jsp" %>
    
</body>
</html>