<%@page import="com.bit.bookstore.vo.GoodsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.bookstore.vo.BookVO"%>
<%@page import="com.bit.bookstore.vo.CartBookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//책 전체 구매 금액 계산
	int totalBookPrice = 0;
	List<BookVO> orderBookList = (List<BookVO>) request.getAttribute("orderBookList");
	List<CartBookVO> cartbookvoList = (List<CartBookVO>) request.getAttribute("cartbookvoList");
	System.out.println("cartbookvoList****** : " + cartbookvoList);
	

	
	
	if(cartbookvoList != null){
		for(int i = 0; i < cartbookvoList.size(); i++){
			totalBookPrice += cartbookvoList.get(i).getBook_saleprice() * cartbookvoList.get(i).getCnt();
		}
	
	}else{
		Integer orderbook_cnt = (Integer)request.getAttribute("orderbook_cnt");
		for(int i = 0; i < orderBookList.size(); i++){
			totalBookPrice += orderBookList.get(i).getBook_saleprice() * orderbook_cnt;
		}
	}
	
	
	
	
	//굿즈 전체 구매 금액 계산
	int totalGoodsPrice = 0;
	
	List<GoodsVO> orderGoodsVOList = (List<GoodsVO>) request.getAttribute("orderGoodsVOList");
	
	if(orderGoodsVOList != null){
		for(GoodsVO goodsvo : orderGoodsVOList){
			totalGoodsPrice += goodsvo.getGoods_price();
		}
	}
	
	
	
	
	
	pageContext.setAttribute("totalBookPrice", totalBookPrice);
	pageContext.setAttribute("totalGoodsPrice", totalGoodsPrice);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 결제(배송) 페이지</title>
<%@include file="../../common/include.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ordermain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nonuserpay.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/find_addr.js"></script>

