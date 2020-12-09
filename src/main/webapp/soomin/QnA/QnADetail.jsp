<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8"> 
<title>메인화면</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/raeCss/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/raeCss/css/footer.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
	.bestSeller > ul {list-style: none;}
	.newRelease > ul {list-style: none;}
	.steadySeller > ul {list-style: none;}
	.bestSeller > ul > li {float: left;}
	.steadySeller > ul > li {float: left;}
	.bigFont {font-size: 2em;}
	.midFont {font-size: 1.5em; margin-top: 8px;}
	.bestSellerBook {width: 800px; height: 600px; margin: auto;}
	.steadySellerBook {width: 800px; height: 600px; margin: auto;}
	.newReleaseBook {width: 800px; height: 600px; margin: auto;}
	/* td {width: 800px;} */
	.center{text-align: center;}
	a:hover {
		text-decoration: none;
	}
	
	
	.qna_answerType{
		color: black !important;
	}

	.nowType {
		color: #5F0E1F !important;
	}
	
	a:hover{
		cursor: pointer;
	}
	.point:hover{
		cursor: pointer;
	}
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { list-style: none;}
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
		background-color: silver;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: black;
	}
	.paging .now {
		border: 1px solid #D38888;
		padding: 3px 7px;
		background-color: #5F0E1F;
		color: white;
	}
	.paging li a:hover {
		background-color: #D38888;
		color: white;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
	
	#blockPage {
		margin: auto;
	}
	
	.searchbtn{
		background-color: #5F0E1F;
		color: white;
	}
	
	.modifybtn{
		background-color: #9F5252;
		color: white;
	}
	
	.deletebtn{
		background-color: #D38888;
		color: white;
	}
	
	#searchDiv {
		margin: auto;
		float: right;
	}
	
	th{
		border-bottom: 1px solid #9F5252;
	}
	
	.bg-blue{
		color: #9F5252;
	}
	
	#searchDiv {
		margin: auto;
		padding-left: 50%;
	}

	.center {
		text-align: center;
	}
	.color-black {
		color: black;
	}
	
	
</style> 
<script> 

	$(document).ready(function(){ 
	    var main = $('.bxslider').bxSlider({ 
		    mode: 'fade', 
		    auto: true,	//자동으로 슬라이드 
		    controls : true,	//좌우 화살표	
		    autoControls: true,	//stop,play 
		    pager:true,	//페이징 
		    pause: 5000, 
		    autoDelay: 0,	
		    slideWidth: 800, //이미지 박스 크기설정
		    speed: 1000, 
		    stopAutoOnclick:true 
		}); 

		$(".bx-stop").click(function(){	// 중지버튼 눌렀을때 
		    main.stopAuto(); 
		    $(".bx-stop").hide(); 
		    $(".bx-start").show(); 
		    return false; 
		}); 
	
		$(".bx-start").click(function(){	//시작버튼 눌렀을때 
		    main.startAuto(); 
		    $(".bx-start").hide(); 
		    $(".bx-stop").show(); 
		    return false; 
		}); 
	
		$(".bx-start").hide();	//onload시 시작버튼 숨김. 
		  
		$("#category_name").change(function(){
			var code = $("#category_code").val();
			var main = $("#category_main").val();
			var name = $(this).val();
			location.href="${pageContext.request.contextPath}/bookList.do?category_code=" + code + "&category_main?" + main + "&category_name=" + name;
		});
	}); 
	
	
	
	function selectCode(){
		var code = $('#category_code').val();
		//alert(category_code);
		$.ajax({
			type: 'POST',
			url: 'getCategoryMain.do',
			dataType: "json",
			data: {category_code: code},
			success: function(result){
				//alert(result);
				$('#category_main').html("<option value=''>-중분류-</option>");
				$('#category_name').html("<option value=''>-소분류-</option>");
				$(result).each(function(i) {
			        var main = result[i];
			        console.log("main : " + main)
		        	$('#category_main').append("<option value='" + main + "'>" + main + "</option>");  
		        });
			}
		});
	}
	
	
	function selectMain(){
		var code = $('#category_code').val();
		var main = $('#category_main').val();
		//alert(category_code + '   ' + category_main);
		$.ajax({
			type: 'POST',
			url: 'getCategoryName.do',
			dataType: "json",
			data: {category_code: code, 
				   category_main: main},
			success: function(result){
				//alert(result);
				$('#category_name').html("<option value=''>-소분류-</option>");
				$(result).each(function(i) {
			        var name = result[i];
			        console.log("name : " + name)
		        	$('#category_name').append("<option value='" + name + "'>" + name + "</option>");  
		        });
			}
		});
	}

	function answered(answeredForm){
		answeredForm.submit();
	}
	
	function deleteConfirm(){
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result == true){
			location.href='${pageContext.request.contextPath}/QnADelete.do?qna_no=${qnavo.qna_no }';
		}else{
			return false;
		}
	}

