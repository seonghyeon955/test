<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String review_parent_no = request.getParameter("review_parent_no");
	String book_no = request.getParameter("book_no");
	pageContext.setAttribute("review_parent_no", review_parent_no);
	pageContext.setAttribute("book_no" , book_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 쓰는 창</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>

<style>
<%@include file="css/footer.css"%>
<%@include file="css/header.css"%>

#review1 li {
	list-style:none;
	display:inline;
	padding-right: 20px;
	padding-left:10px;
}
#review1 li:first-child {
	border-right:none;
}

#content {
	padding-left:80px;
}
#title {
	font-size:1.1em;
	font-weight:bold;
} 
</style>

<script>
	$(document).click(function(){
		$("#gotoList").click(function(){
			location.href="goBookDetail.do?book_no=${book_no}";
		})
	});
</script>
</head>
<body>
<%@ include file="/common/header.jspf" %>
<%@ include file="/common/menuBar.jspf" %>
<%@ include file="/common/bookClass.jspf" %>
<div class="container-fluid mainPage">
<div class="row">
  <!-- 부트:왼쪽 사이드바 -->
  <div class="col-xl-2 col-md-2 mb-2"></div>
  <!-- 부트:본문영역 -->
  <div class="col-xl-8 col-md-8 mb-8 bg-light">	
  

<br><br>
  <form action="../insertRreview.do" method="get">
  <h3>북로그 리뷰의 답글</h3>
  <br>
  <input type="button" value="글 목록" id="gotoList">
  <br><br>
  		<ul id="review1">
  			<li id="title">제목 : <input type="text" name="review_title"></li>
  			<li style="border-right: 0.3px solid Gray">아이디 : ${articleVO.review_mem_id }</li>
  			<li>날짜 : ${articleVO.review_date }</li>
  		</ul>
  		<div id="content">
  		<!-- <span>첨부이미지</span> -->
  		<p id="review">
			<textarea name="review_content" rows="10" cols="100"></textarea>
		</p>
  		</div>
  	<input type="submit" value="답글등록">
  	<input type="hidden" value="${review_parent_no }" name="review_parent_no">
  	<input type="hidden" value="${review_book_no }" name="review_book_no">
  </form>
  	<br><br><br><br>




 </div><%-- 본문끝나고 닫는 부트스트랩 col-xl-8 col-md-8 mb-8 bg-light --%>
  <%-- 오른쪽 사이드바 --%>
  <div class="col-xl-2 col-md-2 mb-2"></div>
</div><%--row end --%>
</div><%--container-fluid mainPage end --%>
<%@ include file="/common/footer.jspf" %>
</body>
</html>