<script>

	var smsCode = "";
	var emailCode = "";
	
	$(function(){
		
		$(".current_delivery a").css("background-color", "#D38888");
		
		var extrapoint = parseInt($("#extrapoint").text());
		
		
		
		//배송지 탭
		$(".tab li").click(function(){
			
			//배송지가 1개일 땐 여러 곳 배송 X
			if($(this).children("a").text() == "여러 곳 배송"){
				if("${requestScope.orderBookList.size() }" < "2"){
					alert("여러 곳 배송은 상품을 2개 이상 주문 시 이용 가능합니다.");
					return;
				}
			}
			
			$("select[name=delievery_cnt]").val("2").prop("selected", true);
			
			var activeTab = $(this).attr("data-tab");
			$(".current_delivery a").css("background-color", "white");
			$(".tab li").removeClass("current_delivery");
			$(".tabcontent").removeClass("current_delivery");
			$(this).addClass("current_delivery");
			$("#" + activeTab).addClass("current_delivery");
			$(".current_delivery a").css("background-color", "#D38888");
		});
		
		
		
		$("#inputname").keyup(function(){
			if(getTextLength($(this).val()) > 10){
				alert("이름은 10자 초과할 수 없습니다.\n다시 입력하세요.");
				$(this).val("");
				$(this).focus();
			}
			
		});
		
		//숫자 4자만 가능하게
		$(".inputphone2").keyup(function(){
			if($(this).val().length > 4){
				$(this).val($(this).val().substring(0, 4));
			}
		});
		
		$(".delivery_checkbox").click(function(){
			if($(".delivery_checkbox").prop("checked")){
				$("#inputname").val("${sessionScope.user.user_name}");
				
				$("select[name=inputphone1]").val("${requestScope.phoneNumberList.get(0)}").prop("selected", true);
				$("input[name=inputphone2]").val("${requestScope.phoneNumberList.get(1)}");
				$("input[name=inputphone3]").val("${requestScope.phoneNumberList.get(2)}");
				
				$("input[name=order_recv_zip_code]").val("${sessionScope.user.zip_code}");
				$("input[name=order_recv_street_addr]").val("${sessionScope.user.street_addr}");
				$("input[name=order_recv_remaining_addr]").val("${sessionScope.user.remaining_addr}");
				
			}else{
				$("#inputname").val("");
				
				$("select[name=inputphone1]").val("010").prop("selected", true);
				$("input[name=inputphone2]").val("");
				$("input[name=inputphone3]").val("");
				
				$("input[name=order_recv_zip_code]").val("");
				$("input[name=order_recv_street_addr]").val("");
				$("input[name=order_recv_remaining_addr]").val("");
			}
		});
		
		
		$(".payType").click(function(){
			$(".payType").css("border-color", "white");
			$(this).css("", "black");
			
		});
		
		
		//주문상품 토글
		$(".box_title_area .btn_toggle").click(function(e){
			e.preventDefault();
			$(this).toggleClass('on').closest('.box_title_area').next().slideToggle(300, function(){
				if($(this).css("display") == "none"){//숨겨져 있을 시 이미지 바꿈
					$(".btn_toggle_img").prop("src", "${pageContext.request.contextPath}/resources/img/order/bottom.png");
				}else{
					$(".btn_toggle_img").prop("src", "${pageContext.request.contextPath}/resources/img/order/top.png");
				}
			});
		});
		
		
		//포인트
		$("input[name=usepointForPay]").keyup(function(){
			if($(this).val() > extrapoint){
				alert("보유 포인트보다 많이 입력하셨습니다.\n다시 입력해주세요.");
				$(this).val(extrapoint);
				$("#totalPayment").html(totalPayment - parseInt($(this).val()));
				$("input[name=totalPaymentReal]").val(totalPayment - parseInt($(this).val()));
				$("#usedPoint").html(parseInt("${requestScope.bgp.usedpoint }") + parseInt($(this).val()));
				$("input[name=mypoint]").val(parseInt("${requestScope.bgp.extrapoint }") - parseInt($(this).val()));
			}else if($(this).val() < 0){
				$(this).val(0);
			}else{//포인트 입력 제대로 했을 시
				if(!isNaN(parseInt($(this).val()))){//입력된 값이 숫자일 때
					$("#totalPayment").html(totalPayment - parseInt($(this).val()));
					$("input[name=totalPaymentReal]").val(totalPayment - parseInt($(this).val()));
					$("#usedPoint").html(parseInt("${requestScope.bgp.usedpoint }") + parseInt($(this).val()));
					$("input[name=mypoint]").val(parseInt("${requestScope.bgp.extrapoint }") - parseInt($(this).val()));
				}else{//입력된 값이 숫자가 아닐 때
					$("#totalPayment").html(totalPayment);
					$("input[name=totalPaymentReal]").val(totalPayment);
					$("#usedPoint").html(parseInt("${requestScope.bgp.usedpoint }"));
					$("input[name=mypoint]").val("${requestScope.bgp.extrapoint }");
				}
			}
			
		});
		
		
		
		
		
		//결제pay 누를 시
		$("#kakaopay").click(function(){
			if($(this).hasClass("current_pay")){
				$(this).removeClass("current_pay");
				$("input[name=payType]").val("");
			}else{
				$(this).addClass("current_pay");
				$("#smilepay").removeClass("current_pay");
				$("input[name=payType]").val("kakaopay");
			}
			
		});
		
		$("#smilepay").click(function(){
			if($(this).hasClass("current_pay")){
				$(this).removeClass("current_pay");
				$("input[name=payType]").val("");
			}else{
				$(this).addClass("current_pay");
				$("#kakaopay").removeClass("current_pay");
				$("input[name=payType]").val("smilepay");
			}
			
		});	
		
		
		
		
		if("${pageScope.totalBookPrice}" < "10000"){
			$("#deliveryPayment").html("2500");
			$("#totalPayment").html("${pageScope.totalBookPrice + requestScope.bgp.extra + 2500 }");
		}else{
			$("#deliveryPayment").html("0");
			$("#totalPayment").html("${pageScope.totalBookPrice + requestScope.bgp.extra + 0 }");
		}
		
		var totalPayment = parseInt($("#totalPayment").html());
		
		//초기 최종 결제 금액 세팅
		$("input[name=totalPayment]").val(totalPayment);
		$("input[name=totalPaymentReal]").val(totalPayment);
		
		
		
		
		
		
	});
	
	
	
	function sendSms(){
		var phonenumber = document.getElementById("phoneConfirm1").value +
					  document.getElementById("phoneConfirm2").value +
					  document.getElementById("phoneConfirm3").value;
		var confirmNumber = confirm("번호가 " + phonenumber + "가 맞습니까?");
		if(confirmNumber == false){
			return false;
		}
		$.ajax({
			url: "sendSms.do",
			data: {phoneNumber: phonenumber
			},
			type: "post",
			success: function(result){
				if(result != "false"){
					alert("인증번호 전송 성공");
					smsCode = result;
				}else{
					alert("인증번호 전송 실패");
				}
			}
			
		});
		
	
	}
	
	
	function sendEmail(){
		var Email = document.getElementById("orderEmailText").value;
		var confirmEmail = confirm("이메일이" + Email + "가 맞습니까?");
		if(confirmEmail == false){
			return false;
		}
		$.ajax({
			url: "sendEmail.do",
			data: {email: Email
			},
			type: "post",
			success: function(result){
				if(result != "false"){
					alert("이메일 전송 성공");
					emailCode = result;
				}else{
					alert("인증번호 전송 실패");
				}
			},
			error: function(){
				alert("[예외발생]");
			}
		
		});
	}
	
	
	function smsConfirmButton(){
		if(smsCode == "") {
			alert("문자인증을 시도 후 확인하세요");
			return false;
		}else{
			if(smsCode == document.getElementById("smsConfirmText").value){
				alert("인증번호가 일치합니다.");
				document.getElementById("confirmSMS").value = "true";
				document.getElementById("phoneConfirm1").disable = "true";
				document.getElementById("phoneConfirm2").disable = "true";
				document.getElementById("phoneConfirm3").disable = "true";
				
			}else{
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}
		}
	}
	
	function confirmEmailButton(){
		if(emailCode == "") {
			alert("이메일인증을 시도 후 확인하세요");
			return false;
		}else{
			if(emailCode == document.getElementById("emailConfirmText").value){
				alert("인증번호가 일치합니다.");
				document.getElementById("confirmEmail").value = "true";
				document.getElementById("orderEmailText").disable = "true";
				
			}else{
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}
		}
	}
	
	
	
	
	
	
	//한글포함 문자열 길이를 구함
	function getTextLength(str){
		var len = 0;
		for(var i = 0; i < str.length; i++){
			if(escape(str.charAt(i).length == 6)){
				len++;
			}
			len++;
		}
		return len;
	}
	
	//숫자만 입력 가능
	function numberOnly(evt){
		var code = evt.which?evt.which:event.keyCode;
		if(code < 48 || code > 57){
			return false;
		}
	}
	
	
	
	function gotoPay(orderForm){
		var payType = (document.getElementsByName("payType"))[0].value;
		var cid = "";
		var zip_code_enter = false;
		
		
		if(document.getElementsByName("order_recv_name")[0].value == ""){
			alert("이름을 입력해주세요.");
			document.getElementsByName("order_recv_name")[0].focus();
			return false;
		}
		
		if(document.getElementsByName("inputphone2")[0].value == "" || document.getElementsByName("inputphone3")[0].value == ""){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		
		
		if(document.getElementById("inputzip")){//온라인구매로 주소 입력창이 있을 땐
			for(var i = 0; i < document.getElementsByName("order_recv_zip_code").length; i++){
				if(document.getElementsByName("order_recv_zip_code")[i].value != ""){
					zip_code_enter = true;
				}
			}
			
			if(!zip_code_enter){
				alert("주소를 입력해주세요.");
				return false;
			}
		}else{//바로드림으로 문자인증 할 땐
			//***************주석 풀어야됨
			/* if(document.getElementById("confirmSMS").value == "false"){
				alert("문자 인증을 완료하세요.");
				return false;
			} */
			if(document.getElementById("confirmEmail").value == "false"){
				alert("이메일 인증을 완료하세요");
				return false;
			}
			
		}
		
		if(payType == ""){
			alert("결제 타입을 선택해 주세요.");
		}else{
			var check_confirm = document.getElementById("order_confirm_box").checked;
			if(check_confirm){
				
				orderForm.action = "pay.jsp";
				
				orderForm.submit();
			}else{
				alert("주문 내역 확인 동의를 선택해 주십시오.");
			}
		}
	}
	
	
	
	
	function find_addr2(){
		new daum.Postcode({
	        oncomplete: function(data) {
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	               extraRoadAddr += data.bname;
	           }
	           // 건물명이 있고, 공동주택일 경우 추가한다.
	           if(data.buildingName !== '' && data.apartment === 'Y'){
	              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	           }
	           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	           if(extraRoadAddr !== ''){
	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	           }
	           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	           if(fullRoadAddr !== ''){
	               fullRoadAddr += extraRoadAddr;
	           }

	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           console.log(data.zonecode);
	           console.log(fullRoadAddr);
	           
	           
	           $("input[name=order_recv_zip_code]").val(data.zonecode);
	           $("input[name=order_recv_street_addr]").val(fullRoadAddr);
	           
	           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	       }
	    }).open();
		
		}
	
	

	
	
