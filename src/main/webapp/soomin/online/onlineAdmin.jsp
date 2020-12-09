  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--   <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content=""> -->

  <title>지점관리페이지</title>
<%-- 
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
 --%>

<%@include file="/seongmi/officeAdminInclude.jspf"%>
</head>
<style>
   a{cursor: pointer;}
   
   .nowSale {
      color: black !important;
      font-size: 1.2em;
      
   }
</style>
<script>
//monthTOTChart
//var monthTOTChart = 
   
   
   var chartLabels = [];
   var chartData = [];
   
   // 오늘 날짜 구하기
   var today = new Date();
   var year = today.getFullYear();
   var month = today.getMonth()+1;
   var day = parseInt(today.getDate()) + 1;
   var date = year + "-" + month + "-" + day;
   console.log(month);
   console.log(date);
   
   $('#monthSelect').val(month).prop("selected",true);
   // 해당 월 첫번째 날짜 구하기
   //var startDate = '';
   //var endDate = '2020-12-31';
   //console.log(startDate + "   " + endDate);
   function daySales(store){
      
      $.getJSON("daySales.do", {
         date : date,
         store : store,
         page : "main"
      },function(data){
         $('#tbody').html("");
         chartLabels = [];
         chartData = [];
         $.each(data, function(key, value){
            
            chartLabels.push(value.dd);
            chartData.push(value.dayTOT);
            $('#tbody').text("<tr>");
            $('#tbody').append("<td width=50%>" + value.dd + "</td>");
            $('#tbody').append("<td width=50%>" + value.dayTOT + "</td>");
            $('#tbody').append("</tr>");
            
         });
         
         lineChartData = {
            labels : chartLabels,
            datasets : [
               {
                  label: "일일 매출",
                  fillColor : "rbga(151,187,205,0.2)",
                  backgroundColor:"#bfdaf9",
                      borderColor: "#80b6f4",
                      pointBorderColor: "#80b6f4",
                      pointBackgroundColor: "#80b6f4",
                      pointHoverBackgroundColor: "#80b6f4",
                      pointHoverBorderColor: "#80b6f4",
                      fill: false,
                      borderWidth: 4,
                      data : chartData
               }
            ]
         }
         createChart();
      });
   }
   
   daySales("online");
   
   
   function createChart(){
      var ctx = document.getElementById("monthTOTChart").getContext("2d");
      LineChartDemo = Chart.Line(ctx,{
         data : lineChartData,
         option :{
            maintainAspectRatio: false,
            responsive: false,
            scales :{
               yAxes :[{
                  ticks :{
                     beginAtZero: true
                  }
               }]
            }
         }
      })
      
   }
   
   
   
   
   function changeSales(val, id_name, aTag, class_name){
      document.getElementById(id_name).innerText = val;
      var classTags = document.getElementsByClassName(class_name);
      
      for(var i = 0; i < classTags.length; i++){
         classTags[i].classList.remove("nowSale");
      }
      
      aTag.classList.add("nowSale");
   }
   
   
</script>


<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <%@include file="adminSideBar.jspf"%>

    

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
          <!--   <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- 온라인 월별 매출 -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="float: right;">
                        <a class="nowSale onlinemonth" onclick="changeSales('${requestScope.sales.onlineMonthBookSales + requestScope.sales.onlineMonthGoodsSales}', 'onlineMonth', this, 'onlinemonth')">전체</a> 
                        <a class="onlinemonth" onclick="changeSales('${requestScope.sales.onlineMonthBookSales}', 'onlineMonth', this, 'onlinemonth')">책</a> 
                        <a class="onlinemonth" onclick="changeSales('${requestScope.sales.onlineMonthGoodsSales}', 'onlineMonth', this, 'onlinemonth')">굿즈</a> 
                      </div>
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">매출 (월)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦
                         <span id="onlineMonth">${requestScope.sales.onlineMonthBookSales + requestScope.sales.onlineMonthGoodsSales }</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 온라인 일별 매출 -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="float: right;">
                        <a class="nowSale onlineday" onclick="changeSales('${requestScope.sales.onlineDayBookSales + requestScope.sales.onlineDayGoodsSales }', 'onlineDay', this, 'onlineday')">전체</a> 
                        <a class="onlineday" onclick="changeSales('${requestScope.sales.onlineDayBookSales }', 'onlineDay', this, 'onlineday')">책</a> 
                        <a class="onlineday" onclick="changeSales('${requestScope.sales.onlineDayGoodsSales }', 'onlineDay', this, 'onlineday')">굿즈</a> 
                      </div>
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">매출 (일)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦ 
                         <span id="onlineDay">${requestScope.sales.onlineDayBookSales + requestScope.sales.onlineDayGoodsSales }</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 모든 지점 월별 매출 -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="float: right;">
                        <a class="nowSale allmonth" onclick="changeSales('${requestScope.sales.allMonthBookSales + requestScope.sales.allMonthGoodsSales }', 'allMonth', this, 'allmonth')">전체</a> 
                        <a class="allmonth" onclick="changeSales('${requestScope.sales.allMonthBookSales }', 'allMonth', this, 'allmonth')">책</a> 
                        <a class="allmonth" onclick="changeSales('${requestScope.sales.allMonthGoodsSales }', 'allMonth', this, 'allmonth')">굿즈</a>
                      </div>
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">매출 (월)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦ 
                         <span id="allMonth">${requestScope.sales.allMonthBookSales + requestScope.sales.allMonthGoodsSales }</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 모든 지점 일별 매출 -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="float: right;">
                        <a class="nowSale allday" onclick="changeSales('${requestScope.sales.allDayBookSales + requestScope.sales.allDayGoodsSales }', 'allDay', this, 'allday')">전체</a> 
                        <a class="allday" onclick="changeSales('${requestScope.sales.allDayBookSales }', 'allDay', this, 'allday')">책</a> 
                        <a class="allday" onclick="changeSales('${requestScope.sales.allDayGoodsSales }', 'allDay', this, 'allday')">굿즈</a> 
                      </div>
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">매출 (일)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦
                         <span id="allDay">${requestScope.sales.allDayBookSales + requestScope.sales.allDayGoodsSales }</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>



         <div class="col-xl-12 col-lg-12"> 
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">이달의 매출</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" onclick="daySales('online')">온라인매출만보기</a>
                      <a class="dropdown-item" onclick="daySales('all')">모든지점매출보기</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div> 
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area" style="height:60vh">
                    <canvas id="monthTOTChart"  style="max-height:100%;width:80%"></canvas>
                  </div>
                </div>
              </div>
            </div>
         
         
         
         
         
         
         
         

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>GENIE Books</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

</body>

</html>