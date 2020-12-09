<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>전체상품조회</title>
<%@include file="officeAdminInclude.jspf"%>
<style>
	.center{
		text-align: center;
	}
</style>
</head>
<script>
function bookModify(){
	var book_no = document.getElementById("book_no_text").value;
	console.log(book_no);
	
	location.href = "bookModify.do?book_no="+book_no;
}

function PopupBookInfo(clicked_element){
	
	var row_td = clicked_element.getElementsByTagName("td");
	var row_input = clicked_element.getElementsByTagName("input");
	var modal = document.getElementById("bookInfo");
	
	
	
	document.getElementById("book_no_text").value = row_td[0].innerHTML;
	document.getElementById("book_no").innerHTML = row_td[0].innerHTML;
	document.getElementById("category_no").innerHTML = row_td[1].innerHTML;
	document.getElementById("book_name").innerHTML = row_td[2].innerHTML;
	document.getElementById("book_writer").innerHTML = row_td[3].innerHTML;
	document.getElementById("book_publisher").innerHTML = row_td[4].innerHTML;
	document.getElementById("book_price").innerHTML = row_td[5].innerHTML;
	document.getElementById("book_saleprice").innerHTML = row_td[6].innerHTML;
	document.getElementById("cnt").innerHTML = row_td[7].innerHTML;
	
	
	document.getElementById("book_info").innerHTML = row_input[0].value;
	document.getElementById("book_published_date").innerHTML = row_input[1].value;
	document.getElementById("book_total_page").innerHTML = row_input[2].value;
	document.getElementById("book_entered_date").innerHTML = row_input[3].value;
	document.getElementById("ebook").innerHTML = row_input[4].value;
	document.getElementById("book_isbn").innerHTML = row_input[5].value;
	document.getElementById("book_img").src = row_input[6].value;
	
	$("#bookInfo").modal("show");
	//modal.style.display = 'block';
}
</script>
<body>
<div id="wrapper">
<%@include file="adminSideBar.jspf"%>

<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

		  
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">지점에 등록된 도서를 조회할 수 있습니다.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
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
                      <th>재고</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="bookList" items="${officeBookList }">
                  	<tr onclick="PopupBookInfo(this)">
                  		<td>${bookList.book_no }</td>
                  		<td>${bookList.category_no }</td>
                  		<td><!-- <a href="#bookInfo" data-toggle="modal"> -->
                  			${bookList.book_name }<!-- </a> --></td>
                  		<td>${bookList.book_writer }</td>
                  		<td>${bookList.book_publisher }</td>
                  		<td>${bookList.book_price }</td>
                  		<td>${bookList.book_saleprice }</td>
                  		<td>${bookList.cnt }</td>
                  		<input type="hidden" value="${bookList.book_info }">
                  		<input type="hidden" value="${bookList.book_published_date }">
                  		<input type="hidden" value="${bookList.book_total_page }">
                  		<input type="hidden" value="${bookList.book_entered_date }">
                  		<input type="hidden" value="${bookList.ebook }">
                  		<input type="hidden" value="${bookList.book_isbn }">
                  		<input type="hidden" value="${bookList.book_img }">
                  	</tr>
                  </c:forEach>
                  </tbody>

                </table>
          
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
				<td rowspan="5" width="30%"><img id="book_img" style="width:300px;height:400px"></td>
				<th width=30% class="center">번호</th>
				<td width=40%><p id="book_no"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">카테고리</th>
				<td width=40% colspan="2"><p id="category_no"></p></td>
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
				<th width=30% class="center">재고</th>
				<td width=40% colspan="2"><p id="cnt"></p></td>
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

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/js/demo/datatables-demo.js"></script>

<script>
$(document).ready(function () {
	document.getElementById("menu_name").innerHTML = "판매도서조회";
});
</script>
</body>
</html>