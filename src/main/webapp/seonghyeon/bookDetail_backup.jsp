<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.spring.biz.book.Paging"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세페이지 화면</title>
<%@include file="/common/include.jspf"%>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css"> --> <!-- 의심중 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style>


	
<%@include file="css/bookdetail.css"%>
<%@include file="css/footer.css"%>
<%@include file="css/header.css"%>
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<script>
$(document).ready(function(){
   
    ///클릭해서 이미지띄우기 - 추가적립
    
    $("#popupBtn").click(function(){
    	subPage();
		
	});//#popupBtn을 눌렀을때 서브페이지가 뜸
	
    function subPage(){
		$("#plusPopup").fadeIn(400);
		
	}//서브페이지-> #plusPopup. 
	
	$("#plusPopup .close").click(function(e){
		$("#plusPopup").css("display","none");
		
	});
	
	// 회원혜택
	
	$("#popupBtn2").click(function(){
		subPage2();
	});
	
	function subPage2(){
		$("#plusPopup2").fadeIn(400);
	}
	
	$("#plusPopup2 .close").click(function(e){
		$("#plusPopup2").css("display","none");
	});
	
	//배송비 안내
	
	$("#popupBtn3").click(function(){
		subPage3();
	});
	
	function subPage3(){
		$("#plusPopup3").fadeIn(400);
	}
	
	$("#plusPopup3 .close").click(function(){
		$("#plusPopup3").css("display","none");
	});
	
	//배송일정
	
	$("#popupBtn4").click(function(){
		subPage4();
	});
	function subPage4(){
		$("#plusPopup4").fadeIn(400);
	}
	$("#plusPopup4 .close").click(function(){
		$("#plusPopup4").css("display","none");
	});	
	
	//바로드림 안내
	
	$("#popupBtn5").click(function(){
		subPage5();		
	});
	function subPage5(){
		$("#plusPopup5").fadeIn(400);
	}
	$("#plusPopup5 .close").click(function(){
		$("#plusPopup5").css("display", "none");
	});
	
	//바로드림 주문 창
	$("#quickPickup").click(function(){
		subPage6();
	});
	
	function subPage6(){
		$("#quickpickContainer").fadeIn(400);
		
	}
	$("#quickpickContainer .close").click(function(){
		$("#quickpickContainer").css("display", "none");
	});
	
	
	//매장별재고 
	
	$("#storeBtn").click(function(){
		subPageS();
	});
	function subPageS(){
		$("#storeContainer").fadeIn(400);
	}
	
	$("#storeContainer .close").click(function(){
		$("#storeContainer").css("display", "none");
	});
	
	
	
	///이미지 보여주기 슬라이드(블로그)
	
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
    
	$("#ghmoonjego").click(function(){
		var ghmoonPop = window.open("${pageContext.request.contextPath }/seonghyeon/ghmoonjego.jsp","pop1",
				"width=400, height=800, top=100, left=150");
	});	

	$(function(){
		$('#plusbtn').click(function(){
			var n= $('#plusbtn').index(this);
			var cnt = $("#cnt:eq("+n+")").val();
			cnt = $("#cnt:eq("+n+")").val(cnt*1+1);
		});
		$('#minusbtn').click(function(){
			var n= $('#minusbtn').index(this);
			var cnt = $("#cnt:eq("+n+")").val();
			cnt = $("#cnt:eq("+n+")").val(cnt*1 -1);
		});
	});
	
	$('a[href*=#]').on('click', function(e) {//스크롤 앵커이동
	    $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 500, 'linear');
	    e.preventDefault();
	});
	
});//jQuery end
	
	
	 function cart(){//장바구니에 넣기-회원일때
		
		/* var book_no = "<c:out value="${bookVo.book_no}"/>"; */
		var book_no = ${bookVo.book_no};
		var cnt = $("#cnt").val();
		var store_code = "online";
		
		//alert(book_no + "번 책, " + cnt + "권, 가게번호 : " + store_code);
		
		if('${sessionScope.user}' != ""){ //회원일경우
			$.ajax({
				url : "cart.do",
				type: "post",
				dataType: "json",
				data:{
					 "book_no":book_no,
					 "cnt":cnt,
					 "store_code":store_code },
					
					success: function(result){//sucess
						//alert("result : " + result.success);
						console.log(result);
						
						if(result.success == "success"){
							alert("선택한 상품이 장바구니에 담겼습니다.");
								if(confirm("장바구니로 이동하시겠습니까?")==true){//확인
									document.location.href= "gocart.do";
								}else{
									return false;
								}
						}else {//insertCart가 1이아닐때 
							alert("이미 장바구니에 있는 상품 입니다.");
						} //if문 끝  
						
					},//sucess 끝 
					error : function(jqXHR,textStatus,errorThrown){
						alert(textStatus);
						alert(errorThrown);
					}
			});//ajax 끝
			
		}else {//장바구니에 넣기-비회원일때 
			var ask = confirm("로그인 하시겠습니까?");
			if(ask == true){
				location.href="${pageContext.request.contextPath }/Jungha/mem_login.jsp";
				return false;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath }/cartNonMem.do",
				type: "get",
				//contentType:"application/json",
				dataType: "json",
				data:{
					 "book_no":book_no,
					 "cnt":cnt,
					 "store_code":store_code },
					
					success: function(result){//sucess
						alert("result : " + result.sucess);
						console.log(result);
						
						if(result.success == "success"){
							alert("[비회원]선택한 상품이 장바구니에 담겼습니다.");
								if(confirm("[비회원]장바구니로 이동하시겠습니까?")==true){//확인
									document.location.href= "${pageContext.request.contextPath }/gocartNon.do";
								}else{
									return false;
								}
						}else {//insertCart가 1이아닐때 
							alert("이미 장바구니에 있는 상품 입니다.");
						} //if문 끝  
						
					},//sucess 끝 
					error : function(jqXHR,textStatus,errorThrown){
						alert(jqXHR.status);
						alert(jqXHR.responseText);
						alert(textStatus);
						alert(errorThrown);
					}
				
			});//ajax 끝
		}
	}
