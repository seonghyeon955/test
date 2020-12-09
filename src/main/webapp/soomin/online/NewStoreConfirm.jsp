<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>지점추가승인</title>
<%@include file="../../seongmi/officeAdminInclude.jspf"%>
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
               $("#store_approval").text(storevo.store_approval);
               
               $("#storeDetail").modal("show");
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
      var email = document.getElementById("email").innerHTML;
      
      var result = confirm(store_code + " 지점을 승인하시겠습니까?");
      if(result == false){
         return false;
      }
      
      $.ajax({
         url: "store_approval.do",
         data: {
            store_code: store_code,
            email: email
         },
         type: "GET",
         //dataType: "json",
         success: function(data){
            if(data == "success"){
               alert("정상적으로 지점승인이 완료되었습니다.");
               location.href = "${pageContext.request.contextPath}/soomin/online/NewStoreConfirm.do";
            }else{
               alert("지점승인에 실패했습니다. 다시 시도하여 주십시오.");
            }
         },
         error: function(xhr, ajaxOptions, thrownError){
            alert(xhr.status);
            alert(xhr.responseText);
            alert(ajaxOptions);
         }
         
      });
      
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
   
   .btn{
      background-color: #4374D9;
      color: white;
   }
   
   #searchDiv {
      margin: auto;
      padding-left: 50%;
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
              <h6 class="m-0 font-weight-bold text-primary">지점목록.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                 <div id="searchDiv">
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
                  <c:forEach var="storevo" items="${newStorevoList }">
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
            <td width=60%><p id="store_approval"></p></td>
         </tr>
      </table>
      </div>
      
      <div class="modal-footer">
          <button type="button" class="btn btn-info" onclick="Store_approval()">승인하기</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
</div>







<script>
$(document).ready(function () {
   document.getElementById("menu_name").innerHTML = "지점추가승인";
});
</script>
</body>
</html>