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
	
	#searchDiv {
		margin: auto;
		float: right;
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
		  
		/* $("#category_name").change(function(){
			var code = $("#category_code").val();
			var main = $("#category_main").val();
			var name = $(this).val();
			location.href="${pageContext.request.contextPath}/bookList.do?category_code=" + code + "&category_main?" + main + "&category_name=" + name;
		}); */
	}); 
	
/* 	
	
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
	} */

	
	//secret == 0  비밀글
	function qnaDetail(no, mem_id, secret){
		if(secret == "0"){
			if("${sessionScope.user}" == ""){
				alert("비밀글입니다. 로그인을 해주세요.");
				
				var result = confirm("로그인 하시겠습니까?");
				if(result == true){
				document.location.href = "${pageContext.request.contextPath}/Jungha/mem_login.jsp";
				}else {
					return false;
				}
			}else if("${sessionScope.user.id}" != mem_id){
				alert("비밀글입니다.");
			}else if("${sessionScope.user.id}" == mem_id){
				document.location.href = "${pageContext.request.contextPath}/QnADetail.do?qna_no=" + no;
			}
			
		}else{
			document.location.href = "${pageContext.request.contextPath}/QnADetail.do?qna_no=" + no;
		}
		
	}
	
	
	
	function goWrite(){
		
		if("${sessionScope.user}" == ""){
			var result = confirm("로그인이 필요합니다. 로그인 하시겠습니까?");
			if(result == true){
				document.location.href = "${pageContext.request.contextPath}/Jungha/mem_login.jsp";
			}else{
				return false;
			}
		}else{
			document.location.href = "${pageContext.request.contextPath}/QnAWrite.do";
		}
		
		
	}
	
	
	
	$(function(){
		var answerType = "${requestScope.qna_answer }";
		if(answerType == 2){
			$(".qna_answerType").eq(0).addClass("nowType");
		}
		else if(answerType == 0){
			$(".qna_answerType").eq(1).addClass("nowType");
		}
		else if(answerType == 1){
			$(".qna_answerType").eq(2).addClass("nowType");
		}
		
	});
	
	function qna_answerType(qna_answer){
		document.getElementById("qna_answer").value = qna_answer;
		document.searchForm.submit();
	}
	

</script> 

</head> 
<body> 
<%@include file="/common/header.jspf"%>
<%@include file="/common/menuBar.jspf"%>
<%@include file="/common/bookClass.jspf"%>
<%-- <span style="padding-left:50px">홈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/resources/images/pic/옆화살표.png" alt="화살표" width="10px">
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
      	</select> --%>
<hr>
<div class="container-fluid mainPage">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
	
		
		
		<div class="card-header py-3">
              <h6 class="m-0 font-weight-bold" style="color: #5F0E1F">Q&amp;A목록.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              	<div id="searchDiv">
              		<form action="${pageContext.request.contextPath}/QnAList.do" method="get" name="searchForm">
              		<select name="search_where">
              			<option selected="selected" value="1">제목</option>
              			<option selected="selected" value="2">작성자</option>
              			<option selected="selected" value="3">내용</option>
              		</select>
              		<input type="text" placeholder="검색" name="search">&nbsp;
              		<button type="submit" class="btn searchbtn" >검색</button>&nbsp;&nbsp;
              		<a class="qna_answerType" onclick="qna_answerType(2)">모두 보기</a>&nbsp;&nbsp;
              		<a class="qna_answerType" onclick="qna_answerType(0)">답변대기만 보기</a>&nbsp;&nbsp;
              		<a class="qna_answerType" onclick="qna_answerType(1)">답변완료만 보기</a>&nbsp;&nbsp;
              		<input type="hidden" name="qna_answer" value="${requestScope.qna_answer }" id="qna_answer">
              		</form>
              	</div>
                <table class="table table-bordered" id="dataTable" style="width:100%, cellspacing:0">
                  <thead>
                    <tr>
                      <th>Q&amp;A번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성시간</th>
                      <th>조회수</th>
                      <th>답변여부</th>
                      <th>공개여부</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="qnavo" items="${QNAList }">
                  	<tr onclick="qnaDetail('${qnavo.qna_no}', '${qnavo.qna_mem_id }', '${qnavo.qna_secret }')">
                  		<td class="point" >${qnavo.qna_no }</td>
                  		<td class="point" style="width: 40%;">${qnavo.qna_title }</td>
                  		<td class="point">${qnavo.qna_mem_id }</td>
                  		<td class="point" style="width: 15%;">${qnavo.qna_date }</td>
                  		<td class="point">${qnavo.qna_count }</td>
                  		<td class="point" style="width: 10%;">
                  			<!-- 비밀글 -->
                  			<c:if test="${qnavo.qna_secret == 0 }">
                  				비밀글
                  			</c:if>
                  			<!-- 비밀노 -->
                  			<c:if test="${qnavo.qna_secret == 1 }">
                  				공개글
                  			</c:if>
                  		</td>
                  		<td class="point" style="width: 10%;">
                  			<!-- 답변완료 -->
                  			<c:if test="${qnavo.qna_answer == 1 }">
                  				답변완료
                  			</c:if>
                  			<!-- 답변미완료 -->
                  			<c:if test="${qnavo.qna_answer == 0 }">
                  				답변대기
                  			</c:if>
                  		</td>
                  	</tr>
                  </c:forEach>
                  </tbody>
				  <tfoot>
				  	<tr>
				  		<td class="center" colspan="7" style="border-bottom: none; border-left: none; border-right: none;">
				  		<input type="button" class="btn searchbtn" value="글쓰기" onclick="goWrite()">
				  		</td>
				  	</tr>
				  </tfoot>
                </table>
                
              </div>
            </div>
            <table id="blockPage">
            <tr>
					<td colspan="4">
						<ol class="paging">
							<c:choose>
							<c:when test="${pvo.beginPage == 1 }">
								<li class="disable">이전</li>
							</c:when>
							<c:otherwise>
								<!-- 이전으로 누르면 현재 블록의 첫페이지인 beginePage - 1로 이동 -->
								<li><a href="${pageContext.request.contextPath}/QnAList.do?cPage=${pvo.beginPage - 1}&saerch=${requestScope.search}&qna_answer=${requestScope.qna_answer}&search_where=${requestScope.search_where}">이전</a></li>
							</c:otherwise>
							</c:choose>
							<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
							<c:choose>
							<c:when test="${pageNo == pvo.nowPage }">
								<li class="now">${pageNo }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${pageContext.request.contextPath}/QnAList.do?cPage=${pageNo }&saerch=${requestScope.search}&qna_answer=${requestScope.qna_answer}&search_where=${requestScope.search_where}">${pageNo }</a>
								</li>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:choose><%-- [다음으로]에 대한 사용여부처리 --%>
							<%-- 사용불가(disable) 또는 안 보이게(hidden) : 마지막 블록인 경우
								endPage가 전체 페이지 수와 같거나 큰 경우 --%>
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음으로</li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/QnAList.do?cPage=${pvo.endPage + 1}&saerch=${requestScope.search}&qna_answer=${requestScope.qna_answer}&search_where=${requestScope.search_where}">다음</a></li>
							</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
            </table><br><br>
            <div>
            	
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