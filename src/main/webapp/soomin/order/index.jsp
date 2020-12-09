<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(selectBook){
		selectBook.action = "orderStep0.do";
		selectBook.submit();
	}
	
	function login(){
		location.href="login.do";
	}
	
	function NonMember(){
		location.href="nonMember.do";
	}
</script>
</head>
<body>
<a href="orderStep0.do">사은품 선택 페이지로</a><br><hr>

<input type="button" value="로그인(genie)" onclick="login()"><br><hr>
<input type="button" value="비회원장바구니 담기버튼" onclick="NonMember()">
5. 비회원 바로구매 바로드림
<form method="post" action="orderStep0.do">
	<input type="text" name="orderbook_no" value="1"><!-- value는 책의 기본키 -->
	<input type="text" name="orderbook_cnt" value="2">
	<input type="hidden" name="store_code" value="store1">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br>
6. 비회원 바로구매 온라인
<form method="post" action="orderStep0.do">
	<input type="text" name="orderbook_no" value="2"><!-- value는 책의 기본키 -->
	<input type="text" name="orderbook_cnt" value="1">
	<input type="hidden" name="store_code" value="online">
	<input type="submit" value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br>





7. 비회원 장바구니 바로드림<br>

비회원장바구니는 리스트 cartvo로 저장<br><br>


<form method="post" action="orderStep0.do">
	<input type="text" name="NonMemberBook_no" value="1"><!-- value는 책의 기본키 -->
	<input type="text" name="NonMemberBook_no" value="2">
	<input type="hidden" name="store_code" value="store1">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form><br>
8. 비회원 장바구니 온라인
<form method="post" action="orderStep0.do">
	<input type="text" name="NonMemberBook_no" value="1"><!-- value는 책의 기본키 -->
	<input type="text" name="NonMemberBook_no" value="21">
	<input type="hidden" name="store_code" value="online">
	<input type="submit"  value="책선택 완료, 사은품 선택하러 ㄱ">
</form>

<hr><hr><hr>


바로구매
<form method="post">
	<label><input type="checkbox" name="orderbook_no" value="1">선택1</label><!-- value는 책의 기본키 -->
	<input type="text" name="orderbook_cnt" value="6">
	<input type="hidden" name="store_code" value="online">
	<input type="button" onclick="send(this.form)" value="책선택 완료, 사은품 선택하러 ㄱ">
</form>
장바구니에서 구매
<form method="post">
	<label><input type="checkbox" name="orderbook_no" value="1">선택1</label><!-- value는 책의 기본키 -->
	<input type="text" name="orderbook_cnt" value="3">
	<input type="button" onclick="send(this.form)" value="책선택 완료, 사은품 선택하러 ㄱ">
</form>
</body>
</html>