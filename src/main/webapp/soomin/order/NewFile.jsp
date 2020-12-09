<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 화면</title>
<%@include file="/common/include.jspf" %>
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/footer.css">
<link rel="stylesheet" href="../resources/css/ordermain.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
      p { margin:40px 0px; }
      	#jangbaguni {
		font-size:3em;
		padding-left: 95px;
		color:white;
	}
	#jumunhasil {
		color:white;
		padding-top: 40px;
	}
	#second_right {
		color: gray;
		
	}
	#nav-menu ul li {
		margin: 0px 10px;
	}
	#second_right ul li {
		float:right;
		padding-left:0px;
	}
	#nav-menu ul li:first-child {
		color:white;
	}
	
	.navbar-nav {
		height: 80px;
	}
	
	#grayBanner {
		color:black;
		background-color: #BABABA;
		height:50px;
	}
	#grayBanner li {
		list-style-type:none;
		display:inline;
		border-right: 0.3px solid gray;
		padding: 0px 15px 0px 15px;
		
	}
	
	#grayBanner ul li:last-child{
		border-right: none;
	}
	#grayBanner ul {
		padding-left:100px;
		padding-bottom: 20px;
		padding-top: 10px;
	}
	.space-img {
	   vertical-align: middle;
	   width: 0;
	   height: 0;
	   border-left: 40px solid #9F5252;
	   border-top: 40px solid transparent;
	   border-bottom: 40px solid transparent;
	}
	
	.nav-menu {
		float:right;
	}
	
	.nav-menu .order-img {
	   vertical-align: middle;
	   width: 80px;
	   height: 80px;
   
}
      
</style>
</head>


<body>


<div class="container-fluid mainPage">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
        
        <%@include file="../../common/header.jspf"%>
        
        
        
        <div class="container-fluid">
        
					<div class="row">
					    <div class="col-sm-4 order_bar">
					      	회원결제
					    </div>
					    <div class="col-sm-8 order_bar">
					    	<div class="align-left">
								
								<img class="order-img" alt="장바구니이미지" src="img/cartImage.png">
								<span class="space-img"></span>
								<img class="order-img" alt="사은품이미지" src="img/goodsImage.png">
								<span class="space-img"></span>
								<img class="order-img" alt="결제이미지" src="img/BuyImage.png">
									
								<span class="bg-light">
									<span class="space-img"></span>
									<img class="order-img" alt="피니쉬이미지" src="img/finishBlackImage.png">
								</span>
							
							</div>
						</div>
					</div>
				</div>
        
        
	<nav>
		<div id="grayBanner">
			<ul>
				<li>000님의(골드) 통장현황</li>
				<li>쿠폰 : 0장</li>
				<li>통합포인트 : 0,000P</li>
			</ul>
		</div>
	
	</nav>
	<br>
        
        
        
        
      <div class="row">
        <div class="col">
          <br>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">일반구매(상품갯수)</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">바로드림(상품갯수)</a>
              </li>
              
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
              	<br><br>
                <input type="checkbox"> 전체선택 &nbsp;&nbsp;<input type="button" value="삭제">
                <br><br><br><br>
                 <input type="checkbox"> 지니일반배송(상품갯수) &nbsp;&nbsp;<input type="button" value="바로드림 이동">
                 <br><br>
                 <table border>
                 	<tr>
                 		<th style="width:800px;">
                 			상품정보
                 		</th>
                 		<th style="width:200px;">
                 			판매가
                 		</th>
                 		<th style="width:50px;">
                 			수량
                 		</th>
                 		<th style="width:200px;">
                 			합계
                 		</th>
                 	</tr>
					<tr>
						<td>
							<input type="checkbox"> &nbsp;<img src="../common/resources/images/pic/bookp.jpg" style="width:100px">
							[국외도서] 심판
							<br><br>
							<input type="button" value="새창보기">
						</td>
						<td>
							<p style="text-decoration:line-through">18,000원(원가) </p>
							<p>판매가격[00% ↓]</p>
							<p>000P</p>
						</td>
						<td><input type="number" value="1" style="weight:5px">
							<input type="button" value="변경">
						</td>
						<td>
							00,000원(합계)
						</td>
					</tr>                 	
                 </table>
                 <br>
                 <hr>
                 <br>
                 <input type="checkbox">&nbsp;전체선택&nbsp;&nbsp;<input type="button" value="삭제">
              </div>
              <div class="tab-pane fade" id="asd">
                <p>바로드림내용</p>
              </div>
              <br>
              <table border>
              	<tr>
              		<th>상품금액</th>
              		<th>배송비</th>
              		<th>결제 예정금액</th>
              		<th>적립예정</th>
              		<th>000원P</th>
              	</tr>
              	<tr>
              		<td>00,000원</td>
              		<td>0원(배송비)</td>
              		<td>00,000원(결제예정)</td>
              		<td>
              			<p>기본적립</p>
              			<p>추가적립</p>
              			<p>회원혜택</p>
              		</td>
              		<td>
              			<p>000원P</p>
              			<p>0원P</p>
              			<p>0원P</p>
              		</td>
              	</tr>
              </table>
              
            </div><!-- tabcontent end -->
        </div><!-- col div end -->
      </div>
   
 </div>
      
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>


	
	






<%-- <%@include file="/common/footer.jspf" %> --%>
</body>
</html>