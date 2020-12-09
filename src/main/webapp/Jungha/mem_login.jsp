<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>
<%@include file="/common/include.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
<%@include file="/resources/css/header.css"%>
<%@include file="/resources/css/footer.css"%>
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<script>
	function storeLogin_popup(){
		window.open("${pageContext.request.contextPath}/Jungha/store_login.jsp", "지점 로그인", "width=350, height=250, left=100, top=50");
	}
	function findId_popup(){
		window.open("${pageContext.request.contextPath}/Jungha/findId.jsp", "아이디 찾기", "width=600, height=300, left=100, top=50");
	}
	function findPwd_popup(){
		window.open("${pageContext.request.contextPath}/Jungha/findPwd.jsp", "비밀번호 찾기", "width=600, height=300, left=100, top=50");
	}
	
</script>
</head>
<body>
	<div class="container-fluid mainPage">
	<%@include file="/common/header.jspf"%>
	<%@include file="/common/menuBar.jspf"%>
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-sm-4">
        	<form action="${pageContext.request.contextPath}/login1.do" name="login_frm" method="post">
				<h3>로그인</h3>
				<hr>
		        <table class="table table-borderless center">
		        	<tr>
		        		<th>아이디</th>
		        		<td>
		        			<input type="text" id="id" name="id">
		        		</td>
		        	</tr>
		        	<tr>
		        		<th>비밀번호</th>
		        		<td>
		        			<input type="password" id="pwd" name="pwd">
		        		</td>
		        	</tr>
		        	<tr>
		        		<td colspan="2">
		        			<input type="submit" class="btn btn-outline-danger hunper" value="로그인">
		        		</td>
		        	</tr>
		        </table>
		        <table class="table table-borderless center">
		        	<tr>
		        		<td>
		        			<a href="${pageContext.request.contextPath}/Jungha/mem_Signup.jsp">회원가입</a>
		        		</td>
		        		<td>
		        			<a href="#" onclick="storeLogin_popup()">관리자 로그인</a>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td>
		        			<a href="#" onclick="findId_popup()">아이디 찾기</a>
		        		</td>
		        		<td>
		        			<a href="#" onclick="findPwd_popup()">비밀번호 찾기</a>
		        		</td>
		        	</tr>
		        </table>
			</form>
        </div>
        <div class="col-sm-4">
        
        </div>
        
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
<%@include file="/common/footer.jspf"%>
</body>
</html>