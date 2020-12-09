<%@page import="com.spring.biz.book.BookVO"%>
<%@page import="com.spring.biz.cart.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 화면</title>
<%@include file="/common/include.jspf" %>
<%@include file="/common/header.jspf" %>
<%@include file="/common/include.jspf" %>
<%@include file="/common/cartMenuBar.jspf" %>



<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>
      p { margin:40px 0px; }
      #sangpumjungbo th {
      	background-color: #F2F2F2;
      	height: 60px;
      	text-align: center;
      }
      
      #sangpumgumek td{
      	padding-left: 20px;
      	border-right: 6px dotted LightGray;
      	
      }
      
      #sangpumgumek th {
      	background-color: #F2F2F2;
      	padding-left: 20px;
      	height: 60px;
      	border-right: 6px dotted LightGray;
      	
      	
      }
      
      #sangpumgumek th:last-child{
      	border-right:none;
      }
      
      #sangpumgumek td:last-child{
      	border-right:none;
      }
      #genieIlbanbesong {
      	font-size: 1.5em;
      	color:  #5F0E1F;
      	font-weight: 600;
      }
      
   
	
	//
	.order_bar {
   background-color: #9F5252;
   height: 80px;
   font-size: 40px;
   color: white;
}

.middle{
   vertical-align: middle;
}

.align-left {
   float: right;
}

.order_bar .order-img {
   vertical-align: middle;
   width: 80px;
   height: 80px;
   
}

.space-img {
   vertical-align: middle;
   width: 0;
   height: 0;
   border-left: 40px solid #9F5252;
   border-top: 40px solid transparent;
   border-bottom: 40px solid transparent;
	}

	.order_bar span{
	   display: inline-block;
	}
	a {
	   cursor: pointer;
	}
	
	#btn1 {
		width:300px; height:50px; color:#474747;
		background-color: white;
		border: 0.5px solid lightGray;
		font-weight: bold;
		font-size: 1.2em;
	}
	#btn2 {
		width:300px; height:50px; color:white;
		background-color: #9F5252;
		border:none;
		font-weight: bold;
		font-size: 1.2em;
	}
	
	#lastT th {
		width:1400px;
		padding-left: 20px;
		padding-top: 20px;
		padding-bottom: 20px;
		
	}
	#lastT td {
		padding-left: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#lastTfirstTh {
		font-size:1.4em;
		font-weight:bold;
		padding-left:20px;
	}
	#lastT2 {
		width:1400px;
		
		
	}
	#lastT2 th {
        border-right: 0.8px solid lightGray;
        padding-left: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
        
    }
    #lastT2 td {
        border-right: 0.8px solid lightGray;
        padding-left: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
    }
    #lastT2 th:last-child{
    	border-right:none;
    }
    #lastT2 td:last-child{
    	border-right:none;
    }
    #lastT2 td {
    	height: 10px;
    	color: #999999;
    }
    
</style>
<style>

html, body {
   height: 100%;
   margin: 0;
  }
.mainPage {
   min-height: 100%;
   padding-bottom: 100px;
}
.footer {
   height: 100px;
   margin-top: -100px;
   
}


#grayLine {
      height: 80px;
      background-color:#8B8B8B;
   }
   #grayLine a {color:white;}
   #grayLine li {
      display:inline;
      color:white;
      border-right: 0.3px solid white;
      padding: 0px 10px 0px 10px;
      
   }
   #grayLine ul {
      padding-left: 10%;
      float: left;
      padding-top: 20px;
      padding-bottom: 20px;
      
   }

   #grayLine ul li:last-child {
      border-right: none;
      
   }
   
   #secondLine {
      float: left;
      padding-left: 10%;
      color: black;
      width:100%;
      background-color: #F5F5F5;
      
   }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

