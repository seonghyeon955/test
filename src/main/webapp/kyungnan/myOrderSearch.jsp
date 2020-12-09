<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>배송/조회</title>
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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#start_year, #start_month, #end_year, #end_month").change(function() {
                var checkNum = 7; //3개월이면 2로 셋팅
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
                <h3 class="bul_green20"><span>&nbsp;&nbsp;주문/배송조회</span></h3>
                <br>
                <div class="account_info01">
                    <h5> <span class="help01_span">&nbsp;&nbsp;&nbsp;&nbsp;도움말&nbsp;&nbsp;</span></h5>
                    <ul>
                        <li style="list-style:none;"> 중고샵 해피콜 신청 (02) 364-8947 : 상담요청 전용 번호로 신청 후 1-2시간 내 상담전화</li>
                        <li style="list-style:none;"> 배송 문의 : 익일택배 CJ대한통운택배(1588-1255) / 당일택배 SLX(1544-6482) / 우체국택배(1588-1300) / 편의점택배 (1577-1287)<br>
                            <span class="account_info01_span01">(배송방법 : 주문조회/변경/취소 클릭 후 확인</span>)</li>
                   </ul>
                </div>
                <br>
                <h4><span>주문 조회/변경/취소</span></h4>
                판매자별 조회 :
                <select name="opt" id="mypage">
                    <option value="" selected disabled style="width:100px;height:40px;">전체보기</option>
                    <option value="0"></option>
                    <option value="1">출판사</option>
                </select>
                배송 상태별 조회
                <select name="opt" id="mypage">
                    <option value="" selected disabled style="width:100px;height:40px;">전체보기</option>
                    <option value="0">저자</option>
                    <option value="1">출판사</option>
                </select>
                <br>
                <form action="getMyOrderdate.do" method="post">
                    <!-- controller -->
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
                        <option value="" selected disabled style="width:100px;height:40px;">주문상품</option>
                        <option value="0">주문번호</option>
                        <option value="1">수령인</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요" style="width:300px;" />
                    <button type="submit" class="btn btn-outline-dark" >검색</button>
                </form>
                <br>
                <table id="customers">
                    <tr>
                        <th>주문번호</th>
                        <th>주문일자</th>
                        <th>주문금액/수량</th>
                        <th>주문자</th>
                        <th>취소/교환/반품</th>
                        <th>상세보기</th>
                    </tr>
                    <c:forEach items="${myorderdateList}" var="order">
                        <tr>
                            <td>${order.order_no}</td>
                            <td>${order.order_date}</td>
                            <td>${order.order_total_cost}</td>
                            <td>${order.order_recv_name}</td>
                            <td>${order.state}</td>
                            <td><button onclick="window.open('getMyOrderDetailList.do?order_no=${order.order_no}'
,'window_name','width=800,height=700,location=no,status=no,scrollbars=yes');" class="btn btn-outline-dark">상세보기</button></td>
                        </tr>
                    </c:forEach>
                </table>
                <br><br><br>
            <!-- 오른쪽 사이드바 -->
            <div class="col-xl-2 col-md-2 mb-2"></div>
        </div>
    </div>
    </div>
</body>

</html>
