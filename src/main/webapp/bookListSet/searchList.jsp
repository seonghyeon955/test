<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>책리스트 출력</title>
<%@include file="/common/include.jspf"%>
<!-- data table에서 jquery를 사용하기 때문에 가져옵니다.-->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- data table -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>   
<style>
<%@include file="/resources/css/header.css"%>
<%@include file="/resources/css/footer.css"%>

.center {
	text-align:center;
	vertical-align:middle;
}

</style>
<script>
 	$(document).ready(function(){
		var keyword = "${keyword }";
		//alert(keyword);
	    $('#dataTable').DataTable({
	    	"filter" : false,
	    	"ordering" : false
	    });
	    
	    
	    $("[id^=plus]").click(function(){
	    //function plus(elem){
			var cnt = $(this).prev().val();
			var book_no = $(this).next().val();
			var cntPlus = parseInt(cnt) + 1;
			console.log(book_no + "  " + cnt + "  " + cntPlus);
			$(this).prev().val(cntPlus);
    	//}
		});
	    
	    
	    $("[id^=minus]").click(function(){
		    //function plus(elem){
				var cnt = $(this).next().val();
				var book_no = $(this).next().next().next().val();
				var cntPlus = parseInt(cnt) - 1;
				console.log(book_no + "  " + cnt + "  " + cntPlus);
				$(this).next().val(cntPlus);
	    	//}
		});
	    
	    $("[id^=goCart]").click(function(){
			var cnt = $(this).prev().prev().prev().val();
			var book_no = $(this).prev().val();
			console.log(book_no + "  " + cnt + "  ");
			
			cart(book_no, cnt);
		});
	}); 
 	
 	
	function cart(book_no, cnt){
		
		var store_code = "online";
		
		alert(book_no + "번 책, " + cnt + "권, 가게번호 : " + store_code);
		
		if('${sessionScope.user}' != ""){ //회원일경우
			$.ajax({
				url : "cart.do",
				type: "post",
				dataType: "json",
				data:{
					 "book_no":book_no,
					 "cnt":cnt,
					 "store_code":store_code },
					
					success: function(result){//sucess
						alert("result : " + result.success);
						console.log(result);
						
						if(result.success == "success"){
							alert("선택한 상품이 장바구니에 담겼습니다.");
								if(confirm("장바구니로 이동하시겠습니까?")==true){//확인
									document.location.href= "gocart.do";
								}else{
									return false;
								}
						}else {//insertCart가 1이아닐때 
							alert("이미 장바구니에 있는 상품 입니다.");
						} //if문 끝  
						
					},//sucess 끝 
					error : function(jqXHR,textStatus,errorThrown){
						alert(textStatus);
						alert(errorThrown);
					}
			});//ajax 끝
			
		}else {//비회원일때 
			var ask = confirm("로그인 하시겠습니까?");
			if(ask == true){
				//location.href="정하가만들어준 로그인창 ";
				return false;
			}
			
			$.ajax({
				url : "cartNonMem.do",
				type: "get",
				//contentType:"application/json",
				dataType: "json",
				data:{
					 "book_no":book_no,
					 "cnt":cnt,
					 "store_code":store_code },
					
					success: function(result){//sucess
						alert("result : " + result.success);
						console.log(result);
						
						if(result.success == "success"){
							alert("[비회원]선택한 상품이 장바구니에 담겼습니다.");
								if(confirm("[비회원]장바구니로 이동하시겠습니까?")==true){//확인
									document.location.href= "gocartNon.do";
								}else{
									location.reload();
									return false;
								}
						}else {//insertCart가 1이아닐때 
							alert("이미 장바구니에 있는 상품 입니다.");
						} //if문 끝  
						
					},//sucess 끝 
					error : function(jqXHR,textStatus,errorThrown){
						alert(jqXHR.status);
						alert(jqXHR.responseText);
						alert(textStatus);
						alert(errorThrown);
					}
				
			});//ajax 끝
			
			
		}
		
	}
 	
 	
 	
	function selectBook(clicked_element){
		var row_input = clicked_element.getElementsByTagName("input");
		
		var book_no = row_input[0].value;
		//alert(book_no);
		
		location.href = "${pageContext.request.contextPath}/goBookDetail.do?book_no=" + book_no;
	}
	
	/* $('#plus').on('click', function(){
		var row = $(this).closest('tr');
		var input = row.getElementByTagName("input");
		var cnt = input[3].value;
		alert(cnt);
	}); */
	//function plus(){
	
	
	function minus(){
		
	}
</script>
<body>

<%@include file="/common/header.jspf"%>
<%@include file="/common/menuBar.jspf"%>
<%@include file="/common/bookClass.jspf"%>
<!-- Begin Page Content -->
<div class="container-fluid mainPage">

    <div class="row">
    	<!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
         <div class="col-xl-8 col-md-8 mb-8 bg-light">
         
         <div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

		  
          <!-- DataTales Example -->
          <!-- <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div> -->
            <div class="card-body">
              <div class="table-responsive">
                <table class="table" id="dataTable" width="100%" cellspacing="0">
                	<thead>
                		<tr>
                			<th width="20%"></th>
                			<th width="40%"></th>
                			<th width="20%"></th>
                			<th width="20%"></th>
                		</tr>
                	</thead> 
                	<tbody id="tbody" class="tbody center">
                  	<c:forEach var="bookList" items="${bookList }">
                  	<tr id="tr1" class="tr1"> 
                  		<td onclick="selectBook(this)" width="20%"><img src="${bookList.book_img }" width="120px" height="170px">
                  						<input type="hidden" value="${bookList.book_no }" id="book_no"></td>
                  		<td onclick="selectBook(this)" width="40%" style="text-align:left;vertical-align:middle"><h4>[${bookList.category_name }]  <span>${bookList.book_name }</span></h4><br>
                  					${bookList.book_writer }   |   ${bookList.book_publisher }
                  					<input type="hidden" value="${bookList.book_no }" id="book_no"></td>
                  		<td onclick="selectBook(this)" width="20%" style="vertical-align:middle"><h5 style="text-decoration:line-through;color:red">${bookList.book_price }원</h5>
                  						<h3>${bookList.book_saleprice }원</h3>
                  						P ${bookList.book_price * 0.05 }
                  						<input type="hidden" value="${bookList.book_no }" id="book_no"></td>
                  		<td id="cntValue" width="20%" style="vertical-align:middle"><button type="button" class="btn" id="minus">-</button>&nbsp;&nbsp;
                  				<input type="text" name="cnt" size="2" value="1">&nbsp;&nbsp;
                  				<button type="button" class="btn" id="plus">+</button>
                  				<input type="hidden" value="${bookList.book_no }" id="book_no">
       						<button type="button" class="btn btn-outline-secondary" id="goCart">장바구니담기</button><br>
       						<button type="button" class="btn btn-outline-secondary" id="goOrder">바로구매</button><br>
       						
       						</td>
                  	</tr>
                 	
                  	 
                  	</c:forEach>
                	</tbody>
					
                </table>
              </div>
            </div>

        <!-- /.container-fluid -->
		
      </div>
      <!-- End of Main Content -->

    </div>

        </div>
         
		</div>
		
		<!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
<%@include file="/common/footer.jspf"%>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/js/demo/datatables-demo.js"></script>
</body>
</html>