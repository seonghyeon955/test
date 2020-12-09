<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>카테고리별매출</title>
<%@include file="officeAdminInclude.jspf"%>
</head>
<style>

</style>
<script>

	var chartLabels = [];
	var chartData = [];
	
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	var date = year + "-" + month + "-" + day;
	console.log(month);
	console.log(date);
	
	$('#monthSelect').val(month).prop("selected",true);
	
	$.getJSON("categorySales.do", {
		date: date
	},function(data){
		$('#tbody').html("");
		$.each(data, function(key, value){
			chartLabels.push(value.category_name);
			chartData.push(value.sumSales);
			$('#tbody').append("<tr>");
			$('#tbody').append("<td width=50%>" + value.category_name + "</td>");
			$('#tbody').append("<td width=50%>" + value.sumSales + "</td>");
			$('#tbody').append("</tr>");
			
		});
		
		lineChartData = {
			labels : chartLabels,
			datasets : [
				{
					label: "카테고리별 월별 매출",
	                data : chartData,
	                backgroundColor: [
	                	"#FF6384",
	                	"#36A2EB",
	                	"#FFCE56"
	                ],
	                hoverBackgroundColor: [
	                	"#FF6384",
	                	"#36A2EB",
	                	"#FFCE56"
	                ]
				}
			]
		}
		createChart();
	});

		
		
	function createChart(){
		var ctx = document.getElementById("drawChart").getContext("2d");
		LineChartDemo = new Chart(ctx,{
			type: 'pie',
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
		
		$.getJSON("categorySales.do", {
			date: date
		},function(data){
			$('#tbody').html("");
			$.each(data, function(key, value){
				chartLabels.push(value.category_name);
				chartData.push(value.sumSales);
				$('#tbody').append("<tr>");
				$('#tbody').append("<td width=50%>" + value.category_name + "</td>");
				$('#tbody').append("<td width=50%>" + value.sumSales + "</td>");
				$('#tbody').append("</tr>");
				
			});
			
			lineChartData = {
				labels : chartLabels,
				datasets : [
					{
						label: "카테고리별 월별 매출",
		                data : chartData,
		                backgroundColor: [
		                	"#FF6384",
		                	"#36A2EB",
		                	"#FFCE56"
		                ],
		                hoverBackgroundColor: [
		                	"#FF6384",
		                	"#36A2EB",
		                	"#FFCE56"
		                ]
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
		
		$.getJSON("categorySales.do", {
			date: date
		},function(data){
			$('#tbody').html("");
			$.each(data, function(key, value){
				chartLabels.push(value.category_name);
				chartData.push(value.sumSales);
				$('#tbody').append("<tr>");
				$('#tbody').append("<td width=50%>" + value.category_name + "</td>");
				$('#tbody').append("<td width=50%>" + value.sumSales + "</td>");
				$('#tbody').append("</tr>");
				
			});
			
			lineChartData = {
				labels : chartLabels,
				datasets : [
					{
						label: "카테고리별 월별 매출",
		                data : chartData,
		                backgroundColor: [
		                	"#FF6384",
		                	"#36A2EB",
		                	"#FFCE56"
		                ],
		                hoverBackgroundColor: [
		                	"#FF6384",
		                	"#36A2EB",
		                	"#FFCE56"
		                ]
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
                  <h6 class="m-0 font-weight-bold text-primary">카테고리별 월별 매출</h6>
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
                  <div class="chart-area" style="position: relative; height:50vh; width:40vw">
                    <canvas id="drawChart"></canvas>
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
                <table class="table table-bordered" id="monthSales" style="width:100%, cellspacing:0">
                  <thead>
                    <tr>
                      <th>월</th>
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