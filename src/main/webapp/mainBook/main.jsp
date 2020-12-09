<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8"> 
<title>메인화면</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/raeCss/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/raeCss/css/footer.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
	.bestSeller > ul {list-style: none;}
	.newRelease > ul {list-style: none;}
	.steadySeller > ul {list-style: none;}
	.bestSeller > ul > li {float: left;}
	.steadySeller > ul > li {float: left;}
	.bigFont {font-size: 2em;}
	.midFont {font-size: 1.5em; margin-top: 8px;}
	.bestSellerBook {width: 800px; height: 600px; margin: auto;}
	.steadySellerBook {width: 800px; height: 600px; margin: auto;}
	.newReleaseBook {width: 800px; height: 600px; margin: auto;}
	td {width: 800px;}
	.center{text-align: center;}
	a:hover {
		text-decoration: none;
	}
	
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
	

/* 	 $("#category_name").change(function(){
		var code = $("#category_code").val();
		var main = $("#category_main").val();
		var name = $(this).val();
		location.href="${pageContext.request.contextPath}/bookList.do?category_code=" + code + "&category_main?" + main + "&category_name=" + name;
	});
	 */
	/* function selectCode(){
		var code = $('#category_code').val();
		//alert(category_code);
		$.ajax({
			type: 'POST',
			url: 'getCategoryMain.do',
			dataType: "json",
			data: {category_code: code},
			success: function(result){
				//alert(result);
				$('#category_main').html("<option value=''>-중분류-</option>");
				$('#category_name').html("<option value=''>-소분류-</option>");
				$(result).each(function(i) {
			        var main = result[i];
			        console.log("main : " + main)
		        	$('#category_main').append("<option value='" + main + "'>" + main + "</option>");  
		        });
			}
		});
	}
	
	
	function selectMain(){
		var code = $('#category_code').val();
		var main = $('#category_main').val();
		//alert(category_code + '   ' + category_main);
		$.ajax({
			type: 'POST',
			url: 'getCategoryName.do',
			dataType: "json",
			data: {category_code: code, 
				   category_main: main},
			success: function(result){
				//alert(result);
				$('#category_name').html("<option value=''>-소분류-</option>");
				$(result).each(function(i) {
			        var name = result[i];
			        console.log("name : " + name)
		        	$('#category_name').append("<option value='" + name + "'>" + name + "</option>");  
		        });
			}
		});
	}  */

	
	
	

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

	
    <br>

	<!-- 메인화면 - 베스트셀러 -->
	<div class="bestSellerMenu">
		<div class="bestSeller center">
			<a href="bestMonth.jsp" class="bigFont">베스트셀러</a>&nbsp;  <!-- 베스트셀러 창으로 가는 링크 -->
		</div>	
		<br><br>
		
		<div class="bestSellerBook">
			<table style="width: 100%">
					<c:forEach var="bestSellerBook" items="${requestScope.bestSellerList }" varStatus="status">
					<c:if test="${status.first }">
						<tr>
					</c:if>
						<td class="center">
							<a href="${pageContext.request.contextPath}/goBookDetail.do?book_no=${bestSellerBook.book_no }">
								<img src="${bestSellerBook.book_img }" width="100%">
							</a>
						</td>
					<c:if test="${status.count == 4 }">
						</tr><tr>
					</c:if>
					<c:if test="${status.last }">
						</tr>
					</c:if>
					</c:forEach>
				
			</table>
		</div>
	</div>
	
	<!-- 메인화면 - 신간도서 -->
	<div class="newReleaseMenu">
		<div class="newRelease center">
			<a href="newBook.jsp" class="bigFont">신간도서</a>
		</div>
		<br><br>
		
		<div class="newReleaseBook">
			<table style="width: 100%">
					<c:forEach var="newBookvo" items="${requestScope.newBookList }" varStatus="status">
					<c:if test="${status.first }">
						<tr>
					</c:if>
						<td class="center">
							<a href="${pageContext.request.contextPath}/goBookDetail.do?book_no=${newBookvo.book_no }">
								<img src="${newBookvo.book_img }" width="100%">
							</a>
						</td>
					<c:if test="${status.count == 4 }">
						</tr><tr>
					</c:if>
					<c:if test="${status.last }">
						</tr>
					</c:if>
					</c:forEach>
				
			</table>
		</div>
	</div>
	
	<!-- 메인화면 - 스테디셀러 -->
	<div class="steadySellerMenu">
		<div class="steadySeller center">
			<a href="steady.jsp" class="bigFont center">스테디셀러</a>&nbsp; <!-- 스테디셀러 창으로 가는 링크 -->
		</div>	
		<br><br>
		
		<div class="steadySellerBook">
			<table style="width: 100%">
					<c:forEach var="steadySeller" items="${requestScope.steadySellerList }" varStatus="status">
					<c:if test="${status.first }">
						<tr>
					</c:if>
						<td class="center">
							<a href="${pageContext.request.contextPath}/goBookDetail.do?book_no=${steadySeller.book_no }">
								<img src="${steadySeller.book_img }" width="100%">
							</a>
						</td>
					<c:if test="${status.count == 4 }">
						</tr><tr>
					</c:if>
					<c:if test="${status.last }">
						</tr>
					</c:if>
					</c:forEach>
				
			</table>
		</div>
	</div>

	<!-- 메인화면- 이달의 추천 도서 -->
	<div class="newRelease center">
		<span class="bigFont">새로 입고된 굿즈</span>
	</div>
	<br><br>
    <div style="text-align:center">
        <ul class="bxslider" style="position: absolute; width: 100%">
        	<!-- 나중에 이미지마다 링크 연결해야됨 -->
        	
        	<c:forEach var="goodsvo" items="${newGoodsList }">
        	<li style="width: 100%">
        		<img class="order-img" alt="${goodsvo.goods_name }" 
				src="${pageContext.request.contextPath}/resources/img/goods_img/${goodsvo.goods_image }" width="800" height="400">
			</li>
        	
        	</c:forEach>
        	
        	</ul>
    </div>





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