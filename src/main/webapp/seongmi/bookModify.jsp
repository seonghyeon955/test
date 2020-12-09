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
		//alert(book_name + '    ' + category_name);
		
		$.ajax({
			type: 'POST',
			url: 'searchBookName.do',
			dataType: "json",
			data: {book_name: book_name,
				   category_name: category_name},
			success: function(result){
				$(result).each(function(i){
					var list = result[i];
					//alert(list);
					$('#searchName').append("<li><input type='radio' name='nameList' value='" + list + "'>"+list+"</li>");
					
				});
			}
		});
		$("#bookNameSearch").modal("show");
	}
	
	function modifyConfirm(){
		var modal = document.getElementById("modifyConfirm");
		
		document.getElementById("modal_book_no").innerHTML = $('#book_no').val();
		document.getElementById("modal_book_name").innerHTML = $('#book_name').val();
		document.getElementById("modal_book_writer").innerHTML = $('#book_writer').val();
		document.getElementById("modal_book_publisher").innerHTML = $('#book_publisher').val();
		document.getElementById("modal_book_price").innerHTML = $('#book_price').val();
		document.getElementById("modal_book_saleprice").innerHTML = $('#book_saleprice').val();
		document.getElementById("modal_book_info").innerHTML = $('#book_info').val();
		document.getElementById("modal_book_published_date").innerHTML = $('#book_published_date').val();
		document.getElementById("modal_book_total_page").innerHTML = $('#book_total_page').val();
		document.getElementById("modal_book_entered_date").innerHTML = $('#book_entered_date').val();
		document.getElementById("modal_ebook").innerHTML = $('#ebook').val();
		document.getElementById("modal_book_isbn").innerHTML = $('#book_isbn').val();
		document.getElementById("modal_book_img").src = $('#book_img').val();
		document.getElementById("modal_book_info").src = $('#book_info').val();
		//document.getElementById("modal_category_code").innerHTML = $('#category_code').val();
		//document.getElementById("modal_category_main").innerHTML = $('#category_main').val();
		document.getElementById("modal_category_name").innerHTML = $('#category_name').val();
		
		$("#modifyConfirm").modal("show");
		
		/*var book_name = $('#book_name').val();
		var book_writer = $('#book_writer').val();
		var book_publisher = $('#book_publisher').val();
		var book_price = $('#book_price').val();
		var book_saleprice = $('#book_saleprice').val();
		var book_info = $('#book_info').val();
		var book_published_date = $('#book_published_date').val();
		var book_total_page = $('#book_total_page').val();
		var book_entered_date = $('#book_entered_date').val();
		var ebook = $('#ebook').val();
		var book_isbn = $('#book_isbn').val();
		var book_img = $('#book_img').val();
		var cotegory_code = $('#category_code').val();
		var cotegory_main = $('#cotegory_main').val();
		var cotegory_name = $('#cotegory_name').val();*/
	}
	
	function modifyUpdate(){
		var book_no = $('#book_no').val();
		var book_name = $('#book_name').val();
		var book_writer = $('#book_writer').val();
		var book_publisher = $('#book_publisher').val();
		var book_price = $('#book_price').val();
		var book_saleprice = $('#book_saleprice').val();
		var book_info = $('#book_info').val();
		var book_published_date = $('#book_published_date').val();
		var book_total_page = $('#book_total_page').val();
		var book_entered_date = $('#book_entered_date').val();
		var ebook = $('#ebook').val();
		var book_isbn = $('#book_isbn').val();
		var book_img = $('#book_img').val();
		var category_code = $('#category_code').val();
		var category_main = $('#category_main').val();
		var category_name = $('#category_name').val();
		
		$.ajax({
			type:'POST',
			url: 'modifyUpdate.do',
			data: {book_no:book_no,
				book_name:book_name,
				book_writer:book_writer,
				book_publisher:book_publisher,
				book_price:book_price,
				book_saleprice:book_saleprice,
				book_info:book_info,
				book_published_date:book_published_date,
				book_total_page:book_total_page,
				book_entered_date:book_entered_date,
				ebook:ebook,
				book_isbn:book_isbn,
				book_img:book_img,
				category_code:category_code,
				category_main:category_main,
				category_name:category_name},
			dataType: 'json',
			success: function(result){
				alert("도서 정보가 수정되었습니다.");
				location.reload();
			},
			error: function(result){
				alert("정보 수정에 실패했습니다.");
			}
		});
		
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
              <form action="modifyUpdate.do">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  
                  <tr>
                  	<td>번호</td>
                  	<td colspan="2"><input type="text" id="book_no" class="form-control" value="${bookInfo.book_no }" readonly></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>분류</td>
                  	<td colspan="3"><select name="category_code" id="category_code" onchange="selectCode(this)">
                  		<!-- <option value="${bookInfo.category_code }">${bookInfo.category_code }</option> -->
                  		<c:forEach var="category" items="${categoryCode }">
                  			<option value="${category }">${category }</option>
                  		</c:forEach>
                  	</select>
                  	&nbsp;
                  	<select name="category_main" id="category_main" onchange="selectMain(this)">
                  		<option value="${bookInfo.category_main }">${bookInfo.category_main }</option>
                  	</select>
                  	&nbsp;
                  	<select name="category_name" id="category_name">
                  		<option value="${bookInfo.category_name }">${bookInfo.category_name }</option>
                  	</select></td>
                  </tr>
                  <tr>
                  	<td>제목</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_name" id="book_name" value="${bookInfo.book_name }"></td>
                  	<td><button type="button" class="btn btn-outline-primary" onclick="searchName();">검색</button></td>
                  </tr>
                  <tr>
                  	<td>저자</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_writer" value="${bookInfo.book_writer }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>출판사</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_publisher" value="${bookInfo.book_publisher }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>정가</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_price" value="${bookInfo.book_price }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>판매가</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_saleprice" value="${bookInfo.book_saleprice }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>책소개</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_info" value="${bookInfo.book_info }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>출판일</td>
                  	<td colspan="2"><input type="date" class="form-control" id="book_published_date" value="${bookInfo.book_published_date }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>총페이지수</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_total_page" value="${bookInfo.book_total_page }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>입고일</td>
                  	<td colspan="2"><input type="date" class="form-control" id="book_entered_date" value="${bookInfo.book_entered_date }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>EBOOK 여부</td>
                  	<td colspan="2"><input type="text" class="form-control" id="ebook" value="${bookInfo.ebook }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>ISBN</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_isbn" value="${bookInfo.book_isbn }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td>이미지경로</td>
                  	<td colspan="2"><input type="text" class="form-control" id="book_img" value="${bookInfo.book_img }"></td>
                  	<td></td>
                  </tr>
                  <tr>
                  	<td colspan="4" class="centerAlign">
                  		<button type="button" class="btn btn-outline-primary" onclick="modifyConfirm()">수정</button>
            			<input type="reset" class="btn btn-outline-primary" value="취소">
            		</td>
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

<div class="modal fade" id="modifyConfirm">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-body">
			<h4 align="center">수정하시겠습니까?</h4>
			
			<table class="table">
			<tr>
				<td rowspan="5" width=30%><img id="modal_book_img"></td>
				<th width=30% class="center">번호</th>
				<td width=40%><p id="modal_book_no"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">제목</th>
				<td width=40% colspan="2"><p id="modal_book_name"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">카테고리</th>
				<td width=40% colspan="2"><p id="modal_category_name"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">저자</th>
				<td width=40% colspan="2"><p id="modal_book_writer"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">출판사</th>
				<td width=40% colspan="2"><p id="modal_book_publisher"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">정가</th>
				<td width=40% colspan="2"><p id="modal_book_price"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">판매가</th>
				<td width=40% colspan="2"><p id="modal_book_saleprice"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">출판일</th>
				<td width=40% colspan="2"><p id="modal_book_published_date"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">입고일</th>
				<td width=40% colspan="2"><p id="modal_book_entered_date"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">총페이지수</th>
				<td width=40% colspan="2"><p id="modal_book_total_page"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">이북여부</th>
				<td width=40% colspan="2"><p id="modal_ebook"></p></td>
			</tr>
			<tr>
				<th width=30% class="center">ISBN</th>
				<td width=40% colspan="2"><p id="modal_book_isbn"></p></td>
			</tr>
			<tr>
				<th colspan="3" class="center">책정보</th>
			</tr>
			<tr>
				<td colspan="3" class="center"><p id="modal_book_info"></p></td>
			</tr>
			
		</table>
		</div>
			
		<div class="modal-footer">
		<input type="hidden" id="book_no_text">
          <button type="button" class="btn btn-info" onclick="modifyUpdate()">수정</button>
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
	document.getElementById("menu_name").innerHTML = "도서 수정";
});
</script>
</body>
</html>