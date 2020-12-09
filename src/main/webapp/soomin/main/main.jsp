<%@page import="org.omg.CORBA.Request"%>
<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@page import="com.bit.bookstore.vo.GoodsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<%@include file="../../common/include.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ordermain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodsSelect.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<script src="${pageContext.request.contextPath}/resources/js/goodsSelect.js"></script>
<script>
	location.href="${pageContext.request.contextPath}/main.do";
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
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
         
         
         

        </div>
      
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>



</body>
</html>