</script> 

</head> 
<body> 
<%@include file="/common/header.jspf"%>
<%@include file="/common/menuBar.jspf"%>
<span style="padding-left:50px">홈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/resources/images/pic/옆화살표.png" alt="화살표" width="10px">
		<select name="category_code" id="category_code" onchange="selectCode(this)">
			<option value="">-대분류-</option>
           		<c:forEach var="category" items="${categoryCode }">
	     			<option value="${category }">${category }</option>
	     		</c:forEach>
		</select>
</span>
		<select name="category_main" id="category_main" onchange="selectMain(this)">
      		<option value="">-중분류-</option>
      	</select>
      	<select name="category_name" id="category_name">
      		<option value="">-소분류-</option>
      	</select>
<hr>
<div class="container-fluid mainPage">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
	
		
		
		<div class="card-header py-3">
              <h6 class="m-0 font-weight-bold" style="color: #5F0E1F;">Q&amp;A목록.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              	
              	<table style="width: 90%;">
              		<tr>
              			<th style="width: 20%;" class="bg-blue">번호</th>
              			<th style="width: 20%;" class="color-black">${qnavo.qna_no }</th>
              			<th style="width: 20%;" class="bg-blue">제목</th>
              			<th class="color-black">${qnavo.qna_title }</th>
              		</tr>
              		<tr>
              			<th class="bg-blue">작성자</th>
              			<th class="color-black">${qnavo.qna_mem_id }</th>
              			<th class="bg-blue">조회수</th>
              			<th class="color-black">${qnavo.qna_count }</th>
              		</tr>
              		<tr>
                  		<th class="bg-blue">작성일</th>
                  		<th class="color-black">${qnavo.qna_date }</th>
                  		<th class="bg-blue">답변여부</th>
                  		<th class="color-black">
                  			<!-- 답변완료 -->
                  			<c:if test="${qnavo.qna_answer == 1 }">
                  				답변완료
                  			</c:if>
                  			<!-- 답변미완료 -->
                  			<c:if test="${qnavo.qna_answer == 0 }">
                  				답변대기
                  			</c:if>
                  		</th>
              		</tr>
              		<c:if test="${not empty qnavo.qna_file_name }">
              		<tr>
              			<th colspan="4" class="center bg-blue">첨부이미지</th>
              		</tr>
              		<tr>
              			<th colspan="4" class="center bg-blue">
              				<img alt="QnA첨부된 이미지" width="300px;" src="${pageContext.request.contextPath}/resources/images/qna/${qnavo.qna_file_name}">
              			</th>
              		</tr>
              		</c:if>
              		<tr>
              			<th colspan="4" class="center bg-blue">내용</th>
              		</tr>
              		<tr>
              			<th colspan="4" class="center color-black" style="min-height: 300px;">
              				${qnavo.qna_content }
              			</th>
              		</tr>
              	</table>
              	<br><br>
              	
              	
              	<hr>
              	
              	<table style="width: 90%">
              		<c:forEach var="qna_commentvo" items="${qna_commentList }">
              		<tr>
              			<th class="bg-blue">답변번호</th>
              			<th class="color-black">${qna_commentvo.qna_co_no }</th>
              			<th class="bg-blue">답변 지점</th>
              			<th class="color-black">${qna_commentvo.qna_co_store_code }</th>
              			<th class="bg-blue">답변 시간</th>
              			<th class="color-black">${qna_commentvo.qna_co_date }</th>
              		</tr>
              		<tr>
              			<td colspan="6" class="bg-blue center">답변 내용</td>
              		</tr>
              		<tr>
              			<td colspan="6" style="min-height: 300px;" class="color-black">
              				${qna_commentvo.qna_co_content }
              			</td>
              		</tr>
              		<tr>
              			<td colspan="6">&nbsp;</td>
              		</tr>
              		</c:forEach>
              		<tr>
              			<td colspan="6" class="center">
              				<c:if test="${sessionScope.user.id == qnavo.qna_mem_id }">
              				<input type="button" class="btn modifybtn" value="수정하기" onclick="javascript: location.href='${pageContext.request.contextPath}/QnAModify.do?qna_no=${qnavo.qna_no }'">
              				</c:if>
              				<input type="button" class="btn searchbtn" value="목록으로" onclick="javascript: location.href='${pageContext.request.contextPath}/QnAList.do'">
              				<c:if test="${sessionScope.user.id == qnavo.qna_mem_id }">
              				<input type="button" class="btn deletebtn" value="삭제하기" onclick="deleteConfirm()">
              				</c:if>
              			</td>
              		</tr>
              	</table>
              	
            	</div>
            </div>
		
    
        </div>
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
    
</div>

<div>
<%@include file="/common/footer.jspf"%>
</div>
</body> 
</html>