<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<div class="hk-pg-wrapper">
	<div class="container-xxl">
		<!-- Page Header -->
		<div class="hk-pg-header pg-header-wth-tab pt-7">
			<div class="d-flex">
				<div class="d-flex flex-wrap justify-content-between flex-1">
					<div class="mb-lg-0 mb-2 me-8">
						<h1 class="pg-title">근무현황 - ${loginEmp.emp_name }님</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Header -->
		<section class="pt-3">
			<div class="container ">
				<div class="top-bar">
					<div class="second-line">
						<div></div>
						<div>
						</div>
					</div>
					<div class="thrid-line">
						<div class="day-filter">
							<button class="btn btn-dark" onclick="workListWeek();">주별</button>
							<button class="btn btn-dark" onclick="workListMonth();">월별</button>
						</div>
						<div class="filter-right-part">
							<div id="currentTime"></div>
						</div>
					</div>

				</div>
			</div>

			
			<div class="taskboard-body col-md-8 col-sm-12 container-fluid mt-5">
				<div class="row mb-5 justify-content-center">

					<div class="col-lg-4">
						<div class="card border-dark">
							<div class="card-body">
								<div class="media align-items-center">
									<div class="media-head"></div>
									<div class="media-body">
										<span>평균 출근시간</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted justify-content-between">
								<div
									class="d-flex align-items-center avatar-group avatar-group-me">
									<div style="width: 120%" class="avatar avatar-soft-blue">
										<span style="width: 120%" id="avgStartWork"
											class="initial-wrap">${avgStartWork }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card border-dark">
							<div class="card-body">
								<div class="media align-items-center">
									<div class="media-head"></div>
									<div class="media-body">
										<span>평균 퇴근시간</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted justify-content-between">
								<div
									class="d-flex align-items-center avatar-group avatar-group-me">
									<div style="width: 120%" class="avatar avatar-soft-blue">
										<span style="width: 120%" id="avgEndWork" class="initial-wrap">${avgEndWork }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%-- <div class="col-lg-4">
						<div class="card border-dark">
							<div class="card-body">
								<div class="media align-items-center">
									<div class="media-head"></div>
									<div class="media-body">
										<span>근무 시간 초과</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted justify-content-between">
								<div
									class="d-flex align-items-center avatar-group avatar-group-me">
									<div style="width: 120%" class="avatar avatar-soft-blue">
										<span style="width: 120%" id="overWork" class="initial-wrap">${overWork }
											회</span>
									</div>
								</div>
							</div>
						</div>
					</div> --%>
				</div>

				<div class="row">
					<div class="col-lg-4">
						<div class="card border-dark">
							<div class="card-body">
								<div class="media align-items-center">
									<div class="media-head"></div>
									<div class="media-body">
										<span>지각</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted justify-content-between">
								<div
									class="d-flex align-items-center avatar-group avatar-group-me">
									<div style="width: 120%" class="avatar avatar-soft-red">
										<span style="width: 120%" id="lateWork" class="initial-wrap">${lateWork } 회</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card border-dark">
							<div class="card-body">
								<div class="media align-items-center">
									<div class="media-head"></div>
									<div class="media-body">
										<span>조퇴</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted justify-content-between">
								<div
									class="d-flex align-items-center avatar-group avatar-group-me">
									<div style="width: 120%" class="avatar avatar-soft-red">
										<span style="width: 120%" id="fastEnd" class="initial-wrap">${fastEnd } 회</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card border-dark">
							<div class="card-body">
								<div class="media align-items-center">
									<div class="media-head"></div>
									<div class="media-body">
										<span>결근</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted justify-content-between">
								<div
									class="d-flex align-items-center avatar-group avatar-group-me">
									<div style="width: 120%" class="avatar avatar-soft-red">
										<span style="width: 120%" id="absence" class="initial-wrap">${absence }	회</span>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</section>

	</div>
</div>
<style>
:root {
	--navy: rgba(14, 25, 90, 0.8);
}

