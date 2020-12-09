<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script>
	var leave = confirm("정말 탈퇴하시겠습니까?");
	
	if("${param.type }" == "mem"){
		if(leave){
			location.href="${pageContext.request.contextPath}/memDelete.do";
		} else {
			location.href="${pageContext.request.contextPath}/mainBook/index.jsp"  //메인이나 회원정보로
		}
	} else if("${param.type }" == "store"){
		if(leave){
			location.href = "${pageContext.request.contextPath}/storeDelete.do";
		} else {
			location.href = "${pageContext.request.contextPath}/officeAdmin.do" // 메인이나 지점 정보 페이지로
		}
	}
</script>
</head>
<body>

</body>
</html>