<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>일별매출</title>
<%@include file="officeAdminInclude.jspf"%>
</head>
<style>

</style>
<script>
	var chartLabels = [];
	var chartData = [];
	
	// 오늘 날짜 구하기
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	var date = year + "-" + month + "-" + day;
	console.log(month);
	console.log(date);
	
	$('#monthSelect').val(month).prop("selected",true);
	// 해당 월 첫번째 날짜 구하기
	//var startDate = '';
	//var endDate = '2020-12-31';
	//console.log(startDate + "   " + endDate);
	
	$.getJSON("daySales.do", {
		date : date
	},function(data){
		$('#tbody').html("");
		$.each(data, function(key, value){
			chartLabels.push(value.dd);
			chartData.push(value.dayTOT);
			$('#tbody').append("<tr>");
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

		
		
	function createChart(){
		var ctx = document.getElementById("drawChart").getContext("2d");
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
	
	function yearSelect(){
		chartLabels = [];
		chartData = [];
		year = $('#yearSelect').val();
		month = $('#monthSelect').val();
		date = year + "-" + month + "-" + day;
		console.log(date);
		
		$.getJSON("daySales.do", {
			date : date
		},function(data){
			$('#tbody').html("");
			$.each(data, function(key, value){
				chartLabels.push(value.dd);
				chartData.push(value.dayTOT);
				$('#tbody').append("<tr>");
				$('#tbody').append("<td width=50%>" + value.dd + "</td>")
				$('#tbody').append("<td width=50%>" + value.dayTOT + "</td>")
				$('#tbody').append("</tr>")
			});
			
			lineChartData = {
				labels : chartLabels,
				datasets : [
					{
						label: "월별 매출",
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
	
	function monthSelect(){
		chartLabels = [];
		chartData = [];
		year = $('#yearSelect').val();
		month = $('#monthSelect').val();
		date = year + "-" + month + "-" + day;
		console.log(date);
		
		$.getJSON("daySales.do", {
			date : date
		},function(data){
			$('#tbody').html("");
			$.each(data, function(key, value){
				chartLabels.push(value.dd);
				chartData.push(value.dayTOT);
				$('#tbody').append("<tr>");
				$('#tbody').append("<td width=50%>" + value.dd + "</td>")
				$('#tbody').append("<td width=50%>" + value.dayTOT + "</td>")
				$('#tbody').append("</tr>")
			});
			
			lineChartData = {
				labels : chartLabels,
				datasets : [
					{
						label: "월별 매출",
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
	
</script>

<body>

	<div id="wrapper">

    <%@include file="adminSideBar.jspf"%>

    <!-- Content Wrapper -->
    <!-- <div id="content-wrapper" class="d-flex flex-column"> -->

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

		  
          <!-- DataTales Example -->
          <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12"> 
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">일일매출</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div> 
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area" style="height:60vh">
                    <canvas id="drawChart" style="max-height:100%;width:80%"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            
          <!--   <div class="col-xl-12 col-lg-12">  -->
            <div class="card shadow mb-4">
            <div class="card-body">
              <p align="right">
              	<select name="yearSelect" id="yearSelect" onchange="yearSelect(this)">
              		<option value="2020">2020</option>
              		<option value="2019">2019</option>
              		<option value="2018">2018</option>
              	</select>
              	<select name="monthSelect" id="monthSelect" onchange="monthSelect(this)">
              		<option value="1" selected>1</option>
              		<option value="2">2</option>
              		<option value="3">3</option>
              		<option value="4">4</option>
              		<option value="5">5</option>
              		<option value="6">6</option>
              		<option value="7">7</option>
              		<option value="8">8</option>
              		<option value="9">9</option>
              		<option value="10">10</option>
              		<option value="11">11</option>
              		<option value="12">12</option>
              	</select>
              </p>
              <div class="table-responsive">
                <table class="table table-bordered" id="daySales" style="width:100%, cellspacing:0">
                  <thead>
                    <tr>
                      <th>날짜</th>
                      <th>매출</th>
                    </tr>
                  </thead>
                  <tbody id="tbody" name="tbody">
                  	<%-- <c:forEach var="monthTOT" items="${monthTOT }">
                  	<tr>
                  		<td>${monthTOT.mm }</td>
                  		<td>${monthTOT.monTOT }</td>
                  	</tr> 
                  	</c:forEach>--%>
                  </tbody>

                </table>
              </div>
            </div>
            <div>
            	
            </div>
          </div>
           <!--  </div> -->

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
	</div>
	<!-- </div> -->
	
	
<script>
$('#yearSelect').val(year).prop("selected",true);
$('#monthSelect').val(month).prop("selected",true);
</script>
</body>
</html>