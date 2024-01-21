<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<!-- 이 페이지에서는 해당 설문이 완료가 되면 해당 설문의 데이터들을 보여주는 페이지 -->
<div class="was-validated">
    <h1>설문 결과</h1>
    
	<div id="pie_chart_1" style="height: 500px; margin-bottom:500px; margin-left:500px;"><h2>TypeB(다중선택)</h2></div>
	
	<div id="pie_chart_2" style="height: 500px; margin-bottom:500px; margin-left:500px;"><h2>TypeC(단일선택)</h2></div>
    
</div>
<script src="${path}/resources/vendors/apexcharts/dist/apexcharts.min.js"></script>
<script src="${path}/resources/dist/js/pie-chart-init.js"></script>
<script>
/*Basic Chart*/
var options = {
 series: [50, 20, 10, 7, 13],
 chart: {
 width: 380,
 type: 'pie',
},
colors: ['#ff0000', '#008FFB', '#e92990', '#c02ff3', '#7429f8'],
labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
responsive: [{
 breakpoint: 480,
 options: {
	chart: {
	  width: 200
	},
	legend: {
	  position: 'bottom'
	}
 }
}]
};

var chart = new ApexCharts(document.querySelector("#pie_chart_1"), options);
chart.render();
var options = {
		 series: [50, 20, 10, 7, 13],
		 chart: {
		 width: 380,
		 type: 'pie',
		},
		colors: ['#ff0000', '#008FFB', '#e92990', '#c02ff3', '#7429f8'],
		labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
		responsive: [{
		 breakpoint: 480,
		 options: {
			chart: {
			  width: 200
			},
			legend: {
			  position: 'bottom'
			}
		 }
		}]
		};

		var chart = new ApexCharts(document.querySelector("#pie_chart_2"), options);
		chart.render();
		
</script>
<script>
    // Basic Chart for TypeB (다중선택)
    var chartData1 = parseSurveyData("${s.surveyData}");
    var options1 = {
        series: chartData1.series,
        chart: {
            width: 380,
            type: 'pie',
        },
        colors: chartData1.colors,
        labels: chartData1.labels,
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    var chart1 = new ApexCharts(document.querySelector("#pie_chart_1"), options1);
    chart1.render();

    // Basic Chart for TypeC (단일선택)
    var chartData2 = parseSurveyData("${s.surveyData}");
    var options2 = {
        series: chartData2.series,
        chart: {
            width: 380,
            type: 'pie',
        },
        colors: chartData2.colors,
        labels: chartData2.labels,
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    var chart2 = new ApexCharts(document.querySelector("#pie_chart_2"), options2);
    chart2.render();

    // Function to parse survey data
    function parseSurveyData(surveyData) {
        // Implement the logic to parse surveyData and return chartData
        // Example: surveyData format - '{"labels": [...], "series": [...], "colors": [...]}' 
        return JSON.parse(surveyData);
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>