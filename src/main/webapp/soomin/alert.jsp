<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("${requestScope.alert}");
	location.href = "${pageContext.request.contextPath}/${requestScope.path}";
		

	//document.location.href = "${requestScope.path}";
</script>
</head>
<body>
</body>
</html>