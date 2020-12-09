<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&amp;A 쓰기</title>
<%@include file="/common/include.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/raeCss/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/raeCss/css/footer.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
	.Listbtn{
		background-color: #5F0E1F;
		color: white;
	}
	.finishbtn{
		background-color: #9F5252;
		color: white;
	}
	.center {
		text-align: center;
	}
	.color-black {
		color: black;
	}
	th{
		border-bottom: 1px solid #9F5252;
	}
	
	.bg-blue{
		color: #5F0E1F;
	}
</style>
<script>
	function writeFinish(writeForm){
		var result = confirm("작성을 완료하시겠습니까?");
		if(result == false){
			return false;
		}else{
			writeForm.submit();
		}
	}
</script>
</head>
<body> 
<%@include file="/common/header.jspf"%>
<%@include file="/common/menuBar.jspf"%>

<div class="container-fluid mainPage">
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">
	
		
		
		<div class="card-header py-3">
              <h6 class="m-0 font-weight-bold" style="color: #5F0E1F;">Q&amp;A작성.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              	<form action="QnAWriteFinish.do" method="post" enctype="multipart/form-data">
              	<table style="width: 90%;">
              		<tr>
              			 
              			<th style="width: 25%;" class="bg-blue">제목</th>
              			<th class="color-black" colspan="3">
              				<input type="text" name="qna_title" style="width: 100%;">
              			</th>
              		</tr>
              		<tr>
              			<th class="bg-blue">작성자</th>
              			<th class="color-black" style="width: 25%">
              				${sessionScope.user.id }<input type="hidden" name="qna_mem_id" value="${sessionScope.user.id }">
              			</th>
              			<th class="bg-blue" style="width: 25%">비밀여부</th>
              			<th class="color-black" style="width: 25%">
              				<label><input type="radio" name="qna_secret" value="0" checked="checked">비밀글</label>&nbsp;
              				<label><input type="radio" name="qna_secret" value="1">공개글</label>
              			</th>
              		</tr>
              		<tr>
              			<th class="bg-blue">첨부파일</th>
              			<th colspan="3"><input type="file" name="uploadFile"></th>
              		</tr>
              		<tr>
              			<th colspan="4" class="center bg-blue">내용</th>
              		</tr>
              		<tr>
              			<th colspan="4" class="center color-black" style="min-height: 300px;">
              				<textarea rows="5" cols="100" name="qna_content"></textarea>
              			</th>
              		</tr>
              		<tr>
              			<td colspan="6" class="center">
              				<input type="button" class="btn finishbtn" value="작성완료" onclick="writeFinish(this.form)">
              				<input type="button" class="btn Listbtn" value="목록으로" onclick="javascript: location.href='${pageContext.request.contextPath}/QnAList.do'">
              			</td>
              		</tr>
              	</table>
              	</form>
              	<br><br>
              	
              	
              	
              	
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