<%@page import="org.omg.CORBA.Request"%>
<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@page import="com.bit.bookstore.vo.GoodsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 전 사은품선택창</title>
<%@include file="../../common/include.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ordermain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodsSelect.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<script src="${pageContext.request.contextPath}/resources/js/goodsSelect.js"></script>
<script>
	function cartgo(){
		document.location.href="${pageContext.request.contextPath}/gocart.do";
	}
</script>
</head>
<body>




<div class="container-fluid mainPage">
	<%@include file="/common/header.jspf"%>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4 order_bar">
		  	사은품 선택
		  	</div>
			<div class="col-sm-8 order_bar">
			  	<div class="align-left">
				
					<img class="order-img" alt="장바구니이미지" src="${pageContext.request.contextPath}/resources/img/order/cartImage.png">
					<img class="order-img" alt="사은품이미지" src="${pageContext.request.contextPath}/resources/img/order/goodsImage.png">
					<img class="order-img" alt="결제이미지" src="${pageContext.request.contextPath}/resources/img/order/BuyBlackImage.png">
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
         
				
			<p style="clear:both;">&nbsp;</p>
<%
	
	//테이블 설정을 위한 코드
	List<GoodsVO> goodsList = (List<GoodsVO>) request.getAttribute("goodsList");
	int goodsListSize = 0;
	
	goodsListSize = goodsList.size() % 6;
	
	System.out.println("goodsListSize : " + goodsListSize);
	request.setAttribute("goodsListSize", goodsListSize);
	int begin = 0; 
%>
			<form method="post">
			<table >
				<c:forEach begin="0" end="${goodsList.size()/6 }">
			
<%
	int end = 0;
	if(goodsList.size() > begin + 6) {
		end = 5 + begin;
		System.out.println("end : " + end);
	} else {
		end = goodsList.size()%6 + begin;
		System.out.println("end : " + end);
	}
%>
				<tr>
					<c:forEach var="goodsvo" begin="<%= begin %>" items="${goodsList}" end="<%=end %>">
						<td class="center td-width">
							<img class="order-img" alt="${goodsvo.goods_name }" 
								src="${pageContext.request.contextPath}/resources/img/goods_img/${goodsvo.goods_image }" style="width: 100%;">
						</td>
					</c:forEach>
					<c:if test="<%=end==goodsList.size() %>">
						<c:forEach begin="${goodsListSize }" end="5">
							<td class="td-width"></td>
						</c:forEach>
					</c:if>
					
				</tr>
				
				<tr>
					<c:forEach var="goodsvo" items="${goodsList}" begin="<%= begin %>" end="<%=end %>">
						<td class="center">
							<label><input type="checkbox" name="goods_code"
								class="goodsCheckbox" value="${goodsvo.goods_code }">
								${goodsvo.goods_name }
							</label>
							<br>
							<span>${goodsvo.goods_price }</span>P
						</td>
					</c:forEach>
					<c:if test="<%=end==goodsList.size() %>">
						<c:forEach begin="${goodsListSize }" end="5">
							<td></td>
						</c:forEach>
					</c:if>
				</tr><tr><td colspan="6">&nbsp;</td></tr>
<%
	begin+=6; 
%>
				</c:forEach>
			</table>
			<br>
			
			
			
			<table>
				<tr>
					<td></td>
					<td colspan="2" class="center">
						<c:if test="${not empty sessionScope.user }">
							보유 포인트 + 
						</c:if>
						적립 포인트
					</td>
					<td class="right">
						<span id="point">${requestScope.totalPoint }</span>P
					</td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="th-point center">
						사용포인트
					</td>
					<td class="td-point right">
						<span id="usedpoint">0</span>원
					</td>
					<td class="th-point center">추가 결제 금액</td>
					<td class="td-point right">
						<span id="extra">0</span>원
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="point" value="${requestScope.point }">
			<input type="hidden" name="usedpoint" value="0">
			<input type="hidden" name="extrapoint" value="${requestScope.point }">
			<input type="hidden" name="extra" value="0">
			<input type="hidden" name="store_code" value="${requestScope.store_code }">
			
			<c:if test="${empty sessionScope.user }">
				<c:forEach var="cartbookvo" items="${requestScope.orderBookList }">
					<input type="hidden" name="NonMemberBook_no" value="${cartbookvo.book_no }">
				</c:forEach>
			</c:if>
			<c:forEach var="cartBookvo" items="${orderBookList}">
				<input type="hidden" name="ordercart_idx" value="${cartBookvo.cart_idx}">
			</c:forEach>
			
			<!-- 선택한 책 객체 저장 -->
			<c:forEach var="book_no" items="${orderbook_no }">
				<input type="hidden" name="orderbook_no" value="${book_no }">
			</c:forEach>
			<c:if test="${not empty orderbook_cnt }">
				<input type="hidden" name="orderbook_cnt" value="${orderbook_cnt }">
			</c:if>
			
			
			
			
			<br><br><br>
			<div class="align-left">
				<input type="button" class="btn btn-go-cart" onclick="cartgo()" value="장바구니 가기"/>
				<input type="button" class="btn btn-go-buy" onclick="btn_go_buy(this.form)" value="사은품 선택 완료"/>
				
			</div>
			
			
			</form>
			<span class="end-span">&nbsp;</span>
			<div>
				
			</div>
	        
	      </div>
      
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
    
</div>
<%@include file="../../common/footer.jspf"%>
</body>
</html>