<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8"> 
<title>스테디셀러</title>
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
		
		<h4>스테디셀러</h4>
		<h6>지니문고에서 꾸준한 사랑을 받고 있는 도서입니다</h6>
		
		<table border>
			<tr>
				<td>
					<input type="button" value="국내도서">
				</td>
				<td rowspan="3" style="width: 600px">
					도서 카테고리<br><br><br><br><br><br><br><br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="외국도서">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="ebook">
				</td>
			</tr>
		</table>
		
		<div>
			<span class="side">(카테고리명)</span>
			<form action="">
				<select name="viewOpt" id="show" onchange="">
					<option value="0">5개씩 보기</option>
					<option value="1">10개씩 보기</option>
					<option value="2">20개씩 보기</option>
				</select>
			</form>

		</div>

		<!-- 제이쿼리에서 자동차 견적 실습 참고 -->
		<div>
			<table border>
				<tr>
					<td style="width: 10%"><h1>1</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/책1.png" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">책1</a></h4>
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
					<td style="width: 10%"><h1>2</h1></td>
					<td style="width: 5%">
						<input type="checkbox" value="책정보" id="opt1" class="opt" name="opt1">
					</td>
					<td><img src="../resources/raeCss/images/책2.png" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">책2</a></h4>
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
					<td><img src="../resources/raeCss/images/책3.png" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">책3</a></h4>
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
					<td><img src="../resources/raeCss/images/책4.png" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">책4</a></h4>
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
					<td><img src="../resources/raeCss/images/책5.png" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">책5</a></h4>
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


<div>
<%@include file="/common/footer.jspf"%>
</div>
</body> 
</html>