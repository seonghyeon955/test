<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 로그인</title>
<%@include file="/common/include.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<style>
	body { margin: 5%; }
	a { color : black; }
</style>
<script>
	function store_login(frm) {
		window.opener.name = "parentPage"; // 부모창의 이름 설정
		frm.target = "parentPage"; // 타켓을 부모창으로 설정
		frm.action = "../store_login.do";
		frm.submit();
		self.close();	
	}
	
	function store_signup() {
		window.opener.location.href="${pageContext.request.contextPath}/Jungha/store_Signup.jsp";
		self.close();	
	}
</script>
</head>
<body>
	<form name="login_frm" method="post">
		<h3>지점 로그인</h3>
		<hr>
	       <table class="table table-borderless" class="center">
	       	<tr>
	       		<th>아이디</th>
	       		<td>
	       			<input type="text" id="id" name="store_code">
	       		</td>
	       	</tr>
	       	<tr>
	       		<th>비밀번호</th>
	       		<td>
	       			<input type="password" id="pwd" name="store_pwd">
	       		</td>
	       	</tr>
	       	<tr>
	       		<td colspan="2">
	       			<input type="button" class="btn btn-outline-danger hunper" value="로그인" onclick="store_login(this.form)">
	       		</td>
	       	</tr>
	       	<tr>
	       		<td>
	       		</td>
	       		<td>
	       			<a href="javascript:store_signup()">지점 회원가입</a>
	       		</td>
	       	</tr>
	       </table>
	</form>
</body>
</html>