//	 
	 function writeArticle(){//게시글쓰기
			document.location.href= "${pageContext.request.contextPath }/seonghyeon/writeArticle.jsp?review_b_no=" + ${bookVo.book_no};
			
		}
	 function jegopickupgo(store_code, store_name){//바로드림 재고 주문
		 	
		var result = confirm("[바로드림]"+ store_name + "에서 주문 하시겠습니까?");
	 	if(result == true){
	 		var cnt = document.getElementById('cnt').value;
	 		window.name="bookDetail";
	 		window.open
	 		("seonghyeon/jegopickupgo.jsp?book_no=${bookVo.book_no}&book_name=${bookVo.book_name}&book_writer=${bookVo.book_writer}&book_saleprice=${bookVo.book_saleprice }&cnt" + cnt +"&store_code=" + store_code,
	 				"pop2","width=600, height=580, top=100, left=150");
	 	}
	 }//바로드림 재고주문 끝 
	 
	 function setChildValue(store_code,cnt){
		 document.location.href="${pageContext.request.contextPath}/soomin/order/orderStep0.do?orderbook_cnt=" + cnt +
		 "&orderbook_no=${bookVo.book_no}&store_code="+store_code;
	}

	 
</script>
<script>
	function order(){//주문하기 버튼 클릭시
		//alert("dd");
			 var cnt = document.getElementById('cnt').value;
	alert(cnt);
		 
		 if ( "${empty sessionScope.user}" ){//비회원일때
			 alert("사은품 선택창으로 이동합니다.");
			 document.location.href="${pageContext.request.contextPath}/soomin/order/orderStep0.do?orderbook_cnt=" + cnt +
					 "&orderbook_no=${bookVo.book_no}&store_code=online";
			 //비회원이면 nonmemberbook_no , store_code
		 }else {//회원일때 
			 alert("사은품 선택창으로 이동합니다.");
			 document.location.href="${pageContext.request.contextPath}/soomin/order/orderStep0.do?orderbook_cnt=" + cnt + 
					 "&orderbook_no=${bookVo.book_no}&store_code=online";
			 //orderCart_idx 회원일때 cart_idx store_code 
			 
		}
	}
