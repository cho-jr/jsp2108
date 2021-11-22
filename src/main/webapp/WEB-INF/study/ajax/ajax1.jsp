<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <%@ include file="/include/bs4.jsp" %>
    <script>
    	function idCheck() {
    		var mid = myform.mid.value;
    		if(mid=="") {
    			alert("아이디를 입력하세요. ");
    			myform.mid.focus();
    			return false;
    		}
    		
    		var query = {
    			mid : mid
    		}
    		
    		// alert("입력된 아이디 : " + mid);
    		// $.ajax({키: 값, 키: 값});
    		$.ajax({
    			type : "get", 
    			url : "${ctp}/ajax1Ok", 
    			//data : {mid : 'hkd1234', age : 22, ...}
    			data : query, 
    			success : function(data) {
    				// 성공적으로 ajax 처리 끝내고 돌아왔을 경우 수행
    				if(data == "") {
	    				alert("검색된 성명이 없습니다. ");
    				} else {
	    				alert("검색된 성명은 : " + data);
    				}
    			}, 
    			error : function(data) {
    				// 처리 실패 후 돌아왔을 경우 수행
    				alert("검색시 오류 발생");
    			}
    		});
    		
    	}
    	
    	// ajax로 User 등록시키기
    	function inputCheck() {
    		var name = $("#name").val();
    		var age = $("#age").val();
    		
    		var query = {
    			name : name, 
    			age : age
    		};
    		
    		$.ajax({
    			type : "post", 
    			url : "${ctp}/userInput", 
    			data : query, 
    			success : function(data) {
    				if(data == "1") {
    					alert("등록 성공");
    				}	
    			}
    		});
    	}
    	// 전체 조회
    	function listCheck() {
    		$.ajax({
    			type : "post", 
    			url : "${ctp}/userList", 
    		//	data : query,
    			success : function(data) {
    				alert("vos : " + data);
    				
    				
    			}
    		});
    	}
    </script>
</head>
<body>
	<%@ include file="/include/header_home.jsp" %>
    <%@ include file="/include/nav.jsp" %>
    <p><br/></p>
    <div class="container">
    	<h2>Ajax 연습</h2>
    	<form name="myform">
    		아이디 : <input type="text" name="mid" />
    		<input type="button" value="아이디 검색" onclick="idCheck()" />
    	</form>
    	<br/>
    	<form name="inputForm">
    		<table class="table table-hover">
    			<tr>
    				<td colspan="2"><h3>User 가입</h3></td>
    			</tr>
    			<tr>
    				<td>성명</td>
    				<td><input type="text" id="name" value="홍길동" class="form-control" autofocus required/></td>
    			</tr>
    			<tr>
    				<td>나이</td>
    				<td><input type="number" id="age" value="20" class="form-control" /></td>
    			</tr>
    			<tr style="text-align: center;">
    				<td colspan="2">
	    				<input type="button" value="등록" onclick="inputCheck()" class="btn btn-secondary" />
	    				<input type="reset" value="취소" class="btn btn-secondary" />
	    				<input type="button" value="User 전체 조회" onclick="listCheck()" class="btn btn-secondary" />
    				</td>
    			</tr>
    		</table>
    	</form>
    	<hr/>
    	<h2>User 전체 리스트</h2>
    	<table class="table">
    		<tr>
    			<th>번호</th>
    			<th>성명</th>
    			<th>나이</th>
    		</tr>
    		<c:forEach var="vo" items="${vos }">
	    		<tr>
					<td>${vo.idx }</td>    		
					<td>${vo.name }</td>    		
					<td>${vo.age }</td>    		
	    		</tr>
    		</c:forEach>
    	</table>
    </div>
    <br/>
    <%@ include file="/include/footer.jsp" %>
    
</body>
</html>