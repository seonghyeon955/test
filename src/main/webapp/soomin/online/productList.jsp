<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>재고관리</title>
<%@include file="../../seongmi/officeAdminInclude.jspf"%>
<script>

   $(function(){
      //재고 빼기
      $(".cntMinus").click(function(){
         var confirmResult = confirm("해당 책의 재고를 바꾸시겠습니까?");
         if(confirmResult == false){
            return false;
         }
         var stock_idx = $(this).next().val();
         $bookCntReal = $(this).next().next();//hidden
         $bookCntChange = $(this).next().next().next();
         var bookCnt = parseInt($bookCntChange.val()) - 1;
         
         cntChange(stock_idx, bookCnt, $bookCntReal, $bookCntChange);
         
         
      });
      
      //재고 더하기
      $(".cntPlus").click(function(){
         var confirmResult = confirm("해당 책의 재고를 바꾸시겠습니까?");
         if(confirmResult == false){
            return false;
         }
         var stock_idx = $(this).prev().prev().prev().val();
         $bookCntReal = $(this).prev().prev();
         $bookCntChange = $(this).prev();
         var bookCnt = parseInt($bookCntChange.val()) + 1;
         cntChange(stock_idx, bookCnt, $bookCntReal, $bookCntChange);
         
         
      });
      
      
      $(".stockcnt").focusout(function(){
         var cnt = $(this).val();
         $bookCnt = $(this).prev();
         $bookCntReal = $(this).prev().prev();
         $bookCntChange = $(this);
         var stock_idx = $(this).prev().prev().val();
         var bookCnt = $bookCntChange.val();
         
         var confirmResult = confirm("해당 책의 재고를 " + cnt + "로 바꾸시겠습니까?");
         if(confirmResult == false){
            $(this).val($bookCnt.val());
            return false;
         }
         cntChange(stock_idx, bookCnt, $bookCntReal, $bookCntChange)
      });
      
      
      function cntChange(stock_idx, bookCnt, $bookCntReal, $bookCntChange){
         $.ajax({
            url: "stockChange.do",
            data: {
               stock_idx: stock_idx,
               cnt: bookCnt
            },
            type: "POST",
            success: function(result){
               if(result == "success"){
                  alert("재고가 수정되었습니다.");
                  $bookCntReal.val(bookCnt);
                  $bookCntChange.val(bookCnt);
               }else if(result == "fail"){
                  alert("예외가 발생하였습니다. 다시 시도하여 주세요.");
               }else{
                  alert("???");
               }
            },
            error: function(xhr, ajaxOptions, thrownError){
               alert(xhr.status);
               alert(xhr.responseText);
               alert(ajaxOptions);
            }
            
         });
      }
      
      
      
      $(".popupBookInfo").click(function(){
         var book_no = $(this).children(":eq(0)").text();
         
         $.ajax({
            url: "bookDetail.do",
            data: {
               book_no: book_no
            },
            type: "GET",
            //dataType: "json",
            success: function(bcvo){
               $("#book_no").text(bcvo.book_no);
               $("#category").text(bcvo.category_code + " - " + bcvo.category_main + " - " + bcvo.category_name);
               $("#book_name").text(bcvo.book_name);
               $("#book_writer").text(bcvo.book_writer);
               $("#book_publisher").text(bcvo.book_publisher);
               $("#book_price").text(bcvo.book_price);
               $("#book_saleprice").text(bcvo.book_saleprice);
               $("#book_published_date").text(bcvo.book_published_date);
               $("#book_total_page").text(bcvo.book_total_page);
               $("#book_entered_date").text(bcvo.book_entered_date);
               $("#ebook").text(bcvo.ebook);
               $("#book_isbn").text(bcvo.book_isbn);
               $("#book_info").text(bcvo.book_info);
               $("#book_img").attr("src", bcvo.book_img);
               
               $("#bookInfo").modal("show");
            },
            error: function(xhr, ajaxOptions, thrownError){
               alert(xhr.status);
               alert(xhr.responseText);
               alert(ajaxOptions);
            }
            
         });
         
      });
      
      
   });
   
   
   function bookModify(){
      var book_no = document.getElementById("book_no").innerHTML;
      console.log(book_no);
      
      location.href = "bookModify.do?book_no="+book_no;
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
              <h6 class="m-0 font-weight-bold text-primary">지점에 등록된 도서를 조회할 수 있습니다.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                 <div id="searchDiv">
                    <form action="productStock.do" method="get">
                    <input type="text" placeholder="책이름으로 검색" name="search">&nbsp;
                    <button type="submit" class="btn" >검색</button>
                    </form>
                 </div>
                <table class="table table-bordered" id="dataTable" style="width:100%, cellspacing:0">
                  <thead>
                    <tr>
                      <th>도서번호</th>
                      <th>카테고리</th>
                      <th>제목</th>
                      <th>저자</th>
                      <th>출판사</th>
                      <th>정가</th>
                      <th>판매가</th>
                      <th colspan="3">재고</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="bookStockvo" items="${bookStockvoList }">
                     <tr>
                        <td class="point popupBookInfo">${bookStockvo.book_no }</td>
                        <td class="point popupBookInfo">${bookStockvo.category_no }</td>
                        <td class="point popupBookInfo"><!-- <a href="#bookInfo" data-toggle="modal"> -->
                           ${bookStockvo.book_name }<!-- </a> --></td>
                        <td class="point popupBookInfo">${bookStockvo.book_writer }</td>
                        <td class="point popupBookInfo">${bookStockvo.book_publisher }</td>
                        <td class="point popupBookInfo">${bookStockvo.book_price }</td>
                        <td class="point popupBookInfo">${bookStockvo.book_saleprice }</td>
                        <td class="point" style="text-align:justify;">
                           <button type="button" class="btn cntMinus">-</button>
                           <input type="hidden" value="${bookStockvo.stock_idx }">
                           <input type="hidden" value="${bookStockvo.cnt }">
                           <input type="number" class="stockcnt" style="width: 70px;" value="${bookStockvo.cnt }">
                           <button type="button" class="btn cntPlus">+</button>
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
                        <li><a href="productStock.do?cPage=${pvo.beginPage - 1}&search=${requestScope.search}">이전</a></li>
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
                           <a href="productStock.do?cPage=${pageNo }&search=${requestScope.search}">${pageNo }</a>
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
                        <li><a href="productStock.do?cPage=${pvo.endPage + 1}&search=${requestScope.search}">다음</a></li>
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
<div class="modal fade" id="bookInfo">
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
            <td rowspan="5" width=30%><img id="book_img"></td>
            <th width=30% class="center">번호</th>
            <td width=40%><p id="book_no"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">카테고리</th>
            <td width=40% colspan="2"><p id="category"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">저자</th>
            <td width=40% colspan="2"><p id="book_writer"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">출판사</th>
            <td width=40% colspan="2"><p id="book_publisher"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">정가</th>
            <td width=40% colspan="2"><p id="book_price"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">판매가</th>
            <td width=40% colspan="2"><p id="book_saleprice"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">출판일</th>
            <td width=40% colspan="2"><p id="book_published_date"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">입고일</th>
            <td width=40% colspan="2"><p id="book_entered_date"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">총페이지수</th>
            <td width=40% colspan="2"><p id="book_total_page"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">이북여부</th>
            <td width=40% colspan="2"><p id="ebook"></p></td>
         </tr>
         <tr>
            <th width=30% class="center">ISBN</th>
            <td width=40% colspan="2"><p id="book_isbn"></p></td>
         </tr>
         <tr>
            <th colspan="3" class="center">책정보</th>
         </tr>
         <tr>
            <td colspan="3" class="center"><p id="book_info"></p></td>
         </tr>
         
      </table>
      </div>
      
      <div class="modal-footer">
      <input type="hidden" id="book_no_text">
          <button type="button" class="btn btn-info" onclick="bookModify()">Modify</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
</div>
   
   

<script>
$(document).ready(function () {
   document.getElementById("menu_name").innerHTML = "재고관리";
});
</script>
</body>
</html>