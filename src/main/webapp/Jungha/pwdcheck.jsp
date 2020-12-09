<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<%@include file="/common/include.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<style>
	body { margin: 5%; }
	a { color : black; }
</style>
<script>
	function checkPwd(frm){
		
		var $pwd = $("#pwd");
		if($pwd.val().trim() == "") {
			alert("비밀번호를 입력해주세요!");
			$pwd.focus();
			
			return false;
		}
		
		window.opener.name ="parentPage";
		frm.target = "parentPage";
		frm.action ="../checkPwd.do?type=${param.type }";
		frm.submit();
		self.close();
	}
</script>
</head>
<body>
	<form method="post">
	<h3>비밀번호 확인</h3>
	<hr>
	<div class="col-xl-8 col-md-8 mb-8 bg-light padding center">
		<h5>비밀번호를 입력해주세요.</h5><br>
		<input type="password" name="pwd" id="pwd"><br><br>
		<input type="button" class="btn btn-outline-danger hunper" value="확인" onclick="checkPwd(this.form)">
	</div>
	</form>
</body>
</html>