</script>
</head>
  
<body>
<%@ include file="/common/header.jspf" %>
<%@ include file="/common/menuBar.jspf" %>
<%@ include file="/common/bookClass.jspf" %>
	
		<hr>
		<br><br><br><br>
		
		<!-- 메인설명창 -->
		<div class="container-fluid mainPage">
   		<div class="row">
       <!-- 부트:왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 부트:본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
        <form action="goBookDetail.do" method="post">
		<%-- <div>첫번째 책 상세정보 묶은 div --%>
		<table class="table" id="mainExp">
			<!-- <tr>
				<th width="100px">1</th>
				<th width="200px">2</th>
				<th width="450px">3</th>
				<th width="100px">4</th>
				<th width="500px">5</th>
			</tr> -->
			<c:if test="${not empty bookVo }">
				
			<tr>
				<td rowspan="8"><img src="${bookVo.book_img}" style="width:350px" ><!-- "../resources/images/pic/bookp.jpg" --></td>
				<td colspan="4" style="color:#5F0E1F; font-size:2.5em; padding-left:10px">${bookVo.book_name}</td>
				
			</tr>
			<tr>
				<td style="border-right: 0.3px solid gray; padding-left:10px">${bookVo.book_writer}</td>
				<td style="border-right: 0.3px solid gray; padding-left:10px">${bookVo.book_publisher }</td>
				<td style="padding-left:10px">${bookVo.book_published_date }</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" style="padding-left:20px">***** 9.3 
				(리뷰 <span style="font-weight:bold">${cntArticle }</span>개)</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left:20px">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${bookVo.book_price }" />
				원
				</td>
				<td rowspan="5" colspan="2" style="padding-left:20px;">
				<span style="font-weight:bold">이 상품의 이벤트 ${eventCnt}건</span><br><br>
					<c:forEach var="eventlist" items="${eventlist }">
				<ul style="padding-left:30px">
					<li id="eventlist_contents"><span><a href="#">${eventlist.event_title }</a></span></li>
				</ul>
					</c:forEach>
				<br>
					
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left:20px;">판매가
				<span style="font-size:2.0em; color:red; font-weight:bold; ">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${bookVo.book_saleprice }" />
				원
				</span>
				<span style= "font-weight:bold;">[10%↓
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${bookVo.getSalega() }" /> 
				원 할인]
				</span></td>
			</tr>
			<tr>
				<td rowspan="3" style="padding-left:20px; width:100px">통합포인트 :</td>
				<td>[기본적립] ${bookVo.pluspoint() }원 적립 [5% 적립]</td>
				
			</tr>
			<tr>
				<td>[추가적립] 5만원 이상 구매 시 2천원 추가적립
				<input type="button" value="안내" style="width:50px" id="popupBtn">
					<div id="plusPopup"><%--버튼을 눌렀을때 보이는 이미지 --%>
						<div class="center">
						<br>
							<div id="point1">통합포인트 추가 적립 안내
							<span id="pointx"><a href="#" class="close">X</a></span>
							</div>
						<br>
						<img src="${pageContext.request.contextPath }/resources/img/pic/btnimg1.png" alt="통합포인트"
							style="width:600px">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width:80px">[회원혜택] 실버등급 이상, 3만원 이상 구매 시 
				<br>2~4% 추가적립
				<input type="button" value="안내" style="width:50px" id="popupBtn2">
					<div id="plusPopup2">
						<div class="center"> 
							<br>
								<div id="point1">회원등급 별 통합포인트 추가 적립 안내
								<span id="pointx"><a href="#" class="close">X</a></span>
								</div>
							<br>
								<img src="${pageContext.request.contextPath }/resources/img/pic/btnimg2.png" alt="회원혜택"
									style="width:600px">
						</div>
					</div>
				</td>
			</tr>
				<tr>
				<td>
				<input type="button" value="매장별 재고/위치      >" id="storeBtn"
					style="width:350px; height:50px; font-size:1.5em; text-dlign:center; border-radius: 10px 10px; 
					padding-up: 30px;">
				<div id="storeContainer"><%--팝업창 div --%>
						<div id="storeBanner">
							<span>매장별 재고 및 위치</span>
							<span><a href="#" class="close" style="padding-right:5px;">X</a></span>
						</div>
					<br>
					<div id="storeContent" style="padding-left:20px">
					<p style="font-weight:bold">수도권</p>
					<table class="table" style="border:1px solid gray; width:400px; padding-right:10px;">
						<tr style="background-color:lightGray; padding-left:10px;">
							<c:forEach var="jegoname" items="${jego }">
							<th><c:out value="${jegoname.store_name }"/></th>
							</c:forEach> 
						</tr>
						<tr >
						<c:forEach var="jegoOri" items="${jego}">
							<td><a href="javascript:window.open('seonghyeon/ghmoonjego.jsp?
							&store_name=${jegoOri.store_name }&cnt=${jegoOri.cnt }&book_writer=${bookVo.book_writer}
							&book_publisher=${bookVo.book_publisher }&book_published_date=${bookVo.book_published_date }
							&book_saleprice=${bookVo.book_saleprice }&book_name=${bookVo.book_name }&book_isbn=${bookVo.book_isbn }',
							'pop1','width=400, height=800, top=100, left=150');" id="jego2">
							${jegoOri.cnt }
							</a>
							</td>
						</c:forEach>
						</tr>
						</table>
						<br>
						</div><%--storeContent end --%>
						<br>
						<ul style="padding-left:40px;">
							<li>매장별 위치확인은 재고수량을 클릭하십시오.</li>
							<li>실시간 재고수량이 변하므로 전화확인 후 방문바랍니다.</li>
							<li>(문의) 대표번호 1588-8282</li>
						</ul>
				</div><%--storeContainer end --%>
				</td>
			</tr>
			</c:if><%--bookVo end --%>
			
			
			<tr>
				<td rowspan="5">&nbsp;</td>
				<td colspan="2">배송비 : 무료&nbsp;&nbsp;
				<input type="button" id="popupBtn3" value="배송비 안내" style="width:100px">
				<div id="plusPopup3">
						<div class="center">
							<br>
								<div id="point1">배송비 무료 안내
								<span id="pointx"><a href="#" class="close">X</a></span></div>
						</div>
						<br>
							<img src="${pageContext.request.contextPath }/resources/img/pic/btnimg3.jpg" alt="배송비안내" style="width:500px">
				</div>
				</td>
					
			</tr>
			<tr>
				<td colspan="2">배송일정 : 서울특별시 종로구 세종대로 기준&nbsp;&nbsp;
				<!-- <input type="button" value="지역변경" style="width:80px"> -->
				<input type="button" value="배송일정안내" id="popupBtn4" style="width:100px">
					<div id="plusPopup4">
						<div id="center">
						<br>
							<div id="point1">배송 일정 안내
							<span id="pointx"><a href="#" class="close">X</a></span></div>
						</div>
					<br>
						<img src="${pageContext.request.contextPath }/resources/img/pic/btnimg4.jpg" alt="배송일정안내" style="width:500px">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">바로드림 : 인터넷으로 주문하고 매장에서 직접 수령
				<input type="button" value="안내" id="popupBtn5" style="width:50px">
					<div id="plusPopup5">
						<div id="center">
							<br>
								<div id="point1">바로드림 이용 안내
								<span id="pointx"><a href="#" class="close">X</a></span></div>
						</div>
						<br>
							<img src="${pageContext.request.contextPath }/resources/img/pic/btnimg5.jpg" alt="바로드림" style="width:500px">
					</div>
				</td>
			</tr>
			<tr>
				<td>주문수량 <input type="number" id="cnt" value="1" style="width:40px">
						  <input type="button" id="plusbtn" value="+" style="width:20px">
						  <input type="button" id="minusbtn" value="-" style="width:20px">
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<!-- <a href="cart.do"> -->
					<a href="#"><input type="button" onclick="cart()" value="장바구니" style="width:200px; font-size:1.5em;
						border-radius: 10px 10px;" ></a>
				</td>
				<td style="padding-left:30px">
					<input type="button" value="구매하기" onclick="order()" style="width:200px; font-size:1.5em; 
						background-color:#9F5252; color:white; border-radius: 10px 10px;">
				</td>
				<td>
					<input type="button" id="quickPickup" value="바로드림 주문" style="width:200px; font-size:1.5em; 
						background-color:#9F5252; color:white; border-radius: 10px 10px;">
					<div id="quickpickContainer"><%--바로드림 팝업창 --%>
							<div id="quickStoreBanner">
							<span>[바로드림] 매장별 재고 및 위치</span>
							<span><a href="#" class="close" style="padding-right:5px;">X</a></span>
							</div><%--quickStoreBanner end --%>
					<br>
					<div id="pickupContent" style="padding-left:20px; padding-right:20px">
						<p>매장</p>
						<table class="table">
							<tr style="background-color:lightGray;">
								<c:forEach var="jegopickup" items="${jegopickuplist }">
								<th style="width:100px "><c:out value="${jegopickup.store_name }"></c:out></th>
								</c:forEach>
							</tr>
							
							<tr>
								<c:forEach var="jegopickup" items="${jegopickuplist}">
									<td>
										<a onclick="jegopickupgo('${jegopickup.store_code}','${jegopickup.store_name }')">
										<p style="cursor: pointer">${jegopickup.cnt }</p>
										</a>
									</td>
								</c:forEach>
							</tr>
						</table>
						<br>
					</div>	<%--pickupContent end --%>
					<br>
						<ul style="padding-left: 30px;">
							<li>매장별 위치확인은 재고수량을 클릭하십시오.</li>
							<li>실시간 재고수량이 변하므로 전화확인 후 방문바랍니다.</li>
							<li>(문의)대표번호 1588-8282</li>
						</ul>
					</div><%--바로드림 팝업창 끝 --%>
					
				</td>
			</tr>
			</table><%--mainExp table end --%>
			</form>
			
			<%-- </div>첫번째 책 상세정보 파트 끝 --%>
			<br><br><br><br>
			
			<%-- 두번째 책 상세설명 페이지(이벤트/상품정보/회원리뷰/교환) --%>
			<ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">이벤트(${eventCnt})</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">상품정보</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">회원리뷰(${cntArticle })</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#vbn">교환/반품/품절</a>
              </li>
              
            </ul>
           <div class="tab-content">
             <div class="tab-pane fade show active" id="qwe">
			<table class="table" style="width:100%"><!-- 이벤트 -->
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">이 책의 이벤트</td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<c:set var="i" value="1"/>
				<c:forEach var="eventlist" items="${eventlist }">
					<c:if test="${i%2==1}">
						<tr>
					</c:if>
					<td><img src="${eventlist.img_path }" alt="이벤트사진"></td>
					<td>${eventlist.event_content }</td>
					<c:if test="${i%2==0 }">
						</tr>
					</c:if>
				<c:set var="i" value="${ 1+i}"/>
				</c:forEach>
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				</table>
			</div>
			</div>
				<ul class="nav nav-tabs">
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#qwe">이벤트(${eventCnt})</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link active" data-toggle="tab" href="#asd">상품정보</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#zxc">회원리뷰(${cntArticle })</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#vbn">교환/반품/품절</a>
	              </li>
           		</ul>
				<div class="tab-content">
                <div class="tab-pane fade show active" id="asd">
					<table class="table">
					<tr>
						<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td colspan="3">${bookVo.book_isbn }</td>
					<tr>
					<tr>
						<th>쪽수</th>
						<td colspan="3">${bookVo.book_total_page }</td>
					</tr>
					<tr>
						<th>크기</th>
						<td colspan="3">${bookVo.book_size }</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
				
				
					<tr>
						<th >책 소개</th>
						<th colspan="3"></th>
					</tr>
					<tr>
						<td>이 책이 속한 분야</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="4">인문 > 인문학일반 > 인문교양</td>
					</tr>
					
					<tr>
						<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					
					<tr>
						<td colspan="4">
						${bookVo.book_info }
						</td>
						<td></td>
					</tr>
				</table>
				</div>
				</div>
				
			<br><br>
			<table class="table"><%-- 목차시작 --%>
				<tr>
					<th colspan="4">목차</th>
				</tr>
				<tr><th>&nbsp;&nbsp;</th></tr>
				<c:forEach var="ContentOrder" items="${ContentOrder }">
				<tr>
					<td colspan="4">${ContentOrder.content }</td>
				</tr>
				</c:forEach>
				</table><%-- 목차 끝 --%>	
			<br><br>
			
			<!-- <table class="table"> --> <%-- 상세이미지 --%>
			<!--  <tr>
				<td colspan="4">상세이미지</td>
			</tr>
			
			<tr><td>
			
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide"><img src="/img/pic/bookcard1.jpg"></div>
						<div class="swiper-slide"><img src="/img/pic/bookcard2.jpg"></div>
						<div class="swiper-slide"><img src="/img/pic/bookcard3.jpg"></div>
						<div class="swiper-slide"><img src="/img/pic/bookcard4.jpg"></div>
						<div class="swiper-slide"><img src="/img/pic/bookcard5.jpeg"></div>
						<div class="swiper-slide"><img src="/img/pic/bookcard6.jpeg"></div>
						<div class="swiper-slide" style="font-size:50pt;">- 끝 -</div>
					
	
					네비게이션
					<div class="swiper-button-next"></div>다음 버튼 (오른쪽에 있는 버튼)
					<div class="swiper-button-prev"></div>이전 버튼
				
					페이징
					<div class="swiper-pagination"></div>
				</div> -->
		<!-- <span style="text-align:center; margin-top:5px;">&nbsp;</span> -->
			<!-- </td></tr>
	 		</table> 
			 -->
			<br><br>
			<ul class="nav nav-tabs">
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#qwe">이벤트(${eventCnt})</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#asd">상품정보</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link active" data-toggle="tab" href="#zxc">회원리뷰(${cntArticle })</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#vbn">교환/반품/품절</a>
	              </li>
           		</ul>
			<br><br>
		<%-- 	게시글에 작성된 댓글 표시영역
			<c:forEach var="commVO" items="${c_list }">
			<div class="comment">
				<form action="ans_del.jsp" method="post">
					<p>고객아이디 : ${commVO.review_mem_id }&nbsp;&nbsp; 작성날짜 : ${commVO.write_date }</p>
					<p>내용 : ${commVO.review_content }</p>
					<p>첨부파일 : <img src="/biz/resources/images/pic/책사진.jpg" alt="첨부파일이미지"></p>
					<input type="submit" value="댓글삭제">
					<input type="hidden" name="review_no" value="${commVO.review_no }">
					<input type="hidden" name="review_men_id" value="${commVO.review_men_id }">
					
					삭제처리 후 게시글 상세페이지로 이동시
					<input type="hidden" name="no" value="">
				</form>
			</div>
			</c:forEach>
			
			댓글 페이징 부분
			<table>
				<tr>
					<td colspan="4">
						<ol class="paging">
							<c:choose>
								<c:when test="">
									<li class="disable">이전</li>
								</c:when>
								<c:otherwise>
									<li><a href="#">이전</a></li>
								</c:otherwise>
							</c:choose>
						
						블록내 표시할 페이지태그 작성(시작페이지~끝페이지)
						<c:forEach var="pageNo" begin="" end="">
							<c:choose>
								<c:when test="">
									<li class="now"></li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="#"></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						[다음으로]에 대한 사용여부처리 : 사용불가 또는 안보이게 -마지막블록일때
							endPage가 전체 페이지수와 같거나 큰 경우 
						<c:choose>
							<c:when test="대략 end> total">
								<li class="disable">다음으로</li>
							</c:when>
							<c:otherwise>
								<li><a href="">다음</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</table> --%>
			<div class="tab-content">
             <div class="tab-pane fade show active" id="zxc">
             
			<table class="table" align="center" style="width:100%">
				<tr height="10" style="text-align:center;">
					<td>글번호</td>
					<td>작성자</td>
					<td>제목 </td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<c:choose>
					<c:when test="${articleVO ==null }">
						<tr height="10">
							<td colspan="4">
								<p align="center">
									<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
				</c:choose>
				<c:choose>	
					
					<c:when test="${articleVO !=null }">
						<c:forEach var="article" items="${articleVO }" varStatus="articleNum">
							<tr align="center">
								<td width="5%">${article.review_no}</td>
								<td width="10%">${article.review_mem_id }</td>
								<td align='left' width="35%">
									<span style="padding-right:30px"></span>
									<c:choose>
										<c:when test='${article.level > 1}'>
											<c:forEach begin="1" end="${article.level }" step="1">
												<span style="padding-left:20px"></span>
											</c:forEach>
											<span style="font-size:12px;">[답변]</span>
											<a class="cls1" href="goDetailReview.do?
														review_no=${article.review_no }">${article.review_title }</a>
										</c:when>
										<c:otherwise>
											<a class='cls1' href="goDetailReview.do?
														review_no=${article.review_no }">
														${article.review_title }</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td width="10%">
									${article.review_date }
								</td>
								<td width="5%">
									${article.review_count }
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				<%--페이징 처리 시작 --%>
				<tr>
					<td colspan="4">
					<table class="table" id="pagingT">
						<tr><td>&nbsp;</td></tr>
						<tr>
						<td>
		                  <ol class="paging">
		                     <c:choose>
		                     <c:when test="${pvo.beginPage == 1 }">
		                        <li class="disable">이전</li>
		                     </c:when>
		                     <c:otherwise>
		                        <!-- 이전으로 누르면 현재 블록의 첫페이지인 beginePage - 1로 이동 -->
		                        <li><a href="list.jsp?cPage=${pvo.beginPage - 1}">이전</a></li>
		                     </c:otherwise>
		                     </c:choose>
		                     <%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
		                     <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
		                     <c:choose>
		                     <c:when test="${pageNo == pvo.nowPage }">
		                        <li class="now">${pageNo }</li>
		                     </c:when>
		                     <c:otherwise>
		                        <li>
		                           <a href="list.jsp?cPage=${pageNo }">${pageNo }</a>
		                        </li>
		                     </c:otherwise>
		                     </c:choose>
		                     </c:forEach>
		                     <c:choose><%-- [다음으로]에 대한 사용여부처리 --%>
		                     <%-- 사용불가(disable) 또는 안 보이게(hidden) : 마지막 블록인 경우
		                        endPage가 전체 페이지 수와 같거나 큰 경우 --%>
		                     <c:when test="${pvo.endPage >= pvo.totalPage }">
		                        <li class="disable">다음으로</li>
		                     </c:when>
		                     <c:otherwise>
		                        <li><a href="list.jsp?cPage=${pvo.endPage + 1}">다음</a></li>
		                     </c:otherwise>
		                     </c:choose>
		                  </ol>
		                  </td>
		                  </tr>
		                  </table>
               		</td>
					<td>
					<c:if test="${not empty sessionScope.user.getId()  }">
						<input type="button" value="글쓰기" onclick= "writeArticle()" 
						style="float:right; padding:3px; text-align:center; margin-right:38px;">
					</c:if>
					</td>
				</tr>
			</table>
			<br>
			</div>
			</div>
			<br><br><br><br><br>
			
			<ul class="nav nav-tabs">
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#qwe">이벤트(${eventCnt})</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#asd">상품정보</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#zxc">회원리뷰(${cntArticle })</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link active" data-toggle="tab" href="#vbn">교환/반품/품절</a>
	              </li>
           		</ul>
           		
				<div class="tab-content">
             <div class="tab-pane fade show active" id="#vbn">
			
			<br><br><br>
			<p>교환/반품/품절안내</p>
			<p>※상품설명에 반품/교환 관련한 안내가 있을 경우 그 내용을 우선으로 합니다.(업체 사정에 따라 달라질 수 있습니다.)</p>
			
			<div style= "width:1200px; "><%--교환/반품/품절 감싼 div --%>
			<table class="table" style= "border:1px solid #DDDDDD;" id="exchange2"><%-- 교환/반품/품절 내용 --%>
				<tr>
					<th class="exchange">반품.교환방법</th>
					<td class="exchange2">마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환신청,<br>
						[1:1상담>반품/교환/환불] 또는 고객센터(1544-1900)<br>
						※오픈마켓, 해외배송주문, 기프트 주문시 [1:1상담>반품/교환/환불]<br>
						또는 고객센터(1544-1900)</td>
				</tr>
				<tr>
					<th class="exchange">반품/교환가능 기간</th>
					<td class="exchange2">변심반품의 경우 수령 후 7일 이내,<br>
						상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</td>
				</tr>
				<tr>
					<th class="exchange">반품/교환비용</th>
					<td class="exchange2">변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
				</tr>
				<tr>
					<th class="exchange">반품/교환 불가 사유</th>
					<td class="exchange3">
						<ul>
							<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>
							(단지 확인을 위한 포장 훼손은 제외)</li>
							<li>소비자의 사용,포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
							예)화장품, 식품, 가전제품(악세사리 포함) 등</li>
							<li>복제가 가능한 상품 등의 포장을 훼손한 경우<br>
								예) 음반/DVD/비디오,소프트웨어,만화책,잡지,영상 화보집</li>
							<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우((1)해외주문도서)</li>
							<li>디지털 컨텐츠인 eBook,오디오 북등을 1회 이상 다운로드를 받았을 경우</li>
							<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
							<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br>
								해당되는 경우</li>
							<li>(1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시<br>
								'해외주문 반품/취소 수수료' 고객 부담 (해외주문 반품/취소 수수료: ➊서양도서-판매정가의 12%, ➋일본도서- 판매정가의 7%를 적용)</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th class="exchange">상품품절</th>
					<td class="exchange2">공급사(출판사)재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br>
						이메일과 문자로 안내드리겠습니다.</td>
				</tr>
				<tr>
				<th class="exchange"> 소비자 피해보상<br>
					환불지연에 따른 배상</th>
				<td class="exchange3">
				<ul>
					<li>상품의 불량에 의한 교환, A/S환불, 품질보증 및 피해보상 등에 관한 사항은<br>
						소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됩니다.</li>
					<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br>
						소비자 보호에 관한 법률에 따라 처리됩니다.</li>
				</ul>
				</td>
				</tr>
			</table><%-- 교환/반품/품절 끝 --%>
			</div><%--교환/반품/품절 감싼 div --%>
			</div>
			</div>
			<br><br><br><br>
			
		 </div><%-- 본문끝나고 닫는 부트스트랩 col-xl-8 col-md-8 mb-8 bg-light --%>
      <%-- 오른쪽 사이드바 --%>
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
<%@ include file="/common/footer.jspf" %>
</body>
</html>