<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세페이지 화면</title>
<%@include file="/common/include.jspf"%>

<style>
<%@include file="/resources/css/footer.css"%>
<%@include file="/resources/css/header.css"%>
/*<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">*/
	/*이미지롤링배너*/
	
	* { margin: 0; padding: 0; }
    h2 { text-align: center; }
    #banner-wrap {
        width: 1200px;
        border: 1px solid #aaa;
        padding: 20px;
        margin: 50px auto;
    }
    #frame {
        width: 1000px;
        position: relative;
        overflow: hidden; 
    }
    #banner { width: 3000px; }
    .bookcard  { width: 320px; }
    .cardlist {
        list-style: none;
        float: center;
        width: 320px;
    }
    #banner-wrap a { text-decoration: none; }
    #banner-wrap > p { 
        text-align: center; 
        clear: both; 
    }
    //
    
    
	
	
	
	/*메인설명창*/
	
	table #mainExp {
		margin-left: auto;
		border: 1px solid blue;
	}
	
	
	
	#search{
		float:right;
	}
	
	
	#all {
		position: absolute;
		top:35%;
		
		border: solid 1px red;
		width:100%;
	}
	
	.bookcard {
		display: block;
		margin-left: auto;
  		margin-right: auto;	
	}
	
	.secondBannerR{
		float:right; font-size:0.2em;	
	}
	
	/*댓글 페이징 스타일*/
	.paging {list-style : none;}
	.paging li {
		folat: left;
		margin-right: 8px;
	}	
	.paging li a {
		text-decoration:none;
		display:bolck;
		padding: 3px 7px;
		border: 1px solid black;
		font-weight:bold;
		color:black;
	}
	
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color:sliver;
	}
	.paging .now {/*블럭내 표시할 페이지태그(시작~끝페이지)*/
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	
	.paging li a:hover {
		background-color: #00B3DC;
		color:white;
	}
	
	.exchange {
		width:200px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
    var $list = $("#banner");
    //이미지 복사 & 붙여넣기 : 첫번째, 두번째 이미지를 맨뒤에 추가
    $list.append($("#banner>li:lt(3)").clone());
    
    
    var clickCnt = 0;
    $("#next").click(function(){
        console.log("clickCnt : " + clickCnt);
        if (clickCnt >= 4) { //맨 마지막까지 보여준 경우
            clickCnt = 0;
            $list.css("margin-left", "0px");    
        }
        clickCnt++;
        $list.animate({"margin-left": -360 * clickCnt +"px"}, 1000);
    });
    
    $("#prev").click(function(){
        console.log("clickCnt : " + clickCnt);
        if (clickCnt <= 0) { //맨 마지막까지 보여준 경우
            clickCnt = 4;
            $list.css("margin-left", -(360 * clickCnt) + "px");    
        }
        clickCnt--;
        $list.animate({"margin-left": -360 * clickCnt +"px"}, 1000);
    });
});

</script>
</head>
  
