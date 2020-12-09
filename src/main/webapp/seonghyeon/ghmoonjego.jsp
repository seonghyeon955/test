<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
	#bookinfo {
		font-size:1.5em;
		font-weight:bold;
	}
	
	#bookEtc li {
		list-style:none;
		display:inline-block;
		border-right: 0.3px solid black;
		padding-right:10px;
		padding-left:10px;
	}
	#bookEtc li:last-child{
		border-right:none;
	}
</style>
<body>
	<p>
	<img src="/biz/resources/images/pic/logo.png" alt="로고" style="width:200px; float:left">
	<span style="float:right;">02) 888-8282</span></p>
	<br><br>
	<hr><br>
	<%-- <c:if test="${not empty bookVo }"> --%>
		<div id="bookinfo">
		<p>[인문]${param.book_name }</p>
			<ul id="bookEtc">
				<li>${param.book_writer }</li>
				<li>${param.book_publisher }</li>
				<li>${param.book_published_date }</li>
				<li>${param.book_saleprice }원</li>
			</ul>
		<hr>
		<p>재고 : 
			${param.cnt }
		부(*재고는 실시간으로 변경)</p>
		<hr>
		<p>도서위치 : ●</p>
	</div>
	<%-- </c:if> --%>
	<img src="/biz/resources/images/pic/map.gif" alt="지도" 
		style="width:500px; padding-left:30px;">
	<hr>
	<img src="/biz/resources/images/pic/barcode.png" alt="바코드" 
		style="width:500px; padding-left:30px;">
	<p style="text-align:center; font-size:1.5em;">ISBN ${param.book_isbn } </p>
	
	
</body>
</html>