.day-filter>button {
	background-color: var(--navy);
}

.filter-right-part>button {
	background-color: var(--navy);
}
#currentTime{
	text-align:center;
	width:220px;
	border: none;
	background-color: var(--navy);
	color: white;
	border-radius: 5px;
	padding: 8px;
}
.container {
	width: 100%;
	height: 100%;
	width: 90%;
	margin: auto;
}

.top-bar>div {
	display: flex;
	margin-bottom: 10px;
}

.first-line {
	font-size: 28px;
}

.first-line>div {
	margin-right: 20px;
}

.second-line {
	font-size: 18px;
	display: flex;
	justify-content: space-between;
}

.second-line>div {
	display: flex;
}

.second-line>div>div {
	margin-right: 10px;
}

.thrid-line {
	display: flex;
	justify-content: space-between;
}

.thrid-line>div {
	display: flex;
}

.day-filter>button {
	margin-right: 5px;
}

.filter-right-part>button {
	margin: 0 10px;
}
</style>
<script>
	const week = 7;
	const month = 30;
    function workListWeek() {
    	fetch("${path}/work/workListWeek?week=" + week)
    	//fetch("${path}/work/workListWeek?week=${week}") 이건 전달이 안됌...
	    .then(response => response.json())
	    .then(data => {
	      // 데이터 처리 로직
	      let avgStartWork = data.avgStartWork;
	      let avgEndWork = data.avgEndWork;
	      let lateWork = data.lateWork;
	      let fastEnd = data.fastEnd;
	      let absence = data.absence;
	      
	      document.getElementById('avgStartWork').textContent = avgStartWork;
	      document.getElementById('avgEndWork').textContent = avgEndWork;
	      document.getElementById('lateWork').textContent = lateWork+" 회";
	      document.getElementById('fastEnd').textContent = fastEnd+" 회";
	      document.getElementById('absence').textContent = absence+" 회";
	      console.log(avgStartWork);
	    })
	    .catch(error => {
	      // 에러 처리 로직
	      console.error(error);
	    });
	}
    function workListMonth() {
    	fetch("${path}/work/workListMonth?month="+month)
	    .then(response => response.json())
	    .then(data => {
	      // 데이터 처리 로직
	      let avgStartWork = data.avgStartWork;
	      let avgEndWork = data.avgEndWork;
	      let lateWork = data.lateWork;
	      let fastEnd = data.fastEnd;
	      let absence = data.absence;
	      
	      document.getElementById('avgStartWork').textContent = avgStartWork;
	      document.getElementById('avgEndWork').textContent = avgEndWork;
	      document.getElementById('lateWork').textContent = lateWork+" 회";
	      document.getElementById('fastEnd').textContent = fastEnd+" 회";
	      document.getElementById('absence').textContent = absence+" 회";
	      console.log(avgStartWork);
	    })
	    .catch(error => {
	      // 에러 처리 로직
	      console.error(error);
	    });
	}
    
	</script>
	<script>
  // 현재 시간을 가져오는 함수
  function getCurrentTime() {
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth()+1;
    let day = date.getDate();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();

    // 시, 분, 초를 2자리 숫자로 표시하기 위해 앞에 0을 붙임
    hours = addLeadingZero(hours);
    minutes = addLeadingZero(minutes);
    seconds = addLeadingZero(seconds);

    // 시간을 형식에 맞게 표시
    let currentTime = year + "년 " + month + "월 " + day + "일 " + hours + ":" + minutes + ":" + seconds;

    // HTML 요소에 현재 시간을 표시
    document.getElementById("currentTime").innerText = currentTime;
    //document.getElementById("workStartTime").value=currentTime;
    //document.getElementById("workEndTime").value=currentTime;
  }

  // 숫자 앞에 0을 붙이는 함수
  function addLeadingZero(number) {
    return number < 10 ? "0" + number : number;
  }

  // 1초마다 현재 시간 업데이트
  setInterval(getCurrentTime, 1000);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>