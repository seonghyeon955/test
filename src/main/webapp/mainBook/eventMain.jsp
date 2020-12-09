<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8"> 
<title>이벤트메인화면</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../resources/raeCss/css/header.css">
<link rel="stylesheet" href="../resources/raeCss/css/footer.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>

</style> 
<script> 

	$(document).ready(function(){ 
	    var main = $('.bxslider').bxSlider({ 
		    mode: 'fade', 
		    auto: true,	//자동으로 슬라이드 
		    controls : true,	//좌우 화살표	
		    autoControls: true,	//stop,play 
		    pager:true,	//페이징 
		    pause: 5000, 
		    autoDelay: 0,	
		    slideWidth: 800, //이미지 박스 크기설정
		    speed: 1000, 
		    stopAutoOnclick:true 
		}); 

		$(".bx-stop").click(function(){	// 중지버튼 눌렀을때 
		    main.stopAuto(); 
		    $(".bx-stop").hide(); 
		    $(".bx-start").show(); 
		    return false; 
		}); 
	
		$(".bx-start").click(function(){	//시작버튼 눌렀을때 
		    main.startAuto(); 
		    $(".bx-start").hide(); 
		    $(".bx-stop").show(); 
		    return false; 
		}); 
	
		  $(".bx-start").hide();	//onload시 시작버튼 숨김. 
	}); 

</script> 

</head> 
<body> 
<%@include file="/common/header.jspf"%>
<%@include file="/common/menuBar.jspf"%> <%-- 이거 뼤고 홈 > 이벤트/쿠폰 > 이벤트 --%>
<%@include file="/common/bookClass.jspf"%>
<div class="container-fluid mainPage">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">

	<!-- 메인이벤트 -->
    <div>
    	<input type="button" value="이벤트">
        <ul class="bxslider">
        	<!-- 나중에 이미지마다 링크 연결해야됨 -->
            <li><a href="#"><img src="../resources/raeCss/images/sample01.jpg" width="800" height="400"></a></li>
            <li><a href="#"><img src="../resources/raeCss/images/sample02.jpg" width="800" height="400"></a></li>
            <li><a href="#"><img src="../resources/raeCss/images/sample03.jpg" width="800" height="400"></a></li>
            <li><a href="#"><img src="../resources/raeCss/images/sample04.jpg" width="800" height="400"></a></li>
        </ul>
    </div>
    <br>

		





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