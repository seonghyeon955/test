<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String review_b_no = request.getParameter("review_b_no");
	pageContext.setAttribute("review_b_no", review_b_no);
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰등록창</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<style>
<%@include file="css/footer.css"%>
<%@include file="css/header.css"%>
</style>
</head>
<script>
</script>
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
  
	<div id="container">
		<br>
		<h1>리뷰 등록</h1>
		<hr>
		<br>
		<form action="${pageContext.request.contextPath }/insertBoard.do" method="get">
			<table>
				<tr>
					<th width="70">제목</th>
					<td>
						<input type="text" name="review_title" size="30">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<!-- 로그인한 회원의 아이디가 들어가도록 하기 -->
					<td>
						${sessionScope.user.id }
						<span style="padding-left:800px">
						<a href="../goBookDetail.do?book_no=${review_b_no }">글 목록 가기</a>
						</span>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="review_content" rows="10" cols="100"></textarea>
					</td>
				</tr>
				<!-- <tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="uploadfile">
					</td>
					
				</tr> -->
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td colspan="2" class="center" style="padding-left:930px">
						<input type="submit" value="새글 등록">
						<input type="hidden" value="${review_b_no }" name="review_b_no">
					</td>
				</tr>
			</table>
		</form>
		<br><br><br>
		<%-- <p><a href="../goBookDetail.do?book_no=${review_b_no }">글 목록 가기</a></p> --%>
	</div>
 </div><%-- 본문끝나고 닫는 부트스트랩 col-xl-8 col-md-8 mb-8 bg-light --%>
  <%-- 오른쪽 사이드바 --%>
  <div class="col-xl-2 col-md-2 mb-2"></div>
</div><%--row end --%>
</div><%--container-fluid mainPage end --%>
<%@ include file="/common/footer.jspf" %>
</body>
</html>