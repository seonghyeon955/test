<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>barodream</title>
    <%@include file="/common/include.jspf"%>
    <script type="text/javascript">
        (function($) {
            $('.top_content_gnb .list .store a').click(function(e) {
                e.preventDefault();
                $(this).toggleClass('on');
                $('#storeList').toggle();
                if ($(this).closest('.list').is('.external')) {
                    var left = $(this).closest('.store').position().left;
                    $('#storeList').addClass('left').css({
                        'left': left
                    });
                }
            });
            $('.top_content_gnb .list .store a, #storeList').hover(function() {
                $('.top_content_gnb .list .store a').addClass('on');
                $('#storeList').show();
                if ($(this).closest('.list').is('.external')) {
                    var left = $(this).closest('.store').position().left;
                    $('#storeList').addClass('left').css({
                        'left': left
                    });
                }
            }, function() {
                $('.top_content_gnb .list .store a').removeClass('on');
                $('#storeList').hide();
            });
            $('#storeList .btn_close').click(function(e) {
                e.preventDefault();
                $('.top_content_gnb .list .store a').removeClass('on');
                $('#storeList').hide();
            });
            $('.top_content_gnb .list .store').one('mouseover', function() {
                $('#storeList .btn_close').hide();
            });
        })(jQuery);
    </script>

</head>
<%@include file="/common/header.jspf"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- 왼쪽 사이드바 -->
            <div class="col-xl-2 col-md-2 mb-2">
                <%@include file="/common/LeftSideMenuBar.jspf"%>
            </div>
            <!-- 본문영역 -->
            <div class="col-xl-8 col-md-8 mb-8 bg-light">
                <div class="store_list wide" id="storeList" style="display:none;">
                    <div class="link_main"><a href="">매장 안내</a></div>
                    <ul class="first">
                        <li class="list_title"><strong>서울</strong></li>
                        <li><a href="">광화문점</a></li>
                        <li><a href="">가든파이브<br /> 바로드림센터</a></li>
                        <li><a href="">강남점</a></li>
                        <li><a href="">동대문<br /> 바로드림센터</a></li>
                        <li><a href="">디큐브시티<br /> 바로드림센터</a></li>
                        <li><a href="">영등포점</a></li>
                        <li><a href="">은평<br /> 바로드림센터</a></li>
                        <li><a href="">이화여대<br /> 교내서점</a></li>
                        <li><a href="">잠실점</a></li>
                        <li><a href="">천호점</a></li>
                        <li><a href="">청량리<br /> 바로드림센터</a></li>
                        <li><a href="">합정점</a></li>
                    </ul>
                    <ul>
                        <li class="list_title"><strong>수도권</strong></li>
                        <li><a href="">가천대<br /> 교내서점</a></li>
                        <li><a href="">광교점</a></li>
                        <li><a href="">광교<br /> 월드스퀘어센터</a></li>
                        <li><a href="">부천점</a></li>
                        <li><a href="">분당점</a></li>
                    </ul>
                    <ul>
                        <li class="list_title"><strong>지방</strong></li>
                        <li><a href="">경성대<br /> 센터</a></li>
                        <li><a href="">광주상무 센터</a></li>
                        <li><a href="">대구점</a></li>
                        <li><a href="">대전점</a></li>
                        <li><a href="">반월당<br /> 바로드림센터</a></li>
                        <li><a href="">부산점</a></li>
                        <li><a href="">세종<br /> 바로드림센터</a></li>
                        <li><a href="">센텀시티점</a></li>
                        <li><a href="">울산점</a></li>
                        <li><a href="">전북대<br /> 교내서점</a></li>
                        <li><a href="">전주<br /> 바로드림센터</a></li>
                        <li><a href="">창원점</a></li>

                    </ul>
                    <div class="btn_close"><a href="#"><img src="http://image.kyobobook.co.kr/ink/images/gnb/btn_up3.gif" alt="닫기" /></a></div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
