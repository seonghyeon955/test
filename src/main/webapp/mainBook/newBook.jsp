<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8"> 
<title>신간도서 목록</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../resources/raeCss/css/header.css">
<link rel="stylesheet" href="../resources/raeCss/css/footer.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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

		
		<h4>신간도서</h4>
		<h6>이 주에 새로 들어온 도서 중 MD가 추천하는 목록입니다</h6>
		
		
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
			<form action="" class="side">
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
			<form action="">
				<select name="weekOpt" id="week" onchange="">
					<option value="0">1주</option>
					<option value="1">2주</option>
					<option value="2">3주</option>
					<option value="3">4주</option>
					<option value="4">5주</option>
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
					<td><img src="../resources/raeCss/images/다른방식으로보기.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">다른 방식으로 보기</a></h4>
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
					<td><img src="../resources/raeCss/images/레몬.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">레몬</a></h4>
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
					<td><img src="../resources/raeCss/images/아침에는죽음을.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">아침에는 죽음을 생각하는것이 좋다</a></h4>
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
					<td><img src="../resources/raeCss/images/자기만의방.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">자기만의 방</a></h4>
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
					<td><img src="../resources/raeCss/images/예감은틀리지않는다.jpg" width="150"></td>
					<td style="width: 55%">
						<p>책 간단 설명</p>
						<h4><a href="#">예감은 틀리지 않는다</a></h4>
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