<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>마일리지적립</title>
    <%@include file="/common/include.jspf"%>
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
        }

    </style>
    <style>
        <%@include file="/resources/css/header.css"%><%@include file="/resources/css/footer.css"%>

    </style>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#start_year, #start_month, #end_year, #end_month").change(function() {
                var checkNum = 7; //7개월이면 6로 셋팅
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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <style>
        .account_info01 {
            border: 2px ridge #D38888;
            padding: 50px 20px;
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
                <h3 class="bul_green20"><span>&nbsp;&nbsp;마일리지</span></h3>
                <br>
                <div class="account_info01">
                    <h5> <span class="help01_span">&nbsp;&nbsp;&nbsp;&nbsp;도움말&nbsp;&nbsp;</span></h5>
                    <ul>
                        <li style="list-style:none;"> 주문하신 상품이 발송된 다음날, 마일리지가 누적됩니다.</li>
                        <li style="list-style:none;"> 지니문고 직배송 상품과 통합 결제하신 굿즈 주문은 모든 상품이 출고된 후 마일리지가 적립됩니다.</li>
                        <li style="list-style:none;"> 마일리지로 전환할 수 있는 기간은 마일리지 누적일로부터 12개월 이내입니다.</li>
                        <li style="list-style:none;"> 단, 기타 마일리지(도서생활권 전환 마일리지, 각종 이벤트성 마일리지 등) 유효기간은 발급 사유에 따라 상이합니다.</li>
                        <li style="list-style:none;"> 마일리지 포인트는 현금성 결제수단으로 결제하신 금액에 대해서만 적립됩니다.</li>
                        <li style="list-style:none;"> 마일리지는 비현금성 결제수단으로 미사용분의 환불이 불가합니다.</li>
                        <li style="list-style:none;"> 마일리지나 할인쿠폰으로 할인받은 결제액은 마일리지 적립대상에서 제외됩니다.</li>
                    </ul>
                </div>
                <br>
                <h4><span>마일리지 내역</span></h4>

                <form action="getMyMileageDateList.do" method="post">
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
                    <button type="submit" class="btn btn-outline-dark">검색</button>
                </form>
                <!-- ------------------------------------본문-------------------------------------- -->
                <br>
                <table id="customers">
                    <tr>
                        <th>구분</th>
                        <th>날짜</th>
                        <th>상세내역</th>
                        <th>발급금액</th>
                        <th>사용금액</th>
                        <th>잔액</th>
                    </tr>
                    <c:forEach items="${mileagedateList}" var="user">
                        <tr>
                            <td>${user.idx}</td>
                            <td>${user.order_date}</td>
                            <td>${user.point_content}</td><!--  상세내역 -->
                            <td>${user.order_accu_point}</td><!-- ordersorder_accu_point  발급금액 -->
                            <td>${user.point_usded}</td><!-- point users -->
                            <td>${user.point}</td><!-- POINT users 내역-->
                        </tr>
                    </c:forEach>
                </table>
                <br><br><br><br><br><br><br><br><br><br><br>

                <!-- 오른쪽 사이드바 -->
                <div class="col-xl-2 col-md-2 mb-2"></div>
            </div>
        </div>
    </div>
</body>

</html>
