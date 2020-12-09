<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인</title>
	<%@include file="/common/include.jspf"%>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
	<script>
		function pwdcheck_popup(str){
			window.open("${pageContext.request.contextPath}/Jungha/pwdcheck.jsp?type="+str, "비밀번호 확인", "width=350, height=250, left=100, top=50");
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
       	<h1>임시메인</h1><br>
       	<input type="button" value="회원 정보 수정" onclick="pwdcheck_popup('mem_update')"><br>
       	<input type="button" value="회원 탈퇴" onclick="pwdcheck_popup('mem_delete')"><br>
       	<input type="button" value="지점정보 수정" onclick="pwdcheck_popup('store_update')"><br>
       	<input type="button" value="지점 탈퇴" onclick="pwdcheck_popup('store_delete')"><br>
        
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
<%@include file="/common/footer.jspf"%>
</body>
</html>