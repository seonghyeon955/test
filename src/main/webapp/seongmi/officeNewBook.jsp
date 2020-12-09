<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>도서 입고</title>
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
	
	//정가 입력되면 세일가 입력
	function inputCost(){
		var book_price = $('#book_price').val();
		console.log(book_price);
		var book_saleprice = book_price * 0.9;
		console.log(book_saleprice);
		$('#book_saleprice').val(book_saleprice);
	}
	
	function newBook(){
		//var book_no = $('#book_no').val();
		var category_code = $('#category_code').val();
		var category_main = $('#category_main').val();
		var category_name = $('#category_name').val();
		if(category_code == "" || category_main == "" || category_name == ""){
			alert("카테고리를 선택해주세요");
			return;
		}
		
		var book_name = $('#book_name').val();
		var book_writer = $('#book_writer').val();
		var book_publisher = $('#book_publisher').val();
		var book_price = $('#book_price').val();
		var book_img = $('#book_img').val();
		console.log(book_name + " : " + book_writer + " : " + book_publisher + " : " + book_price + " : " + book_img);
		if(book_name == "" || book_writer == "" || book_publisher == "" || book_price == "" || book_img == "" ||
		   book_name == undefined || book_writer == undefined || book_publisher == undefined || book_price == undefined || book_img == undefined){
			alert("필수입력사항을 모두 입력해주세요");
			return;
		}
		
		
		var book_saleprice = $('#book_saleprice').val();
		var book_info = $('#book_info').val();
		var book_published_date = $('#book_published_date').val();
		var book_total_page = $('#book_total_page').val();
		var book_entered_date = $('#book_entered_date').val();
		var ebook = $('#ebook').val();
		var book_isbn = $('#book_isbn').val();
		
		$.ajax({
			type:'POST',
			url: 'newBook.do',
			data: {
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
				category_name:category_name
				},
			dataType: 'json',
			success: function(result){
				alert("신간 도서가 등록되었습니다.");
				location.reload();
			},
			error: function(result,request,status,error) {
				alert("도서 등록에 실패했습니다.");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
              <h6 class="m-0 font-weight-bold text-primary">입고된 도서를 등록하세요.  ( * 표시는 필수 입력 사항입니다. )</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  
                  <!-- <tr>
                  	<td>번호</td>
                  	<td colspan="2"><input type="text" name="book_no" class="form-control" placeholder="도서번호"></td>
                  	<td></td>
                  </tr> -->
                  <tr>
                  	<td>* 분류</td>
                  	<td colspan="3"><select name="category_code" id="category_code" onchange="selectCode(this)">
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
                  	<td>* 제목</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_name" id="book_name" placeholder="제목을 입력하세요" value=""></td>
                  </tr>
                  <tr>
                  	<td>* 저자</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_writer" id="book_writer" placeholder="저자를 입력하세요" value=""></td>
                  </tr>
                  <tr>
                  	<td>* 출판사</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_publisher" id="book_publisher" placeholder="출판사를 입력하세요" value=""></td>
                  </tr>
                  <tr>
                  	<td>* 정가</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_price" id="book_price" placeholder="정가를 입력하세요" value="" onchange="inputCost()"></td>
                  </tr>
                  <tr>
                  	<td>판매가</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_saleprice" id="book_saleprice" placeholder="판매가를 입력하세요" value=""></td>
                  </tr>
                  <tr>
                  	<td>책소개</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_info" id="book_info" placeholder="책정보를 입력하세요" value="-"></td>
                  </tr>
                  <tr>
                  	<td>출판일</td>
                  	<td colspan="2"><input type="date" class="form-control" name="book_published_date" id="book_published_date" placeholder="출판일을 입력하세요" value="2020-12-31"></td>
                  </tr>
                  <tr>
                  	<td>총페이지수</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_total_page" id="book_total_page" placeholder="총 페이지 수를 입력하세요" value="0"></td>
                  </tr>
                  <tr>
                  	<td>입고일</td>
                  	<td colspan="2"><input type="date" class="form-control" name="book_entered_date" id="book_entered_date" placeholder="입고일을 입력하세요" value="2020-12-31"></td>
                  </tr>
                  <tr>
                  	<td>EBOOK 여부</td>
                  	<td colspan="2"><input type="text" class="form-control" name="ebook" id="ebook" placeholder="Ebook 여부를 입력하세요" value="0"></td>
                  </tr>
                  <tr>
                  	<td>ISBN</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_isbn" id="book_isbn" placeholder="isbn을 입력하세요" value="0"></td>
                  </tr>
                  <tr>
                  	<td>* 이미지경로</td>
                  	<td colspan="2"><input type="text" class="form-control" name="book_img" id="book_img" placeholder="책 이미지 경로를 입력하세요"></td>
                  </tr>
                  <tr>
                  	<td colspan="4" class="centerAlign"><button type="button" class="btn btn-outline-primary" onclick="newBook()">입고</button>
            						<button type="button" class="btn btn-outline-primary">취소</button></td>
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
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/jquery.dataTables.js"></script>
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