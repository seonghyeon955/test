<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>${param.book_name } - 지니문고</title>
</head>
<style>
	
	#bookN {
		font-size:1.5em;
		font-weight:bold;
	}
	
	#bookEtc li {
		list-style:none;
		display:inline-block;
		padding-right:10px;
		padding-left: 10px;
	}
	#bookEtc li:second-child{
		border-right: 0.3px solid black;
	}
	
	
	#orderinfo {
		margin: auto;
	}
	
	
	table td {
		width:150px;
		height:80px;
		text-align: center;
		
	}
	
	#orderinfo th{
		width:300px;
		height:80px;
	}
	
	#orderinfo {
		font-size:1.3em;
	}
	
	
</style>
<script>
	
	function order(){
		var cnt = document.getElementById('realCnt').value;
		alert("갯수 : " + cnt);
		if ( "${empty sessionScope.user}" ){//비회원일때 바로드림

				opener.parent.setChildValue('${param.store_code}',cnt);

				window.close();

				
			/*  document.location.href="${pageContext.request.contextPath}/soomin/order/orderStep0.do?orderbook_cnt=" + cnt +
					 "&orderbook_no=${param.book_no}&store_code=${param.store_code}"; */
			 //비회원이면 nonmemberbook_no , store_code
		 }else {//회원일때 
			 
			 document.location.href="${pageContext.request.contextPath}/soomin/order/orderStep0.do?orderbook_cnt=" + cnt + 
					 "&orderbook_no=${param.book_no}&store_code=${param.store_code}";
			 //orderCart_idx 회원일때 cart_idx store_code 
			 
		}
		
	}
	
	function jegoPickupGo() {
	   /*  window.opener.name = "bookDetail"; // 부모창의 이름 설정
	    frm.target = "bookDetail"; // 타켓을 부모창으로 설정
	    frm.action = "../cart.do";
	    frm.submit();
	    self.close();   */
	    
		/* opener.location.href = "../cart.do";
		self.close(); */
		opener.location.href = "${pageContext.request.contextPath }/goQuickPickCart.do";
		/* bookDetail.location.href = "../cart.do"; */
		/* self.close(); */
		window.close();
		
	 }


	$(function(){
		$("#realCnt").change(function(){//값이 바뀌었을때
			var cnt = $("#realCnt").val();
			var total=0;
			total = parseInt("${param.book_saleprice }") * parseInt(cnt);
				
			$("#realTotal").html(total);
		});
		
		
	});
	
	/* function quickpicCart(){//바로드림 카트에 값 넣기
		var book_no = "${param.book_no}";
		var cnt = document.getElementById("realCnt").value;
		var store_code = "${param.store_code}";
		document.location.href="../quickpicCart.do?book_no="+book_no+"&cnt="+cnt+"&store_code="+store_code;
	} */
	
	function quickPicCart(){//바로드림 장바구니에 넣기-회원일떄
		
		var book_no = "${param.book_no}";
		var cnt = document.getElementById("realCnt").value;
		var store_code = "${param.store_code}";
		
		alert(book_no + "번 책, " + cnt + "권, 가게번호 : " + store_code);
		
		if('${sessionScope.user}' != ""){ //바로드림 : 회원일경우
			$.ajax({
				url : "${pageContext.request.contextPath }/quickPickCart.do",
				type: "post",
				dataType: "json",
				data:{
					 "book_no":book_no,
					 "cnt":cnt,
					 "store_code":store_code },
					
					success: function(result){//sucess
						alert("result : " + result.success);
						console.log(result);
						
						if(result.success == "success"){
							alert("[바로드림]선택한 상품이 장바구니에 담겼습니다.");
								if(confirm("장바구니로 이동하시겠습니까?")==true){//확인
									/* document.location.href= "goQuickPickCart.do"; */
									jegoPickupGo();
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
			
		}else {//바로드림 : 비회원일때 장바구니에 넣기
			var ask = confirm("로그인 하시겠습니까?");
			if(ask == true){
				opener.location.href="${pageContext.request.contextPath }/Jungha/mem_login.jsp";
				window.close();
				return false;
			}
			
			$.ajax({//비회원 바로드림 장바구니 
				url : "${pageContext.request.contextPath }/quickCartNonMem.do",
				type: "post",
				//contentType:"application/json",
				dataType: "json",
				data:{
					 "book_no":book_no,
					 "cnt":cnt,
					 "store_code":store_code },
				
					success: function(result){//sucess
						alert("result : " + result.success);
						console.log(result);
						
						if(result.success == "success"){
							alert("[비회원]선택한 상품이 장바구니에 담겼습니다.");
								if(confirm("[비회원]장바구니로 이동하시겠습니까?")==true){//확인
									opener.location.href= "${pageContext.request.contextPath }/goQuickCartNonMem.do";
									window.close();
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
</script>
<body>
	<div id="jegopickupContainer">
		<div id="jegopicContent">
			<p>
				<!-- "/biz/resources/images/pic/logo.png" -->
				<img src="${pageContext.request.contextPath }/resources/img/pic/logo.png" alt="로고" style="width:200px; float:left">
				<span style="float:right;">02) 888-8282</span>
			</p>
			<br><br>
			<hr><br>
			<%-- <c:if test="${not empty bookVo }"> --%>
					<ul id="bookEtc">
						<li id="bookN">[인문]${param.book_name }</li>
						<span style="float:right;">
							<li style="border-right: 0.3px solid black;">${param.book_writer }</li>
							<li>${param.book_saleprice }원</li>
						</span>
					</ul>
				<hr><br>
				<table border id="orderinfo">
				<tr>
					<th>주문수량</th>
					<td id="cnt" style="padding-left:200px;">
					<span class="price">${param.book_saleprice } x </span>
					<span><input type="number" id="realCnt" value="1" style="font-size:1.3em; width:80px; height:30px;">원</span>
					</td>
				</tr>
				
				<tr>
					<th>주문금액</th>
					<td class="totalprice" style="padding-left:300px;">
						<span id = "realTotal">${param.book_saleprice }</span>원
					</td>
				</tr>
				
				<tr>
					<th>수령 가능 시간</th>
					<td style="padding-left:200px;">당일 수령 가능(6시간 이후)</td>
				</tr>
		</table>
			
			<p style="padding-left:10px">*바로드림 서비스는 경품,사은품 등이 포함되지 않습니다.</p>
			
		</div><%--jegopicContent end --%>
		<div id="goBtnCenter">
			<table style="width:100%">
				<tr>
					<td>
						<input type="button" onclick="quickPicCart()" value="바로드림 장바구니 담기" style="WIDTH: 180pt; HEIGHT: 40pt; font-size:1.2em;">
						<input type="button" onclick="order()" value="바로드림 구매하기" style="WIDTH: 180pt; HEIGHT: 40pt; font-size:1.2em;">
					</td>
				</tr>
			</table>
		</div>
	</div><%--jegopickupContainer end --%>

	<br>
	<p style="font-weight:bold; font-size:1.2em; padding-left:20px" >바로드림 이용안내</p>
	<ul style="padding-left:50px;">
		<li>매장별로 수령 예상 시간이 다를 수 있으니, 주문 전에 꼭 수령 예상 시간을 확인해 주시기 바랍니다.</li>
		<li>바로드림 주문 상품 준비완료 후 7일간 미수령시 자동으로 결제 취소되고,<br> 
		취소된 금액은 결제수단의 승인취소 및 예치금으로 전환 됩니다.</li>
		<li>바로드림 주문 상품은 재고가 실시간 변동되어, 수령 예상시간에 수령하지 못하실 수 있습니다.</li>
		<li>바로드림 주문한 상품 상태가 좋지 않을 경우 해당매장에서 연락 드립니다.</li>
		<li>마이룸>회원정보에서 ‘바로드림 매장’을 설정해두시면 해당 매장 기준으로 바로드림 예상시간 확인
		<br> 및 빠른 주문이 가능합니다.</li>
	</ul>
</body>
</html>