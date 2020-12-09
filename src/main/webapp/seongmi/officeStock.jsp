<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>재고관리</title>
<%@include file="officeAdminInclude.jspf"%>

<script>
//$(".cntPlus").click(function(){ 
function stockManage(clicked_element){
	var row_td = clicked_element.getElementsByTagName("td");
	var row_input = clicked_element.getElementsByTagName("input");
	var modal = document.getElementById("stockModal");
	
	
	document.getElementById("book_no").value = row_td[0].innerHTML;
	document.getElementById("book_name").innerHTML = row_td[2].innerHTML;
	document.getElementById("stock").value = row_td[7].innerHTML;
	
	$("#stockModal").modal("show");
}

function cntPlus(){
	var stock = document.getElementById("stock").value;
	//console.log(stock);
	var stockPlus = Number(stock)+1;
	//console.log(stockPlus);
	
	document.getElementById("stock").value = stockPlus;
}

function stockModify(){
	var cnt = document.getElementById("stock").value;
	var book_no = document.getElementById("book_no").value;
	
	//console.log(cnt + "  " + book_no);
	$.ajax({
		type:'POST',
		url: 'modifyStock.do',
		data: {
			book_no : book_no,
			cnt : cnt
		},
		dataType: 'json',
		success: function(result){
			alert("재고가 수정되었습니다.");
			location.reload();
		},
		error: function(result){
			alert("재고 조정에 실패했습니다.");
		}
	});
}
	//var cnt = $('#cnt').text();
	//var book_no = #('')
	//console.log(cnt);
	/* $.ajax({
		type:'POST',
		url: 'modifyUpdate.do',
		data: {
			
		},
		dataType: 'json',
		success: function(result){
			alert("도서 정보가 수정되었습니다.");
			location.reload();
		},
		error: function(result){
			alert("정보 수정에 실패했습니다.");
		}
	}); */
	

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
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">지점에 등록된 도서의 재고를 조정합니다</h6>
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
                  	<tr onclick="stockManage(this)">
                  		<td>${bookList.book_no }</td>
                  		<td>${bookList.category_no }</td>
                  		<td><!-- <a href="#bookInfo" data-toggle="modal"> -->
                  			${bookList.book_name }<!-- </a> --></td>
                  		<td>${bookList.book_writer }</td>
                  		<td>${bookList.book_publisher }</td>
                  		<td>${bookList.book_price }</td>
                  		<td>${bookList.book_saleprice }</td>
                  		<!-- <td style="text-align:justify;"><button type="button" class="btn" id="cntMinus" onclick="cntMinus()">-</button></td>
                  		 --><td id="cntValue">${bookList.cnt }</td>
                  		<!-- <td><input type="button" class="btn" id="cntPlus" name="cntPlus" onclick="cntPlus()" value="+"></td>
                  		 -->
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

<div class="modal fade" id="stockModal">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header" class="center">
			<h4 id="book_name"></h4>
			재고를 조정해주세요
		</div>
		<div class="modal-body">
		<table class="table">
			<tr>
				<td></td>
				<td></td>
				<td><button type="button" class="btn" id="cntMinus" onclick="cntMinus()"><h2>-</h2></button></td>
				<td><input type="text" id="stock" style="font-size:20pt;width:70%;border:none"><!-- <h3 id="stock"></h3> --></td>
				<td><button type="button" class="btn" id="cntPlus" onclick="cntPlus()"><h2>+</h2></button></td>
				<td></td>
				<td></td>
				<input type="hidden" id="book_no">
			</tr>
		</table>
		</div>
		
		<div class="modal-footer">
		<input type="hidden" id="book_no_text">
          <button type="button" class="btn btn-info" onclick="stockModify()">Modify</button>
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
	document.getElementById("menu_name").innerHTML = "재고관리";
});
</script>
</body>
</html>