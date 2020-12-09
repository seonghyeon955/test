<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>도서 입고</title>
<!-- jQuery library -->
<%@include file="/seongmi/officeAdminInclude.jspf"%>

<style>
   #GoodsAdd {
      display: none;
   }
</style>
<script type="text/javascript">
   function selectCode(){
      var code = $('#category_code').val();
      //alert(category_code);
      $.ajax({
         type: 'POST',
         url: '../../getCategoryMain.do',
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
         url: '../../getCategoryName.do',
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

   
   function searchName(){
      var book_name = $('#book_name').val();
      var category_name = $('#category_name').val();
      alert(book_name + '    ' + category_name);
      
      $.ajax({
         type: 'POST',
         url: '../../searchBookName.do',
         dataType: "json",
         data: {book_name: book_name,
               category_name: category_name},
         success: function(result){
            $(result).each(function(i){
               var list = result[i];
               alert(list);
               $('#searchName').append("<li><input type='radio' name='nameList' value='" + list + "'>"+list+"</li>");
               
            });
         }
      });
      $("#bookNameSearch").modal("show");
   }
   
   
   
   function insertbook(bookForm){
      
      
      var result = confirm("책을 입고하시겠습니까?");
      if(result == false){
         return false;
      }else{
         bookForm.submit();
         
      }
   } 
   
   function insertgoods(goodsForm){
      var result = confirm("사은품을 입고하시겠습니까?");
      if(result == false){
         return false;
      }else{
         goodsForm.submit();
         
      }
   }
   
   
   
   
</script>


<style>
   .centerAlign {
      text-align: center;
   }
   
   ol{
      list-style:none;
   }
   .inputProduct {
      cursor: pointer;
      color: white;
      background-color: gray;
      border-color: white;
   }
   .inputProduct:hover {
      color: silver;
   }
   .nowButton {
      background-color: #9F5252;
   }
</style>
</head>


<body>
<div id="wrapper">
    <%@include file="adminSideBar.jspf"%>
    
<div id="content-wrapper" class="d-flex flex-column">
   <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">
         <button class="btn nowButton inputProduct">도서 입고</button>
         <button class="btn inputProduct">사은품 입고</button>
         <br><br>
        
          <!-- DataTales Example -->
          <div class="card shadow mb-4" id="bookAdd">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">입고된 도서를 등록하세요.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <!-- 책 데이터 전송 form -->
                 <form action="insertBook.do" method="get">
                <table class="table table-bordered" id="dataTable" style="width:100% cellspacing:0">
                  
                  
                  <tr>
                     <td>분류</td>
                     <td colspan="3">
                     <select name="category_code" id="category_code" onchange="selectCode(this)">
                        <option value="">-대분류-</option>
                        <c:forEach var="category" items="${categoryCode }">
                           <option value="${category }">${category }</option>
                        </c:forEach>
                     </select>
                     <select name="category_main" id="category_main" onchange="selectMain(this)">
                        <option value="">-중분류-</option>
                     </select>
                     <select name="category_name" id="category_name">
                        <option value="">-소분류-</option>
                     </select></td>
                  </tr>
                  <tr>
                     <td>제목</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_name" id="book_name" placeholder="제목을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>저자</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_writer" placeholder="저자를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>출판사</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_publisher" placeholder="출판사를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>정가</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_price" placeholder="정가를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>판매가</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_saleprice" placeholder="판매가를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>책소개</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_info" placeholder="책정보를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>출판일</td>
                     <td colspan="2"><input type="date" class="form-control" name="book_published_date" placeholder="출판일을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>총페이지수</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_total_page" placeholder="총 페이지 수를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>입고일</td>
                     <td colspan="2"><input type="date" class="form-control" name="book_entered_date" placeholder="입고일을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>EBOOK 여부</td>
                     <td colspan="2">
                        <label><input type="radio" name="ebook" value="1">허용</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="ebook" value="0">허용 안 함</label>
                     </td>
                  </tr>
                  <tr>
                     <td>ISBN</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_isbn" value=""></td>
                  </tr>
                  <tr>
                     <td>이미지경로</td>
                     <td colspan="2"><input type="text" class="form-control" name="book_img" value=""></td>
                  </tr>
                  <tr>
                     <td colspan="3" class="centerAlign"><button type="button" class="btn btn-outline-primary" onclick="insertbook(this.form)">입고</button>
                              <button type="button" class="btn btn-outline-primary">취소</button></td>
                  </tr>
                    
                    
                </table>
                </form>
              </div>
            </div>
            <div>
               
            </div>
          </div>
          
          
          
          
          
           <!-- DataTales Example -->
          <div class="card shadow mb-4" id="goodsAdd">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">입고된 사은품을 등록하세요.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <!-- 굿즈 데이터 전송 form -->
                 <form action="insertGoods.do" method="post" enctype="multipart/form-data">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  
                 
                  <tr>
                     <td>이름</td>
                     <td colspan="2"><input type="text" class="form-control" name="goods_name" id="book_name" placeholder="제목을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>정가</td>
                     <td><input type="text" class="form-control" name="goods_price" placeholder="정가를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>굿즈판매시작일</td>
                     <td><input type="date" class="form-control" name="goods_start_date" placeholder="굿즈판매시작일을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>판매종료일</td>
                     <td><input type="date" class="form-control" name="goods_end_date" placeholder="굿즈판매종료일을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>이미지</td>
                     <td><input type="file" name="uploadFile">이미지파일추가</td>
                     
                  </tr>
                  <tr>
                     <td colspan="3" class="centerAlign"><button type="button" class="btn btn-outline-primary" onclick="insertgoods(this.form)">추가</button>
                              <button type="button" class="btn btn-outline-primary">취소</button></td>
                  </tr>
                    
                    
                </table>
                </form>
              </div>
            </div>
            <div>
               
            </div>
          </div>
          
          
          
          
          
          
          
          
          
          
          
          

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>

</div>

<div class="modal fade" id="bookNameSearch">
   <div class="modal-dialog">
      <div class="modal-content">
      <div class="modal-header" class="center">
         <h4 id="searchKeyWord">

         </h4>
      </div>
      <div class="modal-body">
         <ol id="searchName">
         
         </ol>
      </div>
      
      <div class="modal-footer">
      <input type="hidden" id="book_no_text">
          <button type="button" class="btn btn-info" onclick="bookModify()">선택</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
   </div>
</div>



<!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/js/demo/datatables-demo.js"></script>

<script>
$(document).ready(function () {
   $("#menu_name").html("도서 입고");
   $("#goodsAdd").css("display", "none");
   $(".inputProduct:button").button().click(function(){
      if($(this).text() == "도서 입고"){//도서 입고일 때
         $("#menu_name").html("도서 입고");
         $("#bookAdd").css("display", "");
         $("#goodsAdd").css("display", "none");
      }else{
         $("#menu_name").html("사은품 입고");
         $("#bookAdd").css("display", "none");
         $("#goodsAdd").css("display", "");
      }
   });
   
   
   
});
</script>
</body>
</html>