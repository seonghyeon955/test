<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@include file="/common/include.jspf"%>
    <title>주문상세정보</title>
    <script>
        var bDisplay = true;

        function doDisplay() {
            var con = document.getElementById("myDIV");
            if (con.style.display == 'none') {
                con.style.display = 'block';
            } else {
                con.style.display = 'none';
            }
        }
    </script>

    <style>
        ul,
        li {
            list-style: none;
            padding-left: 0px;
        }
    </style>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #customers td,
        #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #customers tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        #customers tr:hover {
            background-color: #ddd;
        }
        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #9F5252;
            color: white;
           text-align: center;
        }
    </style>
    <style>
       .box h3 {
       background-color : white;
       margin-left: auto;
       margin-right: auto;
       }
    </style>
</head>

<body>
    <!-- 본문영역 -->
    <div class="box"><h3>주문 상세정보</h3></div>
    <form action="getMyOrderDetailList.do" method="post">
        <input type="hidden" name="seq" value="${myorder.seq }">
        <table id="customers">
            <tr>
                <th>주문상세번호 </th>
                <th>지점이름</th>
                <th>상품이미지</th>
                <th>책 제목</th>
                <th>가격</th>
                <th>수량</th>
                <th>배송방법</th>
                <th>배송상태</th>
            </tr>
            <c:forEach var="order" items="${orderBookList }">
                <tr>
                    <td style=" text-align: center;"> ${order.order_no}</td><!-- 주문상세번호 order_book -->
                    <td style=" text-align: center;"> ${order.order_b_no}</td><!-- 지점이름 order_book-->
                                        <td style=" text-align: center;">
                    <img class="book-img" alt="상품이미지" src="${order.book_img}" style="width:20px;height:30px;"/>
               </td>
                    <%-- <td style=" text-align: center;">${order.book_no}</td> --%><!-- 책상품번호order_book -->
                    <td style=" text-align: center;">${order.book_name} </td><!-- 책상품번호book-->
                    <td style=" text-align: center;">${order.book_saleprice}</td><!-- 판매가 book-->
                    <td style=" text-align: center;">${order.order_b_cnt}</td><!-- 판매수량order_book -->
                    <td style=" text-align: center;">${order.order_delivery_type }</td><!-- 배송방법 order_book-->
                    <td style=" text-align: center;">${order.state}</td><!-- 배송상태order_book-->
                </tr>
            </c:forEach>
        </table>

       <div class="box"> <h3>굿즈 정보</h3></div>
        <table id="customers">
            <tr>
               <th>주문상세번호 </th><!-- 주문번호 order_goods -->
               <th>굿즈이미지 </th><!-- 주문상세번호 order_goods-->
                <th>상품명</th><!--상품명 goods-->
                <th>가격</th><!--가격 goods-->
                <th>수량</th><!-- 수량 order_goods-->
            </tr>
            <c:forEach var="order" items="${orderGoodsList }">
                <tr>
                    <td style=" text-align: center;">${order.order_g_no}</td>
                    <td style=" text-align: center;">
                    <img class="goods-img" alt="굿즈이미지" src="${pageContext.request.contextPath}/resources/img/goods_img/${order.goods_image}"/>
               </td>
                    <td style=" text-align: center;">${order.goods_name}</td>
                    <td style=" text-align: center;">${order.goods_saleprice}</td><!--가격 -->
                    <td style=" text-align: center;">${order.order_g_cnt}개</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <br>

       <div class="box"><h3>배송지 정보</h3></div> 
        <input type="hidden" name="seq" value="${myorder.seq }">
        <table id="customers">
            <%-- <c:forEach var="order"  items="${myOrderList }"> --%>
            <tr >
                <th width="70">성명</th>
                <td size=" 15" disabled>${delivery.order_recv_name}</td>
            </tr>
            <tr>
                <th>연락처</th>
                <td>${delivery.order_recv_phone }</td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td>${delivery.order_recv_zip_code } </td>
            </tr>
            <tr>
                <th>도로명주소</th>
                <td>${delivery.order_recv_street_addr }</td>
            </tr>
            <tr>
                <th>나머지주소</th>
                <td>${delivery.order_recv_remaining_addr }</td>
            </tr>
            <%--  </c:forEach> --%>
        </table>
        <div class="clear"></div>
        <br>
        <br>
        	<div  style="text-align:right">
                  <input type=button value="창닫기" class="btn btn-outline-dark" onclick="self.close()">
    		</div>
    		<br>
    </form>
</body>

</html>