$(document).ready(function(){
	$(".newBookDetail").click(function(){
		alert("해당 책의 상세페이지로 이동합니다.");
		document.location.href = "goBookDetail.do?book_no=" + $(this).next().val();
		
	})
	
	
	$(".cntChange").click(function(){
		var result = confirm("수를 변경하시겠습니까?");
		if(result == false){
			return false;
		}
		 var cnt = $(this).prev().val(); //히든의 cnt값 
		 var saleprice = $(this).next().val();
		 var cart_idx = $(this).next().next().val();
		 $totalprice =  $(this).parent().next().children(":eq(0)");
		 $.ajax({
			 url: "changeCartBookCnt.do",
			 type: "post",
			 data:
				 {"cnt":cnt,
				  "cart_idx": cart_idx
				 },
			 	success: function(result){
			 		alert(result);
			 		if(result=="success"){
			 			$totalprice.html(cnt * saleprice);
			 			totalprice();
			 			alert("값이 변경되었습니다.");

			 		}else{
			 			alert("값 변경에 실패하였습니다.");
			 			return false;
			 		}
			 	},//success end
			 	error : function (request, status, error) {
			 	    alert ( "code :"+ request.status + "\ n"+ "message :"+ request.responseText + "\ n"+ "error :"+ error);
				}
		 });
	});//갯수변경 function end
	
	 //비회원 장바구니 갯수 변경 
	$(".cntChangeNon").click(function(){
		var result = confirm("수를 변경하시겠습니까?");
		if(result == false){
			return false;
		}
		 var cnt = $(this).prev().val(); //히든의 cnt값 
		 var saleprice = $(this).next().val();
		 var book_no = $(this).next().next().val();
		 $totalprice =  $(this).parent().next().children(":eq(0)");
		 
		 $.ajax({
			 url: "nonChangeCartBookCnt.do",
			 type: "post",
			 data:
				 {"cnt":cnt,
				  "book_no": book_no
				 },
			 	success: function(result){
			 		if(result=="success"){
			 			$totalprice.html(cnt * saleprice);
			 			totalprice();
			 			alert("값이 변경되었습니다.");

			 		}else{
			 			alert("값 변경에 실패하였습니다.");
			 			return false;
			 		}
			 	},//success end
			 	error : function (request, status, error) {
			 	    alert ( "code :"+ request.status + "\ n"+ "message :"+ request.responseText + "\ n"+ "error :"+ error);
				}
		 });
	});
		 
	
	
}); // jQuery end


function deletebtn(){
	var checkArr = new Array();
	$("input[name='ordercart_idx']:checked").each(function(e){
		
		console.log($(this).val());
		var value = $(this).val();
		checkArr.push(value);
	})
		
	$.ajax({
		url : "deleteCart.do",
		type : "post",
		data : { 
			chBox : checkArr
		},
		success : function(result){
			if(result == 1){
				alert("장바구니에 상품이 삭제되었습니다.");
				location.href="gocart.do";
			}else {
				alert("장바구니의 상품삭제를 실패하였습니다.");
			}
		}
	});
	}//delete function end
	
	
	function Nondeletebtn(){
		var checkArr = new Array();
		$("input[name='NonMemberBook_no']:checked").each(function(e){
			
			console.log($(this).val());
			var value = $(this).val();
			checkArr.push(value);
		})
			
		$.ajax({
			url : "${pageContext.request.contextPath }/NondeleteCart.do",
			type : "post",
			data : { 
				chBox : checkArr
			},
			success : function(result){
				if(result == 1){
					alert("[비회원]장바구니에 상품이 삭제되었습니다.");
					location.href="${pageContext.request.contextPath }/gocartNon.do";
				}else {
					alert("장바구니의 상품삭제를 실패하였습니다.");
				}
			}
		});
		}
	
	
</script>

</head>
<body>

