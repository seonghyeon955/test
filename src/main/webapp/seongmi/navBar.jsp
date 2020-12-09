<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세페이지 화면</title>
<%@include file="/common/include.jspf"%>
<style type="text/css">
	#secondBanner {
		background-color: #9F5252;

	}
	a {
	  color: black;	  
	  text-decoration:none;
	}
	
	.centered {
        left: 50%; 
        margin-left: 420px;
      }
</style>
</head>

<body>
		
	<nav class="navbar navbar-expand-md">
	<div class="navbar-collapse collapse">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
			<!-- <a>매장안내&nbsp;&nbsp;<img src="../resources/images/pic/아래화살표.png" alt="아래" width=10px></a> -->
			<a class="nav-link dropdown-toggle h6" href="#" id="navbardrop" data-toggle="dropdown">
				매장안내
			</a>
			
		    <div class="dropdown-menu">
		        <a class="dropdown-item" href="#">Link 1</a>
		        <a class="dropdown-item" href="#">Link 2</a>
		        <a class="dropdown-item" href="#">Link 3</a>
		    </div>
		    </li>
		</ul>	
		
		<ul class="navbar-nav ml-auto">
		<li class="nav-item"><a class="nav-link" href="#"><button type="button" class="btn btn-outline-secondary btn-sm">로그인</button></a></li>
		<li class="nav-item"><a class="nav-link h6" href="#">회원가입</a></li>
		<li class="nav-item"><a class="nav-link h6" href="#">출석체크</a></li>
		<li class="nav-item"><a class="nav-link h6" href="#">고객센터</a></li>
		<li class="nav-item"><a class="nav-link h6" href="#">주문배송</a></li>
		<li class="nav-item">
		<a href="cart.jsp">
			<img src="../resources/images/pic/장바구니사진.png" alt="장바구니사진" width=30px>
			
			<!-- ******    장바구니 개수 수정되도록 작업해야함   ****** -->
			<span class="badge badge-pill badge-danger">1</span>
		</a>
		</li>
		</ul>
	</div>
	</nav>
	
	
	<nav class="navbar navbar-expand-md">
		<ul class="nav justify-content-start">
			<li class="nav-item">
				<a class="nav-link" href="#">
        		<img src="../resources/images/pic/비트문고.png" alt="비트문고로고" width="160px">
				</a>
			</li>
		</ul>
		
		<ul class="nav nav-tabs centered">
			<li class="nav-item">
				<div class="col-sm-15">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"/>
				</div>
           	</li>
           	<li>&nbsp;&nbsp;</li>
           	<li class="nav-item">
           		<button type="button" class="btn btn-outline-dark">검색</button>
           	</li>
		</ul>
	</nav>

	<nav class="navbar navbar-expand-md" id="secondBanner">
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		    <ul class="navbar-nav">
		     <li class="nav-item"></li>
		     <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        <img src="../resources/images/pic/세줄.png" height="80px">
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#">Link 1</a>
			        <a class="dropdown-item" href="#">Link 2</a>
			        <a class="dropdown-item" href="#">Link 3</a>
			      </div>
			    </li>
		    </ul>
			<ul class="navbar-nav">

				<li class="nav-item"><a class="nav-link text-white h5" href="#">국내도서</a></li>
				<li class="nav-item"><a class="nav-link text-white h5" href="#">외국도서</a></li>
				<li class="nav-item"><a class="nav-link text-white h5" href="#">ebook</a></li>
				<li class="nav-item"><a class="nav-link text-white h5" href="#">웹소설</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
					<li class="a nav-item"><a class="nav-link text-white h5" href="#">베스트</a></li>
					<li class="a nav-item"><a class="nav-link text-white h5" href="#">스테디</a></li>
					<li class="a nav-item"><a class="nav-link text-white h5" href="#">이벤트</a></li>
					<li class="a nav-item"><a class="nav-link text-white h5" href="#">사은품</a></li>
			</ul>
		</div>
	</nav>
	<br>
		<span style="padding-left:50px">홈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../resources/images/pic/옆화살표.png" alt="화살표" width="10px">
		<select id="categMain">
			<option selected disabled>국내도서	</option>
			<option>외국도서</option>
			<option>ebook</option>
			<option>웹소설</option>
		</select>
		</span>
		&nbsp;&nbsp;&nbsp;&nbsp;<img src="../resources/images/pic/옆화살표.png" alt="화살표" width="10px">
		<select id="categMid">
			<option>소설</option>
			<option>시/에세이</option>
			<option>역사/문화</option>
			<option>종교</option>
			<option>예술/대중문화</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;<img src="../resources/images/pic/옆화살표.png" alt="화살표" width="10px">
		<select id="cateName">
			<option>한국소설</option>
			<option>영미소설</option>
			<option>프랑스소설</option>
		</select>
		<hr>
		<br><br><br><br>
		
		
</body>
</html>