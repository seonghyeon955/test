<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로 한 상세페이지</title>

<%@include file="/common/include.jspf"%>

</head>
<style>
	<%@include file="css/bookdetail.css"%>
	<%@include file="css/footer.css"%>
	<%@include file="css/header.css"%>
</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
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
    	 	<table class="table" id="mainExp">
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
							<table class="table" style="border:1px solid gray; width:400px">
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
								<ul style="padding-left: 20px;">
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
					<input type="button" value="지역변경" style="width:80px">
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
								<span>[바로드림]매장별 재고 및 위치</span>
								<span><a href="#" class="close" style="padding-right:5px;">X</a></span>
								</div><%--quickStoreBanner end --%>
						<br>
						<div id="pickupContent" style="padding-left:20px">
							<p>매장</p>
							<table class="table">
								<tr style="background-color:lightGray; padding-left:10px;">
									<c:forEach var="jegopickup" items="${jegopickuplist }">
									<th style="width:100px "><c:out value="${jegopickup.store_name }"></c:out></th>
									</c:forEach>
								</tr>
								
								<tr>
									<c:forEach var="jegopickup" items="${jegopickuplist}">
										<td>
											<a onclick="jegopickupgo('${jegopickup.store_code}','${jegopickup.store_name }')">
											${jegopickup.cnt }
											</a>
										</td>
									</c:forEach>
								</tr>
							</table>
							<br>
						</div>	<%--pickupContent end --%>
						<br>
						<ul style="padding-left: 20px;">
								<li>매장별 위치확인은 재고수량을 클릭하십시오.</li>
								<li>실시간 재고수량이 변하므로 전화확인 후 방문바랍니다.</li>
								<li>(문의) 대표번호 1588-8282</li>
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
		</div><%--tab-content end --%>
    
    
    
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    </div><%--col-xl-8 col-md-8 mb-8 bg-light end :본문 --%>
    </div><%--row end : 왼쪽 사이드바 --%>
    </div><%--container-fluid mainPage end : 메인설명창--%>
   
























</body>
</html>