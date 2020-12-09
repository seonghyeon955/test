<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>Q&amp;A</title>
<%@include file="../../seongmi/officeAdminInclude.jspf"%>
<script>

   function answered(answeredForm){
      answeredForm.submit();
   }
   
   
   

   
</script>
<style>
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
      border: 1px solid #4374D9;
      padding: 3px 7px;
      background-color: #4374D9;
      color: white;
   }
   .paging li a:hover {
      background-color: #4374D9;
      color: white;
   }
   
   #blockPage {
      width: auto;
      margin: auto;
   }
   /***** 페이지 표시 부분 스타일(끝) ****/
   
   .bg-blue{
      color: #4374D9;
   }
   th{
      border-bottom: 1px solid #4374D9;
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
   
   .finishbtn{
      background-color: #4374D9;
      color: white;
   }
   
</style>
</head>
<body>

   <div id="wrapper">

    <%@include file="adminSideBar.jspf"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

        
          <!-- DataTales Example -->
          <div class="card shadow mb-4" style="min-height: 700px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Q&amp;A목록.</h6>
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
                 
                 
                 
                 
                 <form action="qnaCommentFinish.do" method="post">
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
                       <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                       <td colspan="6" class="center bg-blue">답변하기</td>
                    </tr>
                    <tr>
                       <td colspan="6" class="center">
                          <textarea name="qna_co_content" rows="4" cols="100" placeholder="답변을 입력하세요"></textarea>
                       </td>
                    </tr>
                    <tr>
                       <td colspan="6" class="center">
                         <input type="button" class="btn finishbtn" value="작성완료" onclick="answered(this.form)">&nbsp;
                         <input type="button" class="btn finishbtn" value="목록으로" onclick="javascript:${pageContext.request.contextPath}/qnaList.do">
                       </td>
                    </tr>
                 </table>
                 <input type="hidden" name="qna_no" value="${qnavo.qna_no }">
                 </form>
               
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
       
       
       </div>
       
       
     </div>
   </div>

   
   

<script>
$(document).ready(function () {
   document.getElementById("menu_name").innerHTML = "Q&A";
});
</script>
</body>
</html>