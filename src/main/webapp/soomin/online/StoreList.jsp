<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>지점관리</title>
<%@include file="../../seongmi/officeAdminInclude.jspf"%>
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
<script>
   $(function(){
      
      $(".popupStoreDetail").click(function(){
         var store_code = $(this).children(":eq(0)").text();
         $.ajax({
            url: "storeDetail.do",
            data: {
               store_code: store_code
            },
            type: "GET",
            //dataType: "json",
            success: function(storevo){
               $("#store_code").text(storevo.store_code);
               $("#store_name").text(storevo.store_name);
               $("#zip_code").text(storevo.zip_code);
               $("#street_addr").text(storevo.street_addr);
               $("#remaining_addr").text(storevo.remaining_addr);
               $("#email").text(storevo.email);
               $("#store_phone_number").text(storevo.store_phone_number);
               $("#store_approval2").text(storevo.store_approval);
               
               $("#storeDetail").modal("show");
               
               if(storevo.store_approval == "영업중"){
                  $("#sendBtn").text("폐점");
               }else if(storevo.store_approval == "폐점"){
                  $("#sendBtn").text("재오픈");
               }
            },
            error: function(xhr, ajaxOptions, thrownError){
               alert(xhr.status);
               alert(xhr.responseText);
               alert(ajaxOptions);
            }
            
         });
         
      });
   
   });
   

   function Store_approval(){
      
      
      var store_code = document.getElementById("store_code").innerHTML;
      var store_approval = document.getElementById("store_approval2").innerHTML;
      
      if(store_approval == '폐점'){
         var result = confirm(store_code + " 지점을 재오픈시키겠습니까?");
         if(result == false){
            return false;
         }
      }else if(store_approval == '영업중'){
      
         var result = confirm(store_code + " 지점을 폐점시키겠습니까?");
         if(result == false){
            return false;
         }
      }
      
      $.ajax({
         url: "store_approvalend.do",
         data: {
            store_code: store_code,
            store_approval: store_approval
         },
         type: "GET",
         //dataType: "json",
         success: function(data){
            if(data == "success"){
               alert("정상적으로 처리되었습니다..");
               location.href = "${pageContext.request.contextPath}/soomin/online/StoreList.do";
            }else{
               alert("실패하였습니다. 다시 시도하여주십시오.");
            }
         },
         error: function(xhr, ajaxOptions, thrownError){
            alert(xhr.status);
            alert(xhr.responseText);
            alert(ajaxOptions);
         }
         
      });
      
   }
   
   
   $(function(){
      var answerType = "${requestScope.store_approval }";
      if(answerType == 'all'){
         $(".qna_answerType").eq(0).addClass("nowType");
      }
      else if(answerType == '영업중'){
         $(".qna_answerType").eq(1).addClass("nowType");
      }
      else if(answerType == '폐점'){
         $(".qna_answerType").eq(2).addClass("nowType");
      }
      
   });
   
   function qna_answerType(store_approval){
      document.getElementById("store_approval").value = store_approval;
      document.searchForm.submit();
   }
   
   

   
</script>

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
              <h6 class="m-0 font-weight-bold text-primary">지점목록.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                 <div id="searchDiv">
                    <form action="StoreList.do" method="get" name="searchForm">
                    <select name="search_where">
                       <option selected="selected" value="지점코드">지점번호</option>
                       <option value="지점이름">지점이름</option>
                       <option value="지점메일">메일</option>
                       <option value="지점주소">주소</option>
                       <option value="지점전화번호">전화번호</option>
                    </select>
                    <input type="text" placeholder="검색" name="search">&nbsp;
                    <button type="submit" class="btn" >검색</button>&nbsp;&nbsp;
                    <a class="qna_answerType" onclick="qna_answerType('all')">모두 보기</a>&nbsp;&nbsp;
                    <a class="qna_answerType" onclick="qna_answerType('영업중')">영업중만 보기</a>&nbsp;&nbsp;
                    <a class="qna_answerType" onclick="qna_answerType('폐점')">폐점만 보기</a>&nbsp;&nbsp;
                    <input type="hidden" name="store_approval" value="${requestScope.store_approval }" id="store_approval">
                    </form>
                 </div>
                <table class="table table-bordered" id="dataTable" style="width:100%, cellspacing:0">
                  <thead>
                    <tr>
                      <th>지점번호</th>
                      <th>지점이름</th>
                      <th>주소</th>
                      <th>이메일</th>
                      <th>전화번호</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="storevo" items="${storevoLsit }">
                     <tr class="popupStoreDetail">
                        <td class="point" >${storevo.store_code }</td>
                        <td class="point">${storevo.store_name }</td>
                        <td class="point" style="width: 40%;">${storevo.street_addr } ${storevo.remaining_addr }</td>
                        <td class="point" style="width: 15%;">${storevo.email }</td>
                        <td class="point">${storevo.store_phone_number }</td>
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
            
            
          </div>








        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
       
       
       
       
       
     </div>
   </div>

   



<div class="modal fade" id="storeDetail">
   <div class="modal-dialog">
      <div class="modal-content">
      <div class="modal-header" class="center">
         <h4 id="book_name">
         <!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
         </h4>
      </div>
      <div class="modal-body">
      <table class="table">
         <tr>
            <th width=40% class="center">지점번호</th>
            <td width=60%><p id="store_code"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">지점이름</th>
            <td width=60%><p id="store_name"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">우편번호</th>
            <td width=60%><p id="zip_code"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">도로명주소</th>
            <td width=60%><p id="street_addr"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">나머지주소</th>
            <td width=60%><p id="remaining_addr"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">이메일</th>
            <td width=60%><p id="email"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">전화번호</th>
            <td width=60%><p id="store_phone_number"></p></td>
         </tr>
         <tr>
            <th width=40% class="center">승인여부</th>
            <td width=60%><p id="store_approval2"></p></td>
         </tr>
      </table>
      </div>
      
      <div class="modal-footer">
          <button type="button" class="btn btn-info" onclick="Store_approval()" id="sendBtn">폐점하기</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
</div>







<script>
$(document).ready(function () {
   document.getElementById("menu_name").innerHTML = "지점관리";
});
</script>
</body>
</html>