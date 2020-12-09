<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <title>마이페이지</title>
      <%@include file="/common/include.jspf"%>
<script>
    var bDisplay = true;
    function doDisplay(){
    	var con = document.getElementById("myDIV");
    	if(con.style.display=='none'){
    		con.style.display = 'block';
    	}else{
    		con.style.display = 'none';
    	}
    }
</script>


<style>
ul, li{
   list-style:none;
   padding-left:0px;
   }
</style>
</head>
<%@include file="/common/header.jspf"%>
<body>
    <h2>회원정보 상세</h2>
<div class="container-fluid">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
					<ul>
						<li>
							<strong>일반상품 주문관리</strong>
								<ul class="parent_list">
									<li><a href="http://localhost:8080/biz/kyungnan/Order_Delivery%20_Tracking.jsp" >주문/배송조회</a></li>
									<li><a href="#n">나의 바로드림 수령점</a></li>
									<li><a href="http://localhost:8080/biz/kyungnan/Return.jsp">취소/교환/반품조회</a></li>
								</ul>
						<li>									
						<li ><a href="javascript:doDisplay();"><strong>나의 통장</strong></a>
							<ul id="myDIV">
								<li><a href="" >할인쿠폰</a></li>
								<li><a href="" >마일리지</a></li>
								<li><a href="" >주문/결제 정보 설정</a></li>
							</ul>
						</li>
						<li><a href="#n"><strong>문의내역</strong></a></li>
						<li> 
						 <ul>
							<li><a href="#n" >회원정보수정</a></li>
							<li><a href="#n" >비밀번호변경</a></li>
							<li><a href="#n" >회원등급조회/혜택안내</a></li>
							<li><a href="#n" >회원탈퇴</a></li>
						 </ul>
						</li>
					</ul>
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
       	      본문

      </div>
      
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
</body>
<%@include file="/common/footer.jspf"%>
</html>