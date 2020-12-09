<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.0.min.js" type="application/javascript"></script>
<script>
$(function(){//imp72120243 -> smilepay결제(naver아이디)
			 //imp08234510 ->kakaopay결제(gmail아이디)
    
	var payType = "${param.payType}";		 
	var IMP = window.IMP; // 생략가능
	if(payType == "kakaopay"){
		IMP.init('imp08234510'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	}else if(payType == "smilepay"){
		alert("dd");
		IMP.init('imp72120243'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	}
	
	var msg;
	
	
	alert(payType);
	
	//카카오페이
	IMP.request_pay({
		pg : payType,
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '지니문고',
		amount : "${param.totalPaymentReal}",
		buyer_email : '${sessionScope.user.email }',
		buyer_name : '${sessionScope.user.user_name }',
		buyer_tel : "${sessionScope.user.phone_number1}",
		buyer_addr : "${parma.order_recv_street_addr}"
			+ "${param.order_recv_remaining_addr}",
		buyer_postcode : "${param.order_recv_zip_code}",
	//m_redirect_url : 'http://www.naver.com'
	}, function(rsp) {
	if ( rsp.success ) {
		//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		jQuery.ajax({
		   url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		   type: 'POST',
		   dataType: 'json',
		   data: {
		       imp_uid : rsp.imp_uid
		       //기타 필요한 데이터가 있으면 추가 전달
		   }
		}).done(function(data) {
		   //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		   if ( everythings_fine ) {
		       msg = '결제가 완료되었습니다.';
		       msg += '\n고유ID : ' + rsp.imp_uid;
		       msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		       msg += '\결제 금액 : ' + rsp.paid_amount;
		       msg += '카드 승인번호 : ' + rsp.apply_num;
		       
		       alert(msg);
		   } else {
		       //[3] 아직 제대로 결제가 되지 않았습니다.
		       //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		   }
		});
		alert("결제가 성공하였습니다.\n상세페이지로 이동합니다.");
		//성공시 이동할 페이지
		$("#payForm").attr("action", "orderFinish.do");
		$("#payForm").attr("method", "get");
		$("#payForm").submit();
		
	
	
	} else {
	msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	//실패시 이동할 페이지
	//내 장바구니 페이지로 
	location.href="${pageContext.request.contextPath}/cart";
	alert(msg);
	}
	});

	
	
	
	
	
	
});



/*   function requestPay() {
	  IMP.init('imp08234510');
    // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",
        name: "노르웨이 회전 의자",
        amount: 64900,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("성공");
        } else {
            alert("실패");
        }
    }); 
    
    
    
    
  }*/
  
 
  
  
</script>
<%
	
%>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<form id="payForm">
	<input type="hidden" name="order_recv_name" value="${param.order_recv_name }">
	<input type="hidden" name="order_recv_phone" value="${param.inputphone1 }-${param.inputphone2 }-${param.inputphone3 }">
	<input type="hidden" name="order_total_cost" value="${param.totalPayment }">
	<c:if test="${param.store_code eq 'online'}">
	<input type="hidden" name="order_message" value="${param.order_message }">
	<input type="hidden" name="order_recv_zip_code" value="${param.order_recv_zip_code}">
	<input type="hidden" name="order_recv_street_addr" value="${param.order_recv_street_addr}">
	<input type="hidden" name="order_recv_remaining_addr" value="${param.order_recv_remaining_addr}">
	</c:if>
	<input type="hidden" name="order_accu_point" value="${param.point }">
	<input type="hidden" name="basic_addr" value="${param.basic_addr }"><!-- 체크되어 있으면 value는 1 안 되어있으면 value는 빈 값이므로 "" -->
	
	<c:forEach var="book_no" items="${paramValues.orderbook_no }">
		<input type="hidden" name="orderbook_no" value="${book_no }">
	</c:forEach>
	
	<c:if test="${not empty param.orderbook_cnt }">
		<input type="hidden" name="orderbook_cnt" value="${param.orderbook_cnt }">
	</c:if>
	
	<c:if test="${empty param.orderbook_cnt }">cart_idx
		<c:forEach var="cart_idx" items="${paramValues.cart_idxs }">
			<input type="hidden" name="cart_idx" value="${cart_idx }">
		</c:forEach>
		
	</c:if>
	
	<c:forEach var="ordergoods_no" items="${paramValues.ordergoods_no }">
		<input type="hidden" name="ordergoods_no" value="${ordergoods_no }">
	</c:forEach>
	<input type="hidden" name="store_code" value="${param.store_code }">
	<input type="hidden" name="mypoint" value="${param.mypoint }">
	
	
	<c:if test="${not empty param.order_nonmem_email }">
		<input type="hidden" name="order_nonmem_email" value="${param.order_nonmem_email }">
	</c:if>
	
</form>
</body>
</html>