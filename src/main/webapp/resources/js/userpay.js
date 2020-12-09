
 	
	
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
					$(".btn_toggle_img").prop("src", "${pageContext.request.contextPath}/resources/images/order/bottom.png");
				}else{
					$(".btn_toggle_img").prop("src", "${pageContext.request.contextPath}/resources/images/order/top.png");
				}
			});
		});
		
		
		//포인트
		$("input[name=usepointForPay]").keyup(function(){
			if($(this).val() > extrapoint){
				alert("보유 포인트보다 많이 입력하셨습니다.\n다시 입력해주세요.");
				$(this).val(extrapoint);
				$("#totalPayment").html(totalPayment - parseInt($(this).val()));
				$("#usedPoint").html(parseInt("${requestScope.bgp.usedpoint }") + parseInt($(this).val()));
				$("input[name=mypoint]").val(parseInt("${requestScope.bgp.extrapoint }") - parseInt($(this).val()));
			}else if($(this).val() < 0){
				$(this).val(0);
			}else{//포인트 입력 제대로 했을 시
				if(!isNaN(parseInt($(this).val()))){//입력된 값이 숫자일 때
					$("#totalPayment").html(totalPayment - parseInt($(this).val()));
					$("#usedPoint").html(parseInt("${requestScope.bgp.usedpoint }") + parseInt($(this).val()));
					$("input[name=mypoint]").val(parseInt("${requestScope.bgp.extrapoint }") - parseInt($(this).val()));
				}else{//입력된 값이 숫자가 아닐 때
					$("#totalPayment").html(totalPayment);
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
		
		
		
		
		
		
	});
	
	
	var smsCode = "";
	
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
					alert(result);
					smsCode = result;
					alert(smsCode);
				}else{
					alert("인증번호 전송 실패");
				}
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
		if(document.getElementById("order_recv_zip_code")){//온라인구매로 주소 입력창이 있을 땐
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
			if(document.getElementById("confirmSMS").value == "false"){
				alert("문자 인증을 완료하세요.");
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