<hr>
<body>
	
	<div class="container-fluid mainPage">
      <div class="row">
      <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
	        <div class="container-fluid">
	               <div class="row">
	                   
	                   <div class="col-sm-8 order_bar">
	                      <div class="align-left">
	                     </div>
	                  </div>
	               </div><!-- row end -->
	        </div>
	    <!-- 여기서부터~~~ -->    
	    
	    <!-- Nav tabs -->
	    <ul class="nav nav-tabs">
	    	<li class="nav-item">
	    		<a class="nav-link active" data-toggle="tab" href="#cart">일반배송(상품갯수)</a>
	    	</li>
	    	<li>
	    		<a class="nav-link" data-toggle="tab" href="#baroCart">바로드림(상품갯수)</a>
	    	</li>
	    </ul>
	    
	    <!--Tab panes -->
	    <div class="tab-content">
	    	<div class="tab-pane container active" id="cart">
	    	<c:if test="${not empty sessionScope.user}"><!-- 일반배송 회원일때 -->
	    	 <!-- -일반배송 회원일때 --> 
	    	   	 <form action="${pageContext.request.contextPath}/soomin/order/orderStep0.do" method="get">   
	    	  	 <br><br>
	                <div class="allCheck"><!-- 전체선택:지니일반배송옆 -->
	                	<input type="checkbox" name="allCheck" id="allCheck"/>
	                	&nbsp;<label for="allCheck">&nbsp;지니일반배송(상품갯수)</label> &nbsp;&nbsp;
	                <script>
	                	$("#allCheck").click(function(){
	                		var chk = $("#allCheck").prop("checked");
	                		if(chk){
	                			$(".chBox").prop("checked",true);
	                			
	                		} else {
	                			$(".chBox").prop("checked",false);
	                		}
	                	})
	                </script>
	                </div><!-- allCheck end -->
	    	  	<br>
                 
                 <table border id="sangpumjungbo">
                 	<tr>
                 		<th style="width:800px;">
                 			상품정보
                 		</th>
                 		<th style="width:200px;">
                 			판매가
                 		</th>
                 		<th style="width:200px;">
                 			수량
                 		</th>
                 		<th style="width:200px;">
                 			합계
                 		</th>
                 	</tr>
	    	  	
	    	  		<c:forEach var="cartlist" items="${cartlist }">
					<tr>
	    	  			<td style="padding-up:20px;">
							<div class="checkbox"><!-- 개별 체크박스 -->
								
								<input type="checkbox" onclick = "totalprice()" class="chBox" name="ordercart_idx" value="${cartlist.cart_idx }">
								<input type="hidden" value="${cartlist.book_saleprice * cartlist.cnt }">
								
							<script>
								var cnt = $(".cntChange").prev().val();
							
								$(".chBox").click(function(){
									$("#allCheck").prop("checked",false);//개별 체크박스 선택/선택해제시 모든 선택 체크박스 해제
									/* alert("나야 " + $(this).parent().parent().next().next().next().children(":eq(0)").html()); */
								});
								
								function totalprice(){
						     		var total = 0;
						     		$("input[name='ordercart_idx']:checked").each(function(e){
						     			var value = parseInt($(this).parent().parent().next().next().next().children(":eq(0)").html());
						     			/* alert(value); */
						     			total += value;
						     		})
						     		 $("#totalpriceExceptdeli").html(total);
						     		 alert($("#totalpriceExceptdeli").html());
						     		 if(total < 10000){
						     			 $("#deli").html(2500);
						     			 alert("배송비는 : " + $("#deli").html() + "원 입니다.");
						     			 $("#finaltotal").html(parseInt($("#totalpriceExceptdeli").html()) + 2500);
						     			 
						     		 }else{
						     			 $("#deli").html(0);
						     			alert("배송비는 : " + $("#deli").html() + "원 입니다.");
						     			$("#finaltotal").html(parseInt($("#totalpriceExceptdeli").html()));
						     		 }
						     		 
						     		 $("#defaultPoint").html(parseInt($("#finaltotal").html() * 5 / 100));
						     		 
						     		 if(parseInt($('#finaltotal').html()) > 50000){
						     			 $("#plusPoint").html(2000);
						     		 }else{
						     			$("#plusPoint").html(0);
						     		 }
						     		 
						     		 $("#totalPoint").html(parseInt($("#defaultPoint").html()) + parseInt($("#plusPoint").html()) );
						     				
						     		
						     	} //totalprice end
						     	
							</script>
							</div><!-- 개별 체크박스 end-->
							
							<img src="${cartlist.book_img }" style="width:200px; padding-left:40px; 
									padding-up:70px;">
							<span style="font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
							<span>
							[국내도서] ${cartlist.book_name }
							<input type="button" value="새창보기" onclick="goBookDetail()" class="newBookDetail">
							<input type="hidden" value="${cartlist.book_no }">
							
							</span>
							<br><br>
						</td>
						
						<td style="line-height:40px; text-align:center;">
					
							<span style="text-decoration:line-through">${cartlist.book_price }원 </span><br>
							<span>${cartlist.book_saleprice }원[10% ↓]</span><br>
							<span>${cartlist.getPoint() }P</span>
							
						</td>
						<td style="padding-left:20px">
							<input type="number" value="${cartlist.cnt }" style="width:80px" id="realcnt">
							<input type="button" value="변경" class="cntChange">
							<input type="hidden" value="${cartlist.book_saleprice }">
							<input type="hidden" id="cart_idx" value="${cartlist.cart_idx}">
							
						</td>
						<td style="padding-left:20px" class="totalprice">
							<span>${cartlist.book_saleprice * cartlist.cnt }</span>원
						</td>
					</tr>
					</c:forEach>    
                 </table><!-- 상품정보표 끝 -->
                 
					<br><hr><br>
                 		
				<div class="delete">
                <input type="button" value="삭제" class="deletebtn" onclick="deletebtn()">
                </div>
                
                <br><br>
                 <table id="sangpumgumek">
              		<tr> 			
						<th style="width:600px;">상품금액</th>
	              		<th style="width:300px;">배송비</th>
	              		<th style="width:200px;">결제 예정금액</th>
	              		<th style="width:100px; border-right:none">적립예정</th>
	              		<th style="width:200px;"><span id="totalPoint">0</span>P</th>
	              	</tr>
					<tr>
	              		<td><span id="totalpriceExceptdeli">0</span>원</td>
	              		<td><span id="deli">0</span>원</td>
	              		<td><span id="finaltotal">0</span>원</td>
	              		<td style="height:80px; padding-top: 20px; padding-bottom:20px; border-right:none">
	              			<span>기본적립</span><br>
	              			<span>추가적립</span><br>
	              		</td>
	              		<td style="height:80px; padding-top: 20px; padding-bottom:20px">
	              			<span id="defaultPoint">0</span>P<br>
	              			<span id="plusPoint">0</span>P<br>
	              		</td>
	              	</tr>	
	             </table><!-- 상품금액 표 끝 -->
	             
              		<hr><br>
              			
				<div style="text-align:right"><!-- 회원:장바구니 -->
		            <input type="submit" value="주문하기1" style="border-radius: 10px 10px;">
	              	<input type="hidden" value="online" name="store_code">
	            </div>
	    	  	</form>
	    	   </c:if>
				
				
				<!-- 일반배송 비회원일떄 -->
			  <c:if test="${empty sessionScope.user}"><!-- 비회원 장바구니 -->
				<form action="${pageContext.request.contextPath}/soomin/order/orderStep0.do" method="get">  
          
             	<br><br>	          
	            <div class="allCheckNon"><!-- 전체선택:지니일반배송옆 -->
                	<input type="checkbox" name="allCheckNon" id="allCheckNon"/>&nbsp;<label for="allCheck">&nbsp;지니일반배송(상품갯수)</label> &nbsp;&nbsp;
                <script>
                	$("#allCheckNon").click(function(){
                		var chk = $("#allCheckNon").prop("checked");
                		if(chk){
                			$(".chBoxNon").prop("checked",true);
                			
                		} else {
                			$(".chBoxNon").prop("checked",false);
                		}
                	})
                </script>
                </div><!-- allCheck end -->
                
                 <br>
	           
	            <table border id="sangpumjungbo">
                 	<tr>
                 		<th style="width:800px;">
                 			상품정보
                 		</th>
                 		<th style="width:200px;">
                 			판매가
                 		</th>
                 		<th style="width:200px;">
                 			수량
                 		</th>
                 		<th style="width:200px;">
                 			합계
                 		</th>
                 	</tr>
	           <c:forEach var="nonBookVo" items="${nonBookVoList }" ><!--비회원 일반배송 장바구니 -->
                 	<c:if test="${ nonBookVo.store_code eq 'online' }"><!-- 코드가 온라인일때 -->
					<tr>
						<td style="padding-up:20px;">
							<div class="checkbox"><!-- 개별 체크박스 -->
								
								<input type="checkbox" onclick = "totalpriceNon()" class="chBoxNon" name="NonMemberBook_no" value="${nonBookVo.book_no }">
								<input type="hidden" value="${ nonBookVo.book_saleprice * nonBookVo.cnt }">
								
							<script>
								var cnt = $(".cntChangeNon").prev().val();
							
								$(".chBoxNon").click(function(){
									$("#allCheckNon").prop("checked",false);//개별 체크박스 선택/선택해제시 모든 선택 체크박스 해제
									/* alert("나야 " + $(this).parent().parent().next().next().next().children(":eq(0)").html()); */// totalprice class의 총 값
								});
								
								function totalpriceNon(){
						     		var total = 0;
						     		$("input[name='NonMemberBook_no']:checked").each(function(e){
						     			var value = parseInt($(this).parent().parent().next().next().next().children(":eq(0)").html());
						     			/* alert("totalpriceNon의 function : " + value); */
						     			total += value;
						     		})
						     		
						     		 $("#totalpriceExceptdeliNon").html(total);
						     		 alert($("#totalpriceExceptdeliNon").html());
						     		 if(total < 10000){
						     			 $("#deliNon").html(2500);
						     			/*  alert("배송비 : " + $("#deliNon").html() + "원"); */
						     			 $("#finaltotalNon").html(parseInt($("#totalpriceExceptdeliNon").html()) + 2500);
						     			 
						     		 }else{
						     			 $("#deliNon").html(0);
						     			/* alert("배송비 : " + $("#deliNon").html() + "원"); */
						     			$("#finaltotalNon").html(parseInt($("#totalpriceExceptdeliNon").html()));
						     		 }
						     		 
						     		 $("#defaultPointNon").html(parseInt($("#finaltotalNon").html() * 5 / 100));
						     		 
						     		 if(parseInt($('#finaltotalNon').html()) > 50000){
						     			 $("#plusPointNon").html(2000);
						     		 }else{
						     			$("#plusPointNon").html(0);
						     		 }
						     		 
						     		 $("#totalPointNon").html(parseInt($("#defaultPointNon").html()) + parseInt($("#plusPointNon").html()) );
						     				
						     		
						     	} //totalprice end
							</script>
							</div><!-- 개별 체크박스 end-->
							<img src="${nonBookVo.getBook_img()}" style="width:200px; padding-left:40px; 
									padding-up:70px;">	
							<span style="font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
							<span>
							[국내도서] ${nonBookVo.getBook_name() }
							<input type="button" value="새창보기" onclick="goBookDetail()" class="newBookDetail">
							<input type="hidden" value="${nonBookVo.getBook_no() }">
							</span>
							<br><br>
						</td>
						<td style="line-height:40px; text-align:center;">
							<span style="text-decoration:line-through">${nonBookVo.getBook_price() }원 </span><br>
							<span>${nonBookVo.getBook_saleprice() }원[10% ↓]</span><br>
							<span>${nonBookVo.getPoint() }P</span>
							
						</td>
						
						<td style="padding-left:20px">
							<input type="number" value="${nonBookVo.getCnt() }" style="width:80px" id="realcnt">
							<input type="button" value="변경" class="cntChangeNon">
							<input type="hidden" value="${nonBookVo.getBook_saleprice() }">
							<%-- <input type="hidden" id="cart_idx" value="${nonBookVo.getCart_idx()}"> --%>
							
						</td>
						<td style="padding-left:20px" class="totalprice">
							<span>${nonBookVo.getBook_saleprice() * nonBookVo.getCnt() }</span>원
						</td>
					</tr>
	           		</c:if>
	           </c:forEach><!-- 비회원장바구니 불러오기 끝 -->
	           </table>
	           
	            <br><hr><br>
	           
	           <div class="delete">
                 <input type="button" value="삭제" class="deletebtn" onclick="Nondeletebtn()">
               </div><!--  delete class end -->
                 
                <br><br>
	           
	            <table id="sangpumgumek">
              	<tr>
              		<th style="width:600px;">상품금액</th>
              		<th style="width:300px;">배송비</th>
              		<th style="width:200px;">결제 예정금액</th>
              		<th style="width:100px; border-right:none">적립예정</th>
              		<th style="width:200px;"><span id="totalPointNon">0</span>P</th>
              	</tr>
              	
              	<tr>
              		<td><span id="totalpriceExceptdeliNon">0</span>원</td>
              		<td><span id="deliNon">0</span>원</td>
              		<td><span id="finaltotalNon">0</span>원</td>
              		<td style="height:80px; padding-top: 20px; padding-bottom:20px; border-right:none">
              			<span>기본적립</span><br>
              			<span>추가적립</span><br>
              			<!-- <span>회원혜택</span> -->
              		</td>
              		<td style="height:80px; padding-top: 20px; padding-bottom:20px">
              			<span id="defaultPointNon">0</span>P<br>
              			<span id="plusPointNon">0</span>P<br>
              			<!-- <span>0원P</span> -->
              		</td>
              	</tr>
              </table>
	           <hr><br>
	              <div style="text-align:right"><!-- 비회원 장바구니 -->
	              	<input type="submit" value="주문하기3" id="btn2" style="border-radius: 10px 10px;">
	               	<input type="hidden" value="online" name="store_code">
              	 </div>
	       </form>
	       </c:if><!-- 비회원 장바구니 끝 -->
	       </div><!-- actvie tab cart : 일반배송 end --> 
						
			
			
			
			<!-- ******************************************************** -->  
            <!-- ********************* 바로드림 시작 *********************** -->  
            <!-- ******************************************************** -->  
			
			
			
			
	    	<div class="tab-pane container fade" id="barocart">
	    	바로드림시작 
	    	<!-- 바로드림 회원일때 -->
	    	<form action="${pageContext.request.contextPath}/soomin/order/orderStep0.do" method="get"> 
	    	<c:if test="${not empty sessionScope.user}"><!-- 회원일때 -->
	    		<div class="allCheck"><!-- 전체선택:지니일반배송옆 -->
                	<input type="checkbox" name="allCheck" id="allCheck"/>&nbsp;<label for="allCheck">&nbsp;지니일반배송(상품갯수)</label> &nbsp;&nbsp;
                <script>
                	$("#allCheck").click(function(){
                		var chk = $("#allCheck").prop("checked");
                		if(chk){
                			$(".chBox").prop("checked",true);
                			
                		} else {
                			$(".chBox").prop("checked",false);
                		}
                	})
                </script>
                </div><!-- allCheck end -->
	    		<br>
	    		
				<table border id="sangpumjungbo">
                 	<tr>
                 		<th style="width:800px;">
                 			상품정보
                 		</th>
                 		<th style="width:200px;">
                 			판매가
                 		</th>
                 		<th style="width:200px;">
                 			수량
                 		</th>
                 		<th style="width:200px;">
                 			합계
                 		</th>
                 	</tr>	    	
	    			
	    			<c:forEach var="quickPickCartList" items="${quickPickCartList }"><!-- 회원 바로드림 -->
					<tr>
						<td style="padding-up:20px;">
							<div class="checkbox"><!-- 개별 체크박스 -->
								
								<input type="checkbox" onclick = "totalprice()" class="chBox" name="ordercart_idx" value="${quickPickCartList.cart_idx }">
								<input type="hidden" value="${quickPickCartList.book_saleprice * quickPickCartList.cnt }">
								
							<script>
								var cnt = $(".cntChange").prev().val();
							
								$(".chBox").click(function(){
									$("#allCheck").prop("checked",false);//개별 체크박스 선택/선택해제시 모든 선택 체크박스 해제
									alert("나야 " + $(this).parent().parent().next().next().next().children(":eq(0)").html());
								});
								
								function totalprice(){
						     		var total = 0;
						     		$("input[name='ordercart_idx']:checked").each(function(e){
						     			var value = parseInt($(this).parent().parent().next().next().next().children(":eq(0)").html());
						     			alert(value);
						     			total += value;
						     		})
						     		 $("#totalpriceExceptdeli").html(total);
						     		 alert($("#totalpriceExceptdeli").html());
						     		 if(total < 10000){
						     			 $("#deli").html(2500);
						     			 alert("배송비 : " + $("#deli").html() + "원");
						     			 $("#finaltotal").html(parseInt($("#totalpriceExceptdeli").html()) + 2500);
						     			 
						     		 }else{
						     			 $("#deli").html(0);
						     			alert("배송비 : " + $("#deli").html() + "원");
						     			$("#finaltotal").html(parseInt($("#totalpriceExceptdeli").html()));
						     		 }
						     		 
						     		 $("#defaultPoint").html(parseInt($("#finaltotal").html() * 5 / 100));
						     		 
						     		 if(parseInt($('#finaltotal').html()) > 50000){
						     			 $("#plusPoint").html(2000);
						     		 }else{
						     			$("#plusPoint").html(0);
						     		 }
						     		 
						     		 $("#totalPoint").html(parseInt($("#defaultPoint").html()) + parseInt($("#plusPoint").html()) );
						     				
						     		
						     	} //totalprice end
						     	
							</script>
							</div><!-- 개별 체크박스 end-->
							
							<img src="${quickPickCartList.book_img }" style="width:200px; padding-left:40px; 
									padding-up:70px;">
									<!-- /biz/resources/images/pic/심판.jpg -->
							<span style="font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
							<span>
							[국내도서] ${quickPickCartList.book_name }
							<input type="button" value="새창보기" onclick="goBookDetail()" class="newBookDetail">
							<input type="hidden" value="${quickPickCartList.book_no }">
							
							</span>
							<br><br>
							
						</td>
						<td style="line-height:40px; text-align:center;">
					
							<span style="text-decoration:line-through">${quickPickCartList.book_price }원 </span><br>
							<span>${quickPickCartList.book_saleprice }원[10% ↓]</span><br>
							<span>${quickPickCartList.getPoint() }P</span>
							
						</td>
						
						<td style="padding-left:20px">
							<input type="number" value="${quickPickCartList.cnt }" style="width:80px" id="realcnt">
							<input type="button" value="변경" class="cntChange">
							<input type="hidden" value="${quickPickCartList.book_saleprice }">
							<input type="hidden" id="cart_idx" value="${quickPickCartList.cart_idx}">
							
						</td>
						<td style="padding-left:20px" class="totalprice">
							<span>${quickPickCartList.book_saleprice * quickPickCartList.cnt }</span>원
						</td>
	    			</tr>
			    	</c:forEach>
				</table><!-- 상품정보 표 끝 -->
	    	
	    		<br><hr><br>
	    		
	    		 <div class="delete">
                 <input type="button" value="삭제" class="deletebtn" onclick="deletebtn()">
                 </div><!--  delete class end -->
                 
                <br><br>
	    	
	    	
	    		<table id="sangpumgumek">
	              	<tr>
	              		<th style="width:600px;">상품금액</th>
	              		<th style="width:300px;">배송비</th>
	              		<th style="width:200px;">결제 예정금액</th>
	              		<th style="width:100px; border-right:none">적립예정</th>
	              		<th style="width:200px;"><span id="totalPoint">0</span>P</th>
	              	</tr>
	              	
	              	<tr>
	              		<td><span id="totalpriceExceptdeli">0</span>원</td>
	              		<td><span id="deli">0</span>원</td>
	              		<td><span id="finaltotal">0</span>원</td>
	              		<td style="height:80px; padding-top: 20px; padding-bottom:20px; border-right:none">
	              			<span>기본적립</span><br>
	              			<span>추가적립</span><br>
	              			<!-- <span>회원혜택</span> -->
	              		</td>
	              		<td style="height:80px; padding-top: 20px; padding-bottom:20px">
	              			<span id="defaultPoint">0</span>P<br>
	              			<span id="plusPoint">0</span>P<br>
	              			<!-- <span>0원P</span> -->
	              		</td>
	              	</tr>
              </table><!-- 상품금액 표 끝 -->
	    	  <hr><br>
	              <div style="text-align:right"><!--회원 바로드림  -->
		              <input type="submit" value="주문하기2" id="btn2" style="border-radius: 10px 10px;">
		              <input type="hidden" value="${quickPickCartList.get(0).getStore_code() }" name="store_code" > 
	              </div>
	    	</c:if>
	    	</form>
	    	
	    	
	    	<!---바로드림 비회원  -->
	    	<c:if test="${empty sessionScope.user}"><!-- 비회원 장바구니 -->
	    	<form action="${pageContext.request.contextPath}/soomin/order/orderStep0.do" method="get"> 
            	<br><br>
                <div class="allCheckNon"><!-- 전체선택:지니일반배송옆 -->
                	<input type="checkbox" name="allCheck" id="allCheckNon"/>&nbsp;<label for="allCheck">&nbsp;지니일반배송(상품갯수)</label> &nbsp;&nbsp;
                <script>
                	$("#allCheckNon").click(function(){
                		var chk = $("#allCheckNon").prop("checked");
                		if(chk){
                			$(".chBoxNon").prop("checked",true);
                			
                		} else {
                			$(".chBoxNon").prop("checked",false);
                		}
                	})
                </script>
                </div><!-- allCheck end -->
	    		<br>
	    	
	    		<table border id="sangpumjungbo">
                 	<tr>
                 		<th style="width:800px;">
                 			상품정보
                 		</th>
                 		<th style="width:200px;">
                 			판매가
                 		</th>
                 		<th style="width:200px;">
                 			수량
                 		</th>
                 		<th style="width:200px;">
                 			합계
                 		</th>
                 	</tr>
	    	
	    			<!-- 바로드림 비회원   -->
	    			ㅎ호ㅓ호ㅗ호ㅓ허ㅗ허
                 	<c:forEach var="nonBookVo" items="${nonBookVoList }" >
                 	<c:if test="${ nonBookVo.store_code ne 'online' }">
					<tr>
						<td style="padding-up:20px;">
							<div class="checkbox"><!-- 개별 체크박스 -->
								
								<input type="checkbox" onclick = "totalpriceNon()" class="chBoxNon" name="NonMemberBook_no" value="${nonBookVo.book_no }">
								<input type="hidden" value="${ nonBookVo.book_saleprice * nonBookVo.cnt }">
								
								<%--  value="${ ${nonBookVoList.getBook_saleprice()} * ${nonMemCartList.getCnt()} }"> --%>
							<script>
								var cnt = $(".cntChangeNon").prev().val();
							
								$(".chBoxNon").click(function(){
									$("#allCheckNon").prop("checked",false);//개별 체크박스 선택/선택해제시 모든 선택 체크박스 해제
									/* alert("나야 " + $(this).parent().parent().next().next().next().children(":eq(0)").html()); */// totalprice class의 총 값
								});
								
								function totalpriceNon(){
						     		var total = 0;
						     		$("input[name='NonMemberBook_no']:checked").each(function(e){
						     			var value = parseInt($(this).parent().parent().next().next().next().children(":eq(0)").html());
						     			alert("totalpriceNon의 function : " + value);
						     			total += value;
						     		})
						     		
						     		 $("#totalpriceExceptdeliNon").html(total);
						     		 alert($("#totalpriceExceptdeliNon").html());
						     		 if(total < 10000){
						     			 $("#deli").html(2500);
						     			 alert("배송비는 : " + $("#deliNon").html() + "원 입니다.");
						     			 $("#finaltotalNon").html(parseInt($("#totalpriceExceptdeliNon").html()) + 2500);
						     			 
						     		 }else{
						     			 $("#deliNon").html(0);
						     			alert("배송비 : " + $("#deliNon").html() + "원 입니다.");
						     			$("#finaltotalNon").html(parseInt($("#totalpriceExceptdeliNon").html()));
						     		 }
						     		 
						     		 $("#defaultPointNon").html(parseInt($("#finaltotalNon").html() * 5 / 100));
						     		 
						     		 if(parseInt($('#finaltotalNon').html()) > 50000){
						     			 $("#plusPointNon").html(2000);
						     		 }else{
						     			$("#plusPointNon").html(0);
						     		 }
						     		 
						     		 $("#totalPointNon").html(parseInt($("#defaultPointNon").html()) + parseInt($("#plusPointNon").html()) );
						     				
						     		
						     	} //totalprice end
						     	
							</script>
							</div><!-- 개별 체크박스 end-->
							
							<img src="${nonBookVo.getBook_img()}" style="width:200px; padding-left:40px; 
									padding-up:70px;">
							<span style="font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
							<span>
								[국내도서] ${nonBookVo.getBook_name() }
								<input type="button" value="새창보기" onclick="goBookDetail()" class="newBookDetail">
								<input type="hidden" value="${nonBookVo.getBook_no() }">
							</span>
							
							<br><br>
						</td>
						<td style="line-height:40px; text-align:center;">
							<span style="text-decoration:line-through">${nonBookVo.getBook_price() }원 </span><br>
							<span>${nonBookVo.getBook_saleprice() }원[10% ↓]</span><br>
							<span>${nonBookVo.getPoint() }P</span>
							
						</td>
						
						<td style="padding-left:20px">
							<input type="number" value="${nonBookVo.getCnt() }" style="width:80px" id="realcnt">
							<input type="button" value="변경" class="cntChangeNon"><!-- 바로드림 비회원 -->
							<input type="hidden" value="${nonBookVo.getBook_saleprice() }">
							<input type="hidden" value="${nonBookVo.getBook_no() }">
							<%-- <input type="hidden" id="cart_idx" value="${nonBookVo.getCart_idx()}"> --%>
							
						</td>
						<td style="padding-left:20px" class="totalprice">
							<span>${nonBookVo.getBook_saleprice() * nonBookVo.getCnt() }</span>원
						</td>
					</tr>
					</c:if>
					</c:forEach> 
                 </table>
                 <br><hr><br>	
					
				<div class="delete">
                 <input type="button" value="삭제" class="deletebtn" onclick="Nondeletebtn()">
                </div>			
				<br><br>		
					
				<table id="sangpumgumek">
              	<tr>
              		<th style="width:600px;">상품금액</th>
              		<th style="width:300px;">배송비</th>
              		<th style="width:200px;">결제 예정금액</th>
              		<th style="width:100px; border-right:none">적립예정</th>
              		<th style="width:200px;"><span id="totalPointNon">0</span>P</th>
              	</tr>
              	
              	<tr>
              		<td><span id="totalpriceExceptdeliNon">0</span>원</td>
              		<td><span id="deliNon">0</span>원</td>
              		<td><span id="finaltotalNon">0</span>원</td>
              		<td style="height:80px; padding-top: 20px; padding-bottom:20px; border-right:none">
              			<span>기본적립</span><br>
              			<span>추가적립</span><br>
              			<!-- <span>회원혜택</span> -->
              		</td>
              		<td style="height:80px; padding-top: 20px; padding-bottom:20px">
              			<span id="defaultPointNon">0</span>P<br>
              			<span id="plusPointNon">0</span>P<br>
              			<!-- <span>0원P</span> -->
              		</td>
              	</tr>
              </table><!-- 상품금액 표 끝 -->		
			  <hr><br>
	           <div style="text-align:right"><!-- 비회원 바로드림 -->
              		<input type="submit" value="주문하기4" id="btn2" style="border-radius: 10px 10px;">
               		<input type="hidden" value="${nonBookVoList.get(0).getStore_code() }" name="store_code" > 
               </div>				
	    	</form>
	    	</c:if>
	        </div><!--container fade : 바로드림 end -->
	    </div><!-- tab content end -->
	    
	     <%--배송 유의 사항  --%>
              <table id="lastT">
              	<tr>
              		<th id="lastTfirstTh">배송 유의사항 및 이용 혜택 안내</th>
              		<th>
              			<a href=#none id="show" 
              			onclick="if(hide.style.display=='none')
              				{hide.style.display='';show.innerText='접기'}
              			else {hide.style.display='none';show.innerText='펼치기'}"
              			style="float:left"
              			>펼치기</a>
              		</th>
              		<th>&nbsp;&nbsp;</th>
              		<th><span style="float:right; padding-right:20px;">
              		<input type="button" value="주문/결제FAQ" style="color:blue; background-color:white"></span></th>
              	</tr>
              	</table>
              	
              	<div id="hide" style="display: none">
              	<table id="lastT2">
              	<tr style="font-weight:bold; font-size: 1.2em">
              		<th>배송 및 배송비</th>
              		<th>해외주문도서</th>
              		<th>바로드림</th>
              		<th>혜택 및 기타안내</th>
              	</tr>
              
              	<tr>
              		<td><a>배송일정</a></td>
              		<td><a>해외주문 유의사항</a></td>
              		<td><a>바로드림 이용 안내</a></td>
              		<td><a>적립예정 통합포인트</a></td>
              	</tr>
              	<tr>
              		<td><a>당일배송 유의사항</a></td>
              		<td><a>해외주문 반품/취소 안내</a></td>
              		<td><a>바로드림 수령예정일 안내</a></td>
              		<td><a>도서 소득공제 안내</a></td>
              	</tr>
              	<tr>
              		<td><a>배송비 안내</a></td>
              		<td>&nbsp;&nbsp;</td>
              		<td><a>바로드림 불가 안내</a></td>
              		<td><a>장바구니 이용 안내</a></td>
              	</tr>
              </table>
              <br><br><br>
              </div>
	    
        </div><!-- col div end -->
      </div><!-- row div end -->
    </div>
     <!-- 오른쪽 사이드바 -->
    <div class="col-xl-2 col-md-2 mb-2"></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
<%@include file="/common/footer.jspf"%>
</html>