<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1. 회원 바로구매 바로드림
<form method="post" action="orderStep0.do">
	<label><input type="text" name="orderbook_no" value="1">선택1</label><!-- value는 책의 기본키 -->
	<input type="text" name="orderbook_cnt" value="6">
	<input type="text" name="store_code" value="store1">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br><hr>

2. 회원 바로구매 온라인
<form method="post" action="orderStep0.do">
	<label><input type="text" name="orderbook_no" value="2">선택1</label><!-- value는 책의 기본키 -->
	<input type="text" name="orderbook_cnt" value="6">
	<input type="text" name="store_code" value="online">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br><hr>
3. 회원 장바구니 바로드림
<form method="post" action="orderStep0.do">
	선택1<!-- value는 책의 기본키 -->
	<input type="text" name="ordercart_idx" value="24">
	<input type="text" name="ordercart_idx" value="25">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br><hr>
4. 회원 장바구니 온라인
<form method="post" action="orderStep0.do">
	선택1<!-- value는 책의 기본키 -->
	<input type="text" name="ordercart_idx" value="22">
	<input type="text" name="ordercart_idx" value="23">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br><br><hr>
</body>
</html>