<body>
<%@ include file="/common/header.jspf" %>
	
	
		<hr>
		<br><br><br><br>
		
		<!-- 메인설명창 -->
		<div class="container-fluid mainPage">
   		<div class="row">
       <!-- 부트:왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 부트:본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
        
        
		<div><%-- 첫번째 책 상세정보 묶은 div --%>
		<table border id="mainExp">
			<tr>
				<th width="400px">1</th>
				<th width="400px">2</th>
				<th width="400px">3</th>
				<th width="200px">4</th>
				<th width="400px">5</th>
			</tr>
			<tr>
				<td rowspan="8"><img src="/resources/images/pic/책사진.jpg" alt="책사진"></td>
				<td colspan="4">책 제목</td>
				
			</tr>
			<tr>
				<td>베르나르 베르베르 지음</td>
				<td>전미연 옮김</td>
				<td>열린책들</td>
				<td>2020년 09월 05일 출간</td>
			</tr>
			<tr>
				<td colspan="4">***** 9.3 (리뷰00개)</td>
			</tr>
			<tr>
				<td colspan="3">정가 12,800원</td>
				<td rowspan="5" colspan="2">이 상품의 이벤트 5건
					<!-- <ul>
						<li>1.이벤트</li>
						<li>2.이벤트</li>
						<li>3.이벤트</li>
					</ul> -->
					<p>이벤트1</p>
					<p>이벤트1</p>
					<p>이벤트1</p>
				</td>
			</tr>
			<tr>
				<td colspan="3">판매가 11,520원[10%↓ 1,280원 할인]</td>
			</tr>
			<tr>
				<td rowspan="3">통합포인트 :</td>
				<td>[기본적립]640원 적립[5%적립]</td>
			</tr>
			<tr>
				<td>[추가적립]5만원 이상 구매 시 2천원 추가적립</td>
				<td><input type="button" value="안내"></td>
			</tr>
			<tr>
				<td>[회원혜택]실버등급 이상, 3만원 이상 구매 시 2~4% 추가적립</td>
				<td><input type="button" value="안내"></td>
			</tr>
			<tr>
				<td><input type="button" value="매장 재고/위치">
					<img src="resources/images/pic/옆화살표.png"></td>
			</tr>
			<tr>
				<td rowspan="5">빈공간</td>
				<td colspan="2">배송비 : 무료<input type="button" value="배송비 안내"></td>
			</tr>
			<tr>
				<td colspan="2">배송일정 : 서울특별시 종로구 세종대로 기준<input type="button" value="지역변경"></td>
				
				
			</tr>
			<tr>
				<td colspan="2">바로드림 : 인터넷으로 주문하고 매장에서 직접 수령
				<input type="button" value="안내"><input type="button" value="바로드림 혜택"></td>
			</tr>
			<tr>
				<td>주문수량 <input type="number" name="cnt" value="1" style="width:40px">
						  <input type="button" name="plus" value="+">
						  <input type="button" name="minus" value="-">
				</td>
			</tr>
			<tr>
				<td><input type="button" value="장바구니"></td>
				<td><input type="button" value="구매하기"></td>
				<td><input type="button" value="바로드림 주문"></td>
			</tr>
			</table>
			</div><%-- 첫번째 책 상세정보 파트 끝 --%>
			<br><br><br><br>
			
			
			<%-- 두번째 책 상세설명 페이지(이벤트/상품정보/회원리뷰/교환) --%>
			<table border><!-- 이벤트 -->
				<tr class="tabs">
					<th width="400" class="tab-link current" data-tab="tab-1" >이벤트(2)</th>
					<th width="400" class="tab-link" data-tab="tab-2">상품정보</th>
					<th width="400" class="tab-link" data-tab="tab-3">회원리뷰(10)</th>
					<th width="400" class="tab-link" data-tab="tab-4">교환/반품/품절</th>
					<th width="560" rowspan="20" style= "height:100px">베스트도서</th>
				</tr>
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
				<tr>
					<td><img src="/resources/images/pic/이벤트1.jpg" alt="이벤트사진"></td>
					<td>이벤트정보</td>
					<td><img src="/resources/images/pic/이벤트2.jpg" alt="이벤트사진"></td>
					<td>이벤트정보</td>
				</tr>
				<tr>
					<td><img src="/resources/images/pic/이벤트3.jpg" alt="이벤트사진"></td>
					<td>이벤트정보</td>
					<td><img src="/resources/images/pic/이벤트4.jpg" alt="이벤트사진"></td>
					<td>이벤트정보</td>
				</tr>
				
				<%-- 상품정보 --%>
				
				<tr class="tabs">
					<th width="200" class="tab-link current" data-tab="tab-1" >이벤트(2)</th>
					<th width="200" class="tab-link" data-tab="tab-2">상품정보</th>
					<th width="200" class="tab-link" data-tab="tab-3">회원리뷰(10)</th>
					<th width="200" class="tab-link" data-tab="tab-4">교환/반품/품절</th>
				</tr>
				
				
				
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<th>ISBN</th>
					<td colspan="3">98078763438472</td>
				<tr>
				<tr>
					<th>쪽수</th>
					<td colspan="3">000쪽</td>
				</tr>
				<tr>
					<th>크기</th>
					<td colspan="3">140 * 220 * 31 mm/656g</td>
				</tr>
				<tr>
					<th>원서명/저자명</th>
					<td colspan="3">Bienvenue au Paradis/Werber, Bernard</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				
				
				<tr>
					<th >책 소개</th>
					<th colspan="4"></th>
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
					ddddddddddd<br>
					dddddddddddd<br>
					d<br>
					d<br>
					d<br>
					d<br>
					d<br>
					
					
					</td>
					<td></td>
				</tr>
			</table><%-- 이벤트의 테이블 --%>
			
			<table border><%-- 상세이미지 --%>
			 <tr>
				<td colspan="4">상세이미지</td>
			</tr>
			
			<tr><td>
				<div id="banner-wrap">
					<div id="frame">
						<ul id="banner">
							<li class="cardlist"><a href="#"><img class="bookcard" src="/resources/images/pic/북카드1.jpg" alt="이미지1"></a></li>
							<li class="cardlist"><a href="#"><img class="bookcard" src="/resources/images/pic/북카드2.jpg" alt="이미지2"></a></li>
							<li class="cardlist"><a href="#"><img class="bookcard" src="/resources/images/pic/북카드3.jpg" alt="이미지3"></a></li>
							<li class="cardlist"><a href="#"><img class="bookcard" src="/resources/images/pic/북카드4.jpg" alt="이미지4"></a></li>
						</ul>
					</div>
					<p>
						<a href="#" id="prev">
							<img src="/resources/images/pic/pre.png" width="30px">
						</a>
						<a href="#" id="next">
							<img src="/resources/images/pic/next.png" width="30px">
						</a>
					</p>
				</div>
			</td></tr>
			</table>
			
			
			
			<table border><%-- 회원리뷰시작 --%>
				<tr>
					<th colspan="4">목차</th>
				</tr>
				<tr>
					<td colspan="4">목차설명</td>
				</tr>
				
				<tr class="tabs">
					<th width="400" class="tab-link current" data-tab="tab-1" >이벤트(2)</th>
					<th width="400" class="tab-link" data-tab="tab-2">상품정보</th>
					<th width="400" class="tab-link" data-tab="tab-3">회원리뷰(10)</th>
					<th width="400" class="tab-link" data-tab="tab-4">교환/반품/품절</th>
					<th width="560" rowspan="20" height="100">베스트도서</th>
				</tr>
			</table><%-- 회원리뷰끝 --%>
			
			<br><br><br><br>
			<hr>
			
			<%--게시글 댓글 작성란 --%>
			<form action="" method="post">
				<p>이름 : <input type="text" name="writer">
					비밀번호 : <input type="password" name="pwd">
				</p>
				<p>내용 : <textarea name="content" rows="10" cols="110"></textarea></p>
				<p>첨부파일 : <input type="file" name="uploadfile"> </p>
				<input type="submit" value="댓글저장">
				<input type="hidden" name="review_no" value="">
			</form>
			<hr>
			댓글
			<hr>
			
			<%--게시글에 작성된 댓글 표시영역 --%>
			<c:forEach var="commVO" items="${c_list }">
			<div class="comment">
				<form action="ans_del.jsp" method="post">
					<p>고객아이디 : ${commVO.review_mem_id }&nbsp;&nbsp; 작성날짜 : ${commVO.write_date }</p>
					<p>내용 : ${commVO.review_content }</p>
					<p>첨부파일 : <img src="/resources/images/pic/책사진.jpg" alt="첨부파일이미지"></p>
					<input type="submit" value="댓글삭제">
					<input type="hidden" name="review_no" value="${commVO.review_no }">
					<input type="hidden" name="review_men_id" value="${commVO.review_men_id }">
					
					<%--삭제처리 후 게시글 상세페이지로 이동시 --%>
					<input type="hidden" name="no" value="">
				</form>
			</div>
			</c:forEach>
			
			<%-- 댓글 페이징 부분 --%>
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
						
						<%-- 블록내 표시할 페이지태그 작성(시작페이지~끝페이지) --%>
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
						
						<%--[다음으로]에 대한 사용여부처리 : 사용불가 또는 안보이게 -마지막블록일때
							endPage가 전체 페이지수와 같거나 큰 경우  --%>
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
			</table>
			
			<table border><%-- 교환/반품/품절탭 --%>
				<tr class="tabs">
					<th width="400" class="tab-link current" data-tab="tab-1" >이벤트(2)</th>
					<th width="400" class="tab-link" data-tab="tab-2">상품정보</th>
					<th width="400" class="tab-link" data-tab="tab-3">회원리뷰(10)</th>
					<th width="400" class="tab-link" data-tab="tab-4">교환/반품/품절</th>
					<th width="560" rowspan="20" height="100">베스트도서</th>
				</tr>
			</table>
			
			
			<br><br><br>
			<p>교환/반품/품절안내</p>
			<p>※상품설명에 반품/교환 관련한 안내가 있을 경우 그 내용을 우선으로 합니다.(업체 사정에 따라 달라질 수 있습니다.</p>
			
			<table border><%-- 교환/반품/품절 내용 --%>
				<tr>
					<th class="exchange">반품.교환방법</th>
					<td>마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환신청,
						[1:1상담>반품/교환/환불] 또는 고객센터(1544-1900)
						※오픈마켓, 해외배송주문, 기프트 주문시 [1:1상담>반품/교환/환불]
						또는 고객센터(1544-1900)</td>
				</tr>
				<tr>
					<th class="exchange">반품/교환가능 기간</th>
					<td>변심반품의 경우 수령 후 7일 이내,
						상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</td>
				</tr>
				<tr>
					<th class="exchange">반품/교환비용</th>
					<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
				</tr>
				<tr>
					<th class="exchange">반품/교환 불가 사유</th>
					<td>
						<ul>
							<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우
							(단지 확인을 위한 포장 훼손은 제외)</li>
							<li>소비자의 사용,포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우
							예)화장품, 식품, 가전제품(악세사리 포함) 등</li>
							<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우
							(단지 확인을 위한 포장 훼손은 제외)</li>
						
						</ul>
					</td>
				</tr>
				
				
			</table><%-- 교환/반품/품절 끝 --%>
			
			
		 </div><%-- 본문끝나고 닫는 부트스트샙col-xl-8 col-md-8 mb-8 bg-light --%>
		
		 
		 
      
      <%-- 오른쪽 사이드바 --%>
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
			
			
<%@ include file="/common/footer.jspf" %>
</body>
</html>