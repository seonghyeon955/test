<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 전송</title>
<%@include file="/common/include.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<style>
	body { margin: 5%; }
	a { color : black; }
</style>
<script>
	window.resizeTo(400, 300);
	
	function linkToOpener(URL){
		if (window.opener && !window.opener.closed){
			window.opener.location = URL;
		}
		window.close();
	}
	
	
</script>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<hr>
	<div class="col-xl-8 col-md-8 mb-8 bg-light padding">
		<div class="center">
		<c:choose>
			<c:when test="${result == 0 }">
				해당하는 회원정보를 찾을 수 없습니다!<br><br>
				<input type="button" class="btn btn-outline-danger" value="회원가입" onclick="linkToOpener('${pageContext.request.contextPath}/Jungha/mem_Signup.jsp')">
				<input type="button" class="btn btn-outline-danger" value="아이디 찾기" onclick="location.href='${pageContext.request.contextPath}/Jungha/findId.jsp'">
			</c:when>
			<c:otherwise>
				<strong>회원님의 이메일로 임시 비밀번호를 전송했습니다!</strong><br>
				해당 비밀번호로 로그인 후 비밀번호를 재설정 해주세요.<br>
				<br>
			</c:otherwise>
		</c:choose>
		<input type="button" class="btn btn-outline-danger" value="닫기" onclick="window.close();">
		</div>
	</div>
</body>
</html>