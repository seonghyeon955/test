<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>Q&amp;A</title>
<%@include file="../../seongmi/officeAdminInclude.jspf"%>
<script>

   function qnaDetail(no){
      document.location.href = "qnaDetail.do?qna_no=" + no;
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
<style>
   .qna_answerType{
      color: black !important;
   }

   .nowType {
      color: #4374D9 !important;
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
      border: 1px solid #4374D9;
      padding: 3px 7px;
      background-color: #4374D9;
      color: white;
   }
   .paging li a:hover {
      background-color: #4374D9;
      color: white;
   }
   /***** 페이지 표시 부분 스타일(끝) ****/
   
   #blockPage {
      width: auto;
      margin: auto;
   }
   
   .btn{
      background-color: #4374D9;
      color: white;
   }
   
   #searchDiv {
      margin: auto;
      float: right;
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
                 <div id="searchDiv">
                    <form action="qnaList.do" method="get" name="searchForm">
                    <select name="search_where">
                       <option selected="selected" value="1">제목</option>
                       <option value="2">작성자</option>
                       <option value="3">내용</option>
                    </select>
                    <input type="text" placeholder="검색" name="search">&nbsp;
                    <button type="submit" class="btn" >검색</button>&nbsp;&nbsp;
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
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="qnavo" items="${QNAList }">
                     <tr onclick="qnaDetail('${qnavo.qna_no}')">
                        <td class="point" >${qnavo.qna_no }</td>
                        <td class="point" style="width: 40%;">${qnavo.qna_title }</td>
                        <td class="point">${qnavo.qna_mem_id }</td>
                        <td class="point" style="width: 15%;">${qnavo.qna_date }</td>
                        <td class="point">${qnavo.qna_count }</td>
                        <td class="point" style="width: 15%;">
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
                        <li><a href="qnaList.do?cPage=${pvo.beginPage - 1}&saerch=${requestScope.search}&qna_answer=${requestScope.qna_answer}&search_where=${requestScope.search_where}">이전</a></li>
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
                           <a href="qnaList.do?cPage=${pageNo }&saerch=${requestScope.search}&qna_answer=${requestScope.qna_answer}&search_where=${requestScope.search_where}">${pageNo }</a>
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
                        <li><a href="qnaList.do?cPage=${pvo.endPage + 1}&saerch=${requestScope.search}&qna_answer=${requestScope.qna_answer}&search_where=${requestScope.search_where}">다음</a></li>
                     </c:otherwise>
                     </c:choose>
                  </ol>
               </td>
            </tr>
            </table><br><br>
            <div>
               
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
       
       
       
       
       
     </div>
   </div>

   
   

<script>
$(document).ready(function () {
   document.getElementById("menu_name").innerHTML = "Q&A";
});
</script>
</body>
</html>