<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용페이지</title>

  <%@include file="/common/include.jspf"%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<style>
	<%@include file="/resources/css/header.css"%>
	<%@include file="/resources/css/footer.css"%>
</style>

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
			<p><a href="../officeAdmin.do">지점관리페이지로 이동~!</a></p>
			본문시작<br>
			본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>
			본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>
			본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>
			본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>
			본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>
			본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>본문<br>
			본문끝
			
			
			<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0065.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0792.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0260.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0120.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0216.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0813.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0196.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0047.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0228.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0127.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0817.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0732.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0143.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0317.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0579.jpg"></div>
		<div class="swiper-slide" style="font-size:50pt;">- 끝 -</div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
		</div>
		
		<!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>


<%@include file="/common/footer.jspf"%>
<script>

new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>
</body>

</html>