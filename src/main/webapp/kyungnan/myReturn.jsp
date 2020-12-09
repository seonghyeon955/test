<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>취소/교환/반품 조회</title>
    <%@include file="/common/include.jspf"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <style>
        <%@include file="/resources/css/header.css"%><%@include file="/resources/css/footer.css"%>

    </style>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            text-align: center;
        }

        #customers td,
        #customers th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        #customers tr:nth-child(even) {
            background-color: #f2f2f2;
            text-align: center;
        }

        #customers tr:hover {
            background-color: #ddd;
            text-align: center;
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
    <script type="text/javascript">
        $(document).ready(function() {
            $("#start_year, #start_month, #end_year, #end_month").change(function() {
                var checkNum = 2; //3개월이면 2로 셋팅
                //선택된 값을 가져온다.
                var startYear = $("#start_year option:selected").val();
                var startMonth = $("#start_month option:selected").val();
                var endYear = $("#end_year option:selected").val();
                var endMonth = $("#end_month option:selected").val();
                //계산을 위해 명시적으로 형변환
                var startYearNum = Number(startYear);
                var startMonthNum = Number(startMonth);
                var endYearNum = Number(endYear);
                var endMonthNum = Number(endMonth);

                //일단 차이를 재서 위에서 정한 월이 넘어가는지 확인	
                var result = ((endYearNum * 12) + endMonthNum) - ((startYearNum * 12) + startMonthNum);
                if (result > checkNum) {
                    alert("날짜 검색 범위는 " + (checkNum + 1) + "개월 입니다.");
                    if (endMonthNum <= checkNum) {
                        startYearNum = endYearNum - 1;
                        startMonthNum = 12 - (checkNum - endMonthNum)
                    } else {
                        startYearNum = endYearNum;
                        startMonthNum = endMonthNum - checkNum;
                    }
                    $("#start_year").val(startYearNum).attr("selected", "selected");
                    $("#start_month").val(startMonthNum).attr("selected", "selected");
                };
            });
        });

    </script>
    <style>
        .account_info01 {
            border: 2px ridge #D38888;
            padding: 30px 20px;
        }

    </style>
</head>
<%@ include file="/common/header.jspf" %>
<%@ include file="/common/menuBar.jspf" %>
<%@ include file="/common/bookClass.jspf" %>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- 왼쪽 사이드바 -->
            <div class="col-xl-2 col-md-2 mb-2">
                <%@include file="/common/LeftSideMenuBar.jspf"%>
            </div>
            <!-- 본문영역 -->
            <div class="col-xl-8 col-md-8 mb-8 bg-light">
                <br>
                <h3 class="bul_green20"><span>반품/교환 조회</span></h3>
                <br>
                <div class="account_info01">
                    <h5> <span class="help01_span">&nbsp;&nbsp;&nbsp;&nbsp;도움말&nbsp;&nbsp;</span></h5>
                    <ul>
                        <li style="list-style:none;">접수하신 반품 혹은 교환(하자상품)내역의 처리상태 및 정보를 조회 변경(취소)할 수 있습니다. </li>
                        <li style="list-style:none;">접수내역의 취소 변경(추가)은 현재 처리상태에 따라 불가능 할 수 있습니다. <br />이 경우 (1대1문의하기)를 이용해 신청해 주세요. </li>
                        <li style="list-style:none;">반품 환불 : 접수시 선택한 회송방법을 통해 상품이 도착되면 상품취소 및 환불됩니다. <br />반송시(지정택배사 이용시)/쿠폰사용액 차감 후 나머지만 환불되어, 환불예정액과 환불완료액이 다를 수 있습니다. </li>
                        <li style="list-style:none;">교환/추가배송/회수 : 교환상품 재배송 편에 하자상품 회수가 이루어집니다. </li>
                        <li style="list-style:none;">환불 완료 및 교환상품 출고 완료시 확인 메일을 보내드립니다. </li>
                    </ul>
                </div>
                <br>
                <h4><span>취소/교환/반품 조회</span></h4>
                판매자별 조회 :
                <select name="opt" id="mypage">
                    <option value="" selected disabled style="width:100px;height:40px;">전체보기</option>
                    <option value="0"></option>
                    <option value="1">출판사</option>
                </select>
                상태별 조회
                <select name="opt" id="mypage">
                    <option value="" selected disabled style="width:100px;height:40px;">전체보기</option>
                    <option value="0">저자</option>
                    <option value="1">출판사</option>
                </select>
                <br>
                <form action="getMyRetrunDateList.do" method="post">
                    <!-- search -->
                    <select id="start_year" name="start_year">
                        <option value="2013">2013</option>
                        <option value="2014">2014</option>
                        <option value="2015">2015</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020" selected="selected">2020</option>
                    </select>
                    <select id="start_month" name="start_month">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8" selected="selected">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select> ~
                    <select id="end_year" name="end_year">
                        <option value="2013">2013</option>
                        <option value="2014">2014</option>
                        <option value="2015">2015</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020" selected="selected">2020</option>
                    </select>
                    <select id="end_month" name="end_month">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8" selected="selected">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    <select name="opt" id="mypage">
                        <option value="" selected disabled style="width:100px;height:40px;">제목</option>
                        <option value="0">저자</option>
                        <option value="1">출판사</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요" style="width:300px;" />
                    <button type="submit" class="btn btn-outline-dark">검색</button>
                </form>
                <!-- ------------------------------------본문-------------------------------------- -->
                <br>

                <table id="customers">
                    <tr>
                        <th>주문번호</th>
                        <th>책제목</th>
                        <th>받는사람이름</th>
                        <th>주문일</th>
                        <th>회송방법</th>
                        <th>반품/교환</th>
                        <th>처리상태</th>
                        <th>접수일</th>
                        <th>수량</th>
                    </tr>
                    <c:forEach items="${myreturndateList}" var="order">
                        <tr>
                            <td>${order.order_no}</td>
                            <td>${order.book_name}</td>
                            <td>${order.order_recv_name}</td>
                            <td>${order.order_date}</td>
                            <td>${order.category_code}</td>
                            <td>${order.return_exchange_delivery_type}</td>
                            <td ><button syle="background-color : #D38888"; onclick="window.open('${pageContext.request.contextPath}/kyungnan/getMyRetrunDetailList.do?order_no=${order.order_no}'
,'window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">상세보기</button></td>
                            <td>${order.return_exchange_date}</td>
                            <td>${order.cnt}</td>
                        </tr>
                    </c:forEach>
                </table>
                <br><br><br><br><br><br><br><br><br><br><br>
            <!-- 오른쪽 사이드바 -->
            <div class="col-xl-2 col-md-2 mb-2"></div>
        </div>
    </div>
</body>

</html>
