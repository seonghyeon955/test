<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<%@include file="/common/include.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/jungJs/email.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<style>
	body { margin: 5%; }
	a { color : black; }
</style>
<script>
	window.resizeTo(600, 400);

	function findId(frm) {
		
		//이름 입력 여부
		var $name = $("#name");
		console.log("name : " + $name.val());
		if($name.val().trim() == ""){
			alert("이름을 입력해주세요!");
			$name.val("");
			$name.focus();
			
			return false;
		}
		
		//이메일 인증여부
		if(email_check != 1) {
			alert("이메일을 인증해주세요!");
			$("#email_f").focus();
			
			return false;
		}
		
		frm.action = "../findId.do";
		frm.submit();
	}
</script>
</head>
<body>
	<form method="post">
		<h3>아이디 찾기</h3>
		<hr>
			<table class="table table-borderless center">
		       	<tr>
		       		<th>이름</th>
		       		<td>
		       			<input type="text" id="name" class="hunper" name="user_name">
		       		</td>
		       	</tr>
		       	<tr>
		       		<th>이메일</th>
					<td>
						<div class="input-group-append">
							<input type="text" id="email_f" name="email_f" placeholder="이메일을 입력해주세요">
								<div class="input-group-text">@</div>
								<input type="text" id="email_b" name="email_b" size="17">
								<select id="email_select">
									<option value=0 selected>직접입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
								<input type="button" id="checkEmail" onclick="check_email()" value="인증코드 전송">
						</div>
						<div id="email_certification"></div>
						<span class="condition" id="emailResult"></span><br>
					</td>
		       	</tr>
		       	<tr>
		       		<td colspan="2">
		       			<input type="button" class="btn btn-outline-danger hunper" value="아이디 찾기" onclick="findId(this.form)">
		       		</td>
		       	</tr>
		       	<tr>
		       		<td colspan="2">
		       			<a href="findPwd.jsp">비밀번호 찾기</a>
		       		</td>
		       	</tr>
	       </table>
	</form>
</body>
</html>