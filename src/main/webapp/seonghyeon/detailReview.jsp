<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰상세창</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<style>
<%@include file="css/footer.css"%>
<%@include file="css/header.css"%>
</style>

<style>
	#review1 li {
		list-style:none;
		display:inline;
		border-right: 0.3px solid Gray;
		padding-right: 20px;
		padding-left:10px;
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
			location.href="goBookDetail.do?book_no=${articleVO.review_b_no}";
		})
		
		$("#del").click(function(){
			var ask = confirm("정말 삭제하시겠습니까?");
			var review_no = ${articleVO.review_no};
			var review_b_no = ${articleVO.review_b_no};
			
			if(ask == false){
				return false;
			}
			$.ajax({
				url: "delArticle.do",
				type: "post",
				data : 
				{
					"review_no" : review_no,
					"review_b_no" : review_b_no
				},
				success : function(result){
					if(result == 1){
						alert("게시글이 삭제되었습니다.");
						location.href="goBookDetail.do?book_no=${articleVO.review_b_no}";
					}else {
						alert("게시글 삭제에 실패하였습니다.");
					}
				}
				
			});
			
		})//del click end
		
		$("#modi").click(function(){
			document.location.href="${pageContext.request.contextPath }/goModifyArticle.do?review_no=" + ${articleVO.review_no};
		})
			
		
		
		
	});
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
  
  <br><br>
  <h3>북로그 리뷰(갯수)</h3>
  <br>
  <span style="padding-left:900px">
  <input type="button" value="글 목록" id="gotoList">
  </span>
 <!--  <input type="button" value="답글쓰기" id="writeRreview"> -->
  <br><br>
  		<ul id="review1">
  			<li id="title">${articleVO.review_title }</li>
  			<li>${articleVO.review_mem_id }</li>
  			<li>${articleVO.review_date }</li>
  		</ul>
  		<div id="content">
  		<!-- <span>첨부이미지</span> -->
  		<p id="review">${articleVO.review_content }</p>
  		</div>
  		
  	<div style="padding-left:900px">
  	<c:if test="${not empty sessionScope.user.getId()  }">
  		<c:if test= "${sessionScope.user.getId() == articleVO.review_mem_id }">
	  		<input type="button" value="수정" id="modi">
	  		<input type="button" value="삭제" id="del">
  		</c:if>
  	</c:if>
  	</div>
  	<br><br><br><br>
  
	
  </div><%-- 본문끝나고 닫는 부트스트랩 col-xl-8 col-md-8 mb-8 bg-light --%>
  <%-- 오른쪽 사이드바 --%>
  <div class="col-xl-2 col-md-2 mb-2"></div>
</div><%--row end --%>
</div><%--container-fluid mainPage end --%>
<%@ include file="/common/footer.jspf" %>
</body>
</html>