</script>
</head>
<body>
	
	<div class="container-fluid mainPage">
	<%@include file="../../common/header.jspf"%>
	      	
	      	
	      	
		<div class="container-fluid">
			<div class="row">
			    <div class="col-sm-4 order_bar">
			      	비회원 결제
			    </div>
			    <div class="col-sm-8 order_bar">
			    	<div class="align-left">
						
						<img class="order-img" alt="장바구니이미지" src="${pageContext.request.contextPath}/resources/img/order/cartImage.png">&nbsp;&nbsp;
						<img class="order-img" alt="사은품이미지" src="${pageContext.request.contextPath}/resources/img/order/goodsImage.png">&nbsp;&nbsp;
						<img class="order-img" alt="결제이미지" src="${pageContext.request.contextPath}/resources/img/order/BuyImage.png">&nbsp;&nbsp;
						<img class="order-img" alt="피니쉬이미지" src="${pageContext.request.contextPath}/resources/img/order/finishBlackImage.png">
					
					</div>
				</div>
			</div>
		</div>
	    <div class="row">
	       <!-- 왼쪽 사이드바 -->
	        <div class="col-xl-2 col-md-2 mb-2"></div>

	        
	        <!-- 본문영역 -->
	        <div class="col-xl-8 col-md-8 mb-8 bg-light">

	      	
				
				<br><br><br>
				
				<div class="container-fluid">
					<form action="post">
					<div class="row">
						<!-- 왼쪽 본문 -->
						<div class="col-sm-7">
						
							<!-- 주문자 정보 테이블 -->
							<table class="left_table" border>
								<tr>
									<td class="th">주문자 이메일</td>
									<td class="td">
										<input type="email" name="order_nonmem_email" id="orderEmailText">
										<input type="button" onclick="sendEmail()" value="인증메일 전송"><br>
										<input type="text" id="emailConfirmText">
										<input type="button" onclick="confirmEmailButton()" value="이메일 확인">
										<input type="hidden" id="confirmEmail" value="false">
									</td>
								</tr>
								
							</table>
							<br><br>
							
							<!-- 배송지 선택 ul -->
							<ul class="tab">
								<li class="current_delivery" data-tab="tab1"><a href="#">배송</a></li>
								<!-- <li data-tab="tab2"><a href="#">책 별 배송</a></li> -->
							</ul>
							
							
							
							<!-- online 배송(시작) -->
							<div id="tab1" class="tabcontent current_delivery">
								<c:if test="${requestScope.store_code eq 'online'}">
								<table class="left_table" border>
									<tr>
										<td class="th">이름</td>
										<td>
											<input id="inputname" type="text" name="order_recv_name" placeholder="10자리 내 입력">
										</td>
									</tr>
									<tr>
										<td>휴대폰</td>
										<td>
											<select name="inputphone1">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="019">019</option>
											</select>
											<input class="inputphone2" type="text" name="inputphone2" onkeypress="return numberOnly(event)">
											<input class="inputphone2" type="text" name="inputphone3" onkeypress="return numberOnly(event)">
										</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>
											<div style="line-height: 220%;">
												<input id="inputzip" type="text" name="order_recv_zip_code" id="order_recv_zip_code" readonly>&nbsp;
												<input type="button" class="btn btn-secondary" id="find_addr" onclick="find_addr2()" value="주소찾기">
												
												<br>
												<input class="inputaddr" type="text" name="order_recv_street_addr"><br>
												<input class="inputaddr" type="text" name="order_recv_remaining_addr">
											</div>
										</td>
									</tr>
									<tr>
										<td>배송 요청사항</td>
										<td>
											<input class="inputaddr" type="text" name="order_message">
										</td>
									</tr>
									
								</table>
								</c:if>
								<c:if test="${requestScope.store_code ne 'online'}">
								<table class="left_table" border>
									<tr>
										<td class="th">바로드림 수령점</td>
										<td style="color: navy;">${requestScope.storevo.store_name } 바로드림존</td>
									</tr>
									<tr>
										<td>수령 가능 시간</td>
										<td>8시간 이후 영업시간 이내</td>
									</tr>
									<tr>
										<td>받는 분 이름</td>
										<td>
											<input id="inputname" type="text" name="order_recv_name" placeholder="10자리 내 입력">
										</td>
									</tr>
									<tr>
										<td>휴대폰</td>
										<td>
											<select name="inputphone1" id="phoneConfirm1">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="019">019</option>
											</select>
											<input class="inputphone2" type="text" name="inputphone2" id="phoneConfirm2" onkeypress="return numberOnly(event)">
											<input class="inputphone2" type="text" name="inputphone3" id="phoneConfirm3" onkeypress="return numberOnly(event)">
											<input type="button" onclick="sendSms()" value="인증번호전송"><br>
											<input style="width: 80px;" type="text" id="smsConfirmText">
											<input class="inputphone2" type="button" onclick="smsConfirmButton()"  value="확인">
											<input type="hidden" id="confirmSMS" value="false">
										</td>
									</tr>
									<tr>
										<td>길찾기</td>
										<td>
											${requestScope.storevo.street_addr } ${requestScope.storevo.remaining_addr } 바로드림존
											<br>
											<input type="button" value="${requestScope.storevo.store_name }">
										</td>
									</tr>
									
									
								</table>
								</c:if>
							</div>
							<!-- online 배송(끝) -->
							
						
							
							
							
							
							<!-- 주문상품(시작) -->
							<div class="margin_top50">
								<div class="box_title_area">
									<span style="display: inline-block;">
										<span class="middle center orderList">
											주문상품(${requestScope.bookSort }종 ${requestScope.booksAll_cnt }개)
										</span>
									</span>
									<span  style="float: right;">
										<a href="javascript:;" class="btn_toggle on">
											<img class="btn_toggle_img" alt="열기/닫기" src="${pageContext.request.contextPath}/resources/img/order/top.png">
										</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</span>
								</div>
								<div style="display: block;">
									<table class="left_table" border>
										<tr>
											<th class="book-th book-th-first">상품정보</th>
											<th class="book-th">판매가</th>
											<th class="book-th">배송/판매자</th>
										</tr>
										
										
										<c:if test="${empty orderbook_cnt }">
										<c:forEach var="cartbookvo" items="${requestScope.cartbookvoList }" varStatus="status">
										<tr>
											<td>
												<input type="hidden" name="cart_idxs" value="${cartbookvo.cart_idx }">
												<img class="book-img" alt="책 이미지${cartbookvo.book_no }" src="${cartbookvo.book_img }">
												${cartbookvo.book_name }
											</td>
											<td class="center middle">
												${cartbookvo.book_saleprice * cartbookvo.cnt } <span class="line">|</span> 수량 ${cartbookvo.cnt }
												개<br>
												${cartbookvo.book_saleprice }원
											</td>
											<c:if test="${status.first }">
												<td class="center" rowspan="${requestScope.cartbookvoList.size() + requestScope.orderGoodsVOList.size() }">
													<c:if test="${requestScope.store_code eq 'online' }">
													온라인배송
													</c:if>
													<c:if test="${requestScope.store_code ne 'online' }">
													${requestScope.storevo.store_name } 바로드림
													</c:if>
												</td>
											</c:if>
										</tr>
										</c:forEach>
										</c:if>
										
										
										<c:if test="${not empty orderbook_cnt }">
										<c:forEach var="bookvo" items="${requestScope.orderBookList }" varStatus="status">
										<tr>
											<td>
												<img class="book-img" alt="책 이미지${bookvo.book_no }" src="${bookvo.book_img }">
												${bookvo.book_name }
											</td>
											<td class="center middle">
												${bookvo.book_saleprice * orderbook_cnt }원 <span class="line">|</span> 수량 ${orderbook_cnt }
												개<br>
												${bookvo.book_saleprice }원
											</td>
											<c:if test="${status.first }">
											<td class="center" rowspan="${requestScope.orderBookList.size() + requestScope.orderGoodsVOList.size() }">
												<c:if test="${requestScope.store_code eq 'online' }">
												온라인배송
												</c:if>
												<c:if test="${requestScope.store_code ne 'online' }">
												${requestScope.storevo.store_name } 바로드림
												</c:if>
											</td>
											</c:if>
										</tr>
										</c:forEach>
										</c:if>
										
										
										
										
										
										
										<!-- 선택한 굿즈 표시 -->
										<c:forEach var="goodsvo" items="${orderGoodsVOList }">
										<tr>
											<td>
												<img class="book-img" alt="굿즈 이미지${goodsvo.goods_code }" src="${pageContext.request.contextPath}/resources/img/goods_img/${goodsvo.goods_image }">
												(사은품)${goodsvo.goods_name }
											</td>
											<td class="center">
												${goodsvo.goods_price }원
											</td>
										</tr>
										</c:forEach>
										
										
									</table>
								</div>
							</div>
							<!-- 주문상품(끝) -->
							
							<!-- 포인트(시작) -->
							<div class="margin_top50">
								<table class="left_table">
									<tr>
										<td class="border-top-bottom">사은품 구매 시 사용한 포인트</td>
										<td class="text-align-right border-top-bottom">${requestScope.bgp.usedpoint }P</td>
									</tr>
									<tr>
										<td class="border-top-bottom">남은 보유 포인트</td>
										<td class="text-align-right border-top-bottom"><span id="extrapoint">${requestScope.bgp.extrapoint }</span>P</td>
									</tr>
									<tr>
										<td class="border-top-bottom">사용할 포인트</td>
										<td class="text-align-right border-top-bottom">
											<input type="number" name="usepointForPay" onkeypress="numberOnly(event)" value="0">P
										</td>
									</tr>
								</table>
							</div>
							<!-- 포인트(끝) -->
							
							
							<!-- 결제 정보(시작) -->
							<div class="margin_top50 row">
								
								<div class="box_title_area">
									<span style="display: inline-block;">
										<span class="middle center orderList">
											결제 정보
										</span>
									</span>
								</div>
								
								<table class="left_table pay-table">
									<tr>
										<td class="center pay-table payImg" id="kakaopay">
											<img alt="카카오페이" src="${pageContext.request.contextPath}/resources/img/pic/kakaopay.png">
										</td>
										<td class="center pay-table payImg" id="smilepay">
											<img alt="스마일페이" src="${pageContext.request.contextPath}/resources/img/pic/smilepay.png">
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="payType" value="">
							</div>
							<!-- 결제 정보(끝) -->
							
							
						</div>
						
						
						
						<!-- 오른쪽 본문 -->
						<div class="col-sm-5">
							<div class="margin_top50">
								<table class="left_table right_content" border style="border: 1px solid black;">
									<tr>
										<td class="left_table_th">책 구매 금액</td>
										<td class="text-align-right">
										${pageScope.totalBookPrice } 원
										</td>
									</tr>
									<tr>
										<td>사은품 구매 금액</td>
										<td class="text-align-right">${pageScope.totalGoodsPrice } 원</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td class="text-align-right">
											<span id="deliveryPayment"></span>
											원
										</td>
									</tr>
									<tr>
										<td>사용 포인트</td>
										<td class="text-align-right"><span id="usedPoint">${requestScope.bgp.usedpoint }</span> P</td>
									</tr>
									<tr>
										<td>추가 결제금액</td>
										<td class="text-align-right">${requestScope.bgp.extra } 원</td>
									</tr>
									<tr>
										<td style="font-size: 25px; font-weight: 600;">최종 결제 금액</td>
										<td class="text-align-right">
											<span id="totalPayment"></span>
											원
										 </td>
									</tr>
								</table>
							</div>
							<div class="margin_top25">
								<label>
									<input type="checkbox" id="order_confirm_box">
									주문내역 확인 동의
								</label>
							</div>
							<div class="margin_top25 center">
								<input type="button" class="btn btn-outline-secondary orderfinishbutton" value="결제하기" onclick="gotoPay(this.form)">
							</div>
							<div class="margin_top5 center">
								<input type="button" class="btn btn-outline-secondary gocartbutton" value="장바구니로" >
							</div>
							
						</div>
						
						
						<input type="hidden" name="totalPaymentReal" value="">
						<input type="hidden" name="store_code" value="${requestScope.store_code }">
						<input type="hidden" name="point" value="${requestScope.point }">
						<input type="hidden" name="totalPayment" value="">
						<input type="hidden" name="mypoint" value="${requestScope.bgp.extrapoint }">
						
						<!-- 선택한 책 객체 저장 --><!-- 책 수량은 내 카트에서 책 넘버와 같은 것의 수량을 저장 -->
						<c:forEach var="bookvo" items="${requestScope.orderBookList }">
							<input type="hidden" name="orderbook_no" value="${bookvo.book_no }">
						</c:forEach>
						
						<!-- 바로구매일 때 필요한 값 -->
						<c:if test="${not empty orderbook_cnt }">
							<input type="hidden" name="orderbook_cnt" value="${orderbook_cnt }">
						</c:if>
						
						<c:forEach var="goodsvo" items="${orderGoodsVOList }">
							<input type="hidden" name="ordergoods_no" value="${goodsvo.goods_code }">
						</c:forEach>
						
					</div>
					</form>
				</div>
				
				
				
				
				
				
	      	</div>
	      
	      <!-- 오른쪽 사이드바 -->
	        <div class="col-xl-2 col-md-2 mb-2"></div>
	    </div>
	</div>
	<%@include file="../../common/footer.jspf"%>
</body>
</html>