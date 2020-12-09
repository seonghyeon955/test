<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>도서 수정</title>
<!-- jQuery library -->
<%@include file="officeAdminInclude.jspf"%>


<script type="text/javascript">
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
	}

	
	function searchName(){
		var book_name = $('#book_name').val();
		var category_name = $('#category_name').val();
		alert(book_name + '    ' + category_name);
		
		$.ajax({
			type: 'POST',
			url: 'searchBookName.do',
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
</script>


<style>
	.centerAlign {
		text-align: center;
	}
	
	ol{
		list-style:none;
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

		  
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">도서 정보를 수정하세요.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  
                  <tr>
                  	<td>번호</td>
                  	<td colspan="2"><input type="text" name="book_no" class="form-control" placeholder="도서번호"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>분류</td>
                  	<td><select name="category_code" id="category_code" onchange="selectCode(this)">
                  		<option value="">-대분류-</option>
                  		<c:forEach var="category" items="${categoryCode }">
                  			<option value="${category }">${category }</option>
                  		</c:forEach>
                  	</select></td>
                  	<td><select name="category_main" id="category_main" onchange="selectMain(this)">
                  		<option value="">-중분류-</option>
                  	</select></td>
                  	<td><select name="category_name" id="category_name">
                  		<option value="">-소분류-</option>
                  	</select></td>
                  </tr>
                  <tr>
                  	<td>제목</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_name" id="book_name" placeholder="제목을 입력하세요"></td>
                  	<td><button type="button" class="btn btn-outline-primary" onclick="searchName();">검색</button></td>
                  </tr>
                  <tr>
                  	<td>저자</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_writer" placeholder="저자를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>출판사</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_publisher" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>정가</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_price" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>판매가</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_saleprice" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>책소개</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_info" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>출판일</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_publisher_date" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>총페이지수</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_total_page" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>입고일</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_entered_date" placeholder="출판사를 입력하세요"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td colspan="4" class="centerAlign">
                  		<button type="button" class="btn btn-outline-primary">수정</button>
            			<button type="button" class="btn btn-outline-primary">취소</button>
            		</td>
                  </tr>
                    
                    
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
	document.getElementById("menu_name").innerHTML = "도서 입고";
});
</script>
</body>
</html>