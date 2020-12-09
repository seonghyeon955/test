<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리페이지</title>
<%@include file="officeAdminInclude.jspf"%>
</head>
<script>
	function PopupOrderDetail(clicked_element){
		var row_td = clicked_element.getElementsByTagName("td");
		var row_input = clicked_element.getElementsByTagName("input");
		var modal = document.getElementById("orderDetail");
		
		document.getElementById("order_no").innerHTML = row_td[0].innerHTML;
		document.getElementById("order_b_no").innerHTML = row_td[1].innerHTML;
		document.getElementById("order_user_id").innerHTML = row_td[2].innerHTML;
		document.getElementById("order_recv_name").innerHTML = row_td[3].innerHTML;
		document.getElementById("order_recv_phone").innerHTML = row_td[4].innerHTML;
		document.getElementById("order_date").innerHTML = row_td[5].innerHTML;
		document.getElementById("book_name").innerHTML = row_td[6].innerHTML;
		document.getElementById("book_saleprice").innerHTML = row_td[7].innerHTML;
		document.getElementById("order_b_cnt").innerHTML = row_td[8].innerHTML;
		document.getElementById("order_tot").innerHTML = row_td[9].innerHTML;
		
		
		document.getElementById("order_message").innerHTML = row_input[0].value;
		document.getElementById("order_recv_street_addr").innerHTML = row_input[1].value;
		document.getElementById("order_recv_remaining_addr").innerHTML = row_input[2].value;
		document.getElementById("order_recv_zip_code").innerHTML = row_input[3].value;
		document.getElementById("state").innerHTML = row_input[4].value;
		document.getElementById("order_accu_point").innerHTML = row_input[5].value;
		
		$("#orderDetail").modal("show");
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
              <h6 class="m-0 font-weight-bold text-primary">지점에 들어온 주문을 조회할 수 있습니다.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>주문번호</th>
                      <th>주문하위번호</th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>연락처</th>
                      <th>주문날짜</th>
                      <th>책제목</th>
                      <th>판매가</th>
                      <th>수량</th>
                      <th>판매금액</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="orderList" items="${orderList }">
                  	<tr onclick="PopupOrderDetail(this)">
                  		<td>${orderList.order_no }</td>
                  		<td>${orderList.order_b_no }</td>
                  		<td>${orderList.order_user_id }</td>
                  		<td>${orderList.order_recv_name }</td>
                  		<td>${orderList.order_recv_phone }</td>
                  		<td>${orderList.order_date }</td>
                  		<td>${orderList.book_name }</td>
                  		<td>${orderList.book_saleprice }</td>
                  		<td>${orderList.order_b_cnt }</td>
                  		<td>${orderList.book_saleprice * orderList.order_b_cnt }</td>
                  		<input type="hidden" value="${orderList.order_message }">
                  		<input type="hidden" value="${orderList.order_recv_street_addr }">
                  		<input type="hidden" value="${orderList.order_recv_remaining_addr }">
                  		<input type="hidden" value="${orderList.order_recv_zip_code }">
                  		<input type="hidden" value="${orderList.state }">
                  		<input type="hidden" value="${orderList.order_accu_point }">
                  		<input type="hidden" value="${orderList.book_img }">
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

<div class="modal fade" id="orderDetail">
	<div class="modal-dialog">
		<div class="modal-content">
		<!-- <div class="modal-header" class="center">
			<h4 id="book_name"> -->
			<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
		<!-- 	</h4>
		</div> -->
		<div class="modal-body">
		<table class="table">
			<tr>
				<th>주문번호</th>
				<td><p id="order_no"></p></td>
			</tr>
			<tr>
				<th>주문하위번호</th>
				<td><p id="order_b_no"></p></td>
			</tr>
			<tr>
				<th>주문날짜</th>
				<td><p id="order_date"></p></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><p id="order_user_id"></p></td>
			</tr>
			<tr>
				<th>책제목</th>
				<td><p id="book_name"></p></td>
			</tr>
			<tr>
				<th>판매가</th>
				<td><p id="book_saleprice"></p></td>
			</tr>
			<tr>
				<th>판매수량</th>
				<td><p id="order_b_cnt"></p></td>
			</tr>
			<tr>
				<th>판매금액</th>
				<td><p id="order_tot"></p></td>
			</tr>
			<tr>
				<th>수령인이름</th>
				<td><p id="order_recv_name"></p></td>
			</tr>
			<tr>
				<th>수령인연락처</th>
				<td><p id="order_recv_phone"></p></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><p id="order_recv_street_addr"></p></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><p id="order_recv_remaining_addr"></p></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><p id="order_recv_zip_code"></p></td>
			</tr>
			<tr>
				<th>적립포인트</th>
				<td><p id="order_accu_point"></p></td>
			</tr>
			<tr>
				<th>요청사항</th>
				<td><p id="order_message"></p></td>
			</tr>
			<tr>
				<th>배송상황</th>
				<td><p id="state"></p></td>
			</tr>
			
			
		</table>
		</div>
		
		<div class="modal-footer">
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
	document.getElementById("menu_name").innerHTML = "주문내역조회";
});
</script>
</body>
</html>