<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8"> 
<title>월간베스트셀러</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@include file="/common/include.jspf"%>

<link rel="stylesheet" href="../resources/raeCss/css/header.css">
<link rel="stylesheet" href="../resources/raeCss/css/footer.css">
<style>
	.side {float: left;}
</style> 
<script> 



</script> 

</head> 
<body> 
<%@include file="/common/header.jspf"%>
<%@include file="/common/menuBar.jspf"%>
<%@include file="/common/bookClass.jspf"%>
<div class="container-fluid mainPage">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
		
		<h4>월간 베스트셀러</h4>
		<h6>지니문고에서 도서와 ebook을 합산하여 한달동안 가장 많이 판매가 된 순위입니다</h6>
		
		<table border>
			<tr>
				<td>
					<input type="button" value="월간베스트">
				</td>
				<td rowspan="2" style="width: 600px">
					도서 카테고리<br><br><br><br><br><br><br><br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="연간베스트">
				</td>
			</tr>
		</table>
		
		<div>
			<span class="side">(카테고리명)</span>
			<span class="side">집계기준: 2020/09/01~2020/09/30</span>
			<form action="" class="side">
				<select name="viewOpt" id="show" onchange="">
					<option value="0">5개씩 보기</option>
					<option value="1">10개씩 보기</option>
					<option value="2">20개씩 보기</option>
				</select>
			</form>
			<form action="" class="side">
				<select name="yearOpt" id="year" onchange="">
					<option value="0">2020</option>
				</select>
			</form>
			<form action="">
				<select name="monthOpt" id="month" onchange="">
					<option value="0">1월</option>
					<option value="1">2월</option>
					<option value="2">3월</option>
					<option value="3">4월</option>
					<option value="4">5월</option>
					<option value="5">6월</option>
					<option value="6">7월</option>
					<option value="7">8월</option>
					<option value="8">9월</option>
					<option value="9">10월</option>
					<option value="10">11월</option>
					<option value="11">12월</option>
				</select>
			</form>


		<div>
		<form action="getBookList.do" method="post">
			<input type="hidden" name="book_no" value="2">
			<table border>
				<tr>
					<td style="width: 10%"><h1>1</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/여름.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">${book.book_name }</a></h4>
						<p>${book.book_writer } | ${book.book_publisher } | ${book.book_published_date }</p>
						<p><img src="../resources/raeCss/images/starating_5.gif"></p>
						<p>가격</p>
						<p>지금 주문하면 내일도착</p>
					</td>
					<td>
						<input type="submit" value="장바구니담기"><br>
						<input type="submit" value="바로구매">
					</td>
				</tr>
			</table>
			</form>
			
			<table border>
				<tr>
					<td style="width: 10%"><h1>2</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/설득.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">설득</a></h4>
						<p>작가 | 출판사 | 출판일</p>
						<p><img src="../resources/raeCss/images/starating_5.gif"></p>
						<p>가격</p>
						<p>지금 주문하면 내일도착</p>
					</td>
					<td>
						<input type="submit" value="장바구니담기"><br>
						<input type="submit" value="바로구매">
					</td>
				</tr>
			</table>
			
			<table border>
				<tr>
					<td style="width: 10%"><h1>3</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/모순.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">모순</a></h4>
						<p>작가 | 출판사 | 출판일</p>
						<p><img src="../resources/raeCss/images/starating_5.gif"></p>
						<p>가격</p>
						<p>지금 주문하면 내일도착</p>
					</td>
					<td>
						<input type="submit" value="장바구니담기"><br>
						<input type="submit" value="바로구매">
					</td>
				</tr>
			</table>
			
			<table border>
				<tr>
					<td style="width: 10%"><h1>4</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/비행운.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">비행운</a></h4>
						<p>작가 | 출판사 | 출판일</p>
						<p><img src="../resources/raeCss/images/starating_5.gif"></p>
						<p>가격</p>
						<p>지금 주문하면 내일도착</p>
					</td>
					<td>
						<input type="submit" value="장바구니담기"><br>
						<input type="submit" value="바로구매">
					</td>
				</tr>
			</table>
			
			<table border>
				<tr>
					<td style="width: 10%"><h1>5</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/에마.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">에마</a></h4>
						<p>작가 | 출판사 | 출판일</p>
						<p><img src="../resources/raeCss/images/starating_5.gif"></p>
						<p>가격</p>
						<p>지금 주문하면 내일도착</p>
					</td>
					<td>
						<input type="submit" value="장바구니담기"><br>
						<input type="submit" value="바로구매">
					</td>
				</tr>
			</table>
		</div>

		<h2>페이징처리</h2>
      
      </div>
      
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
    
</div>
</div>

<div>
<%@include file="/common/footer.jspf"%>
</div>
</body> 
</html>