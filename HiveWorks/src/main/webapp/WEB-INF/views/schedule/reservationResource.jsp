<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
 <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 부트스트랩CDN -->
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"
  ></script>
  <!-- 부트스트랩CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous"
  />
<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
</style>
<div class="hk-pg-wrapper pb-0">
	<div class="hk-pg-body py-0">
		<div class="blogapp-wrap">
			<nav class="blogapp-sidebar">
				<div data-simplebar class="nicescroll-bar">
					<div class="menu-content-wrap">
						<a href="add-new-post.html"
							class="btn btn-primary btn-rounded btn-block mb-4"> Create
							Post </a>
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item active"><a class="nav-link" href="${path }/schedule/reservationlistbyno.do?empNo=${loginEmp.emp_no}"> <span class="nav-icon-wrap"><span
											class="feather-icon"><i data-feather="users"></i></span></span> <span
										class="nav-link-text">내 예약 현황</span>
								</a></li>
							</ul>
						</div>
						<div class="separator separator-light"></div>
						<div
							class="d-flex align-items-center justify-content-between mb-2">
							<div class="title-sm text-primary mb-0">전사자산</div>
						</div>
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
										<c:if test="${not empty reList}">
											<c:forEach var="res" items="${reList}">
												<li class="nav-item">
													<a class="nav-link link-badge-right" href="${path }/schedule/reserveResource.do?resourceNo=${res.resourceNo}">
														<span class="nav-link-text">${res.resourceName}</span>
													</a>
												</li>
											</c:forEach>
										</c:if>
									</ul>
						</div>
						<div class="menu-gap"></div>
						<div class="nav-header">
							<span>관리자</span>
						</div>
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="${path }/schedule/reservationlist.do"> <span class="nav-icon-wrap"><span
											class="feather-icon"><i data-feather="flag"></i></span></span> <span
										class="nav-link-text">전체 예약/대여 조회</span>
								</a></li>

								<li class="nav-item"><a class="nav-link"
									href="${path}/schedule/resourcelist.do"> <span class="nav-icon-wrap"><span
											class="feather-icon"><i data-feather="grid"></i></span></span> <span
										class="nav-link-text">전사자산 목록</span>
								</a></li>
							</ul>
						</div>
						</div>
						</div>
			</nav>
			<div class="blogapp-content">
				<div class="blogapp-detail-wrap">
					<header class="blog-header">
						<div class="d-flex align-items-center">
							<a class="blogapp-title link-dark" href="#">
								<h1>자산 예약</h1>
							</a>
						</div>
						<div class="blog-options-wrap">
							<a
								class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none"
								href="#" data-bs-toggle="tooltip" data-bs-placement="top"
								title="" data-bs-original-title="Refresh"><span class="icon"><span
									class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
							<div class="v-separator  d-lg-inline-block d-none"></div>
							<a
								class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0  d-lg-inline-block d-none"
								href="#" data-bs-toggle="tooltip" data-bs-placement="top"
								title="" data-bs-original-title="Collapse"> <span
								class="icon"> <span class="feather-icon"><i
										data-feather="chevron-up"></i></span> <span
									class="feather-icon d-none"><i
										data-feather="chevron-down"></i></span>
							</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable"></div>
					</header>
					<div class="blog-body">
						<!-- calendar 태그 -->
						<div class="hk-pg-wrapper pb-0">
							<div class="" style="display: flex;">
							<div id='calendar-container'>
							    <div id='calendar'></div>
							  </div>
								<div style="width: 50%; display: block;">
									<form action="${path}/schedule/reserveResourceEnd.do"
										method="POST">
										<input type="hidden" name="empNo" value="${loginEmp.emp_no}"/>
										<input type="hidden" name="code" value="${currentResourceCalCode}"/>
										<input type="hidden" name="resourceNo" value="${currentResourceNo }"/>
										<input type="hidden" name="backgroundColor" value="#87f542"/>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">시작일자</label> <input
														class="form-control cal-event-date-start" name="start"
														type="text" />
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">종료일자</label> <input
														class="form-control cal-event-date-end" name="end"
														type="text" />
												</div>
											</div>
										</div>

					<div class="row gx-3">
										<div class="col-sm-3">
											<span>일정 공유</span>
										</div>
										<div class="col-sm-5">
											<div class="form-group">
												<button type="button" onclick="window.adddelFunction.util.addFile();"
													id="delBtn">추가</button>
<%--												<button type="button"--%>
<%--													id="addBtn">삭제</button>--%>
											</div>
										</div>
									</div>

									<div class="inviteContainer inviteContainer_1" style="display: flex">
										<div class="col-sm-4">
											<div class="form-groupddddd">
												<label class="form-label">부서</label>
												<div class="d-flex">
													<select class="form-select me-3" name="calDept"
														id="calDept1">
														<c:if test="${not empty deptList}">
															<c:forEach var="dept" items="${deptList}">
																<option value="${dept.deptCode}">${dept.deptName}</option>
															</c:forEach>
														</c:if>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="form-label">직원</label>
												<div class="d-flex">
													<select class="form-select me-3" name="calEmp" id="calEmp1">
														<c:if test="${not empty empList}">
															<c:forEach var="emp" items="${empList}">
																<option value="${emp.emp_no}">${emp.emp_name}</option>
															</c:forEach>
														</c:if>
													</select>
												</div>
											</div>
										</div>
										<button type="button" onclick="window.adddelFunction.util.delFile(this);">삭제</button>
									</div>
									<div name="someContainer"></div>
									
									
									
									
									
									
									
									
									
										<div class="form-group">
											<input class="form-check-input" type="checkbox"
												id="flexCheckDefault" name="reminder" value=> <label
												class="form-check-label" for="flexCheckDefault">
												알림여부 </label>
										</div>
										<button type="button" class="btn btn-secondary">취소</button>
										<button id="add_event" type="submit"
											class="btn btn-primary fc-addEventButton-button">예약</button>
									</form>
									<table class="table">
										<thead>
											<tr>
												<th scope="row">예약번호</th>
												<th scope="col">예약시각</th>
												<th scope="col">예약자</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- Add Category -->
					<div id="add_new_cat" class="modal fade" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-sm"
							role="document">
							<div class="modal-content">
								<div class="modal-body">
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h6 class="text-uppercase fw-bold mb-3">Add Category</h6>
									<form>
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<input class="form-control" type="text"
														placeholder="Category Name" />
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-primary float-end"
											data-bs-dismiss="modal">Add</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /Add Category -->

					<!-- Add Tag -->
					<div id="add_new_tag" class="modal fade" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-sm"
							role="document">
							<div class="modal-content">
								<div class="modal-body">
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h6 class="text-uppercase fw-bold mb-3">Add Tag</h6>
									<form>
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<select id="input_tags" class="form-control"
														multiple="multiple">
														<option selected="selected">Collaborator</option>
														<option selected="selected">Designer</option>
														<option selected="selected">React Developer</option>
														<option selected="selected">Promotion</option>
														<option selected="selected">Advertisement</option>
													</select>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-primary float-end"
											data-bs-dismiss="modal">Add</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Add Tag -->
				</div>
			</div>
		</div>
		<!-- /Page Body -->
	</div>
	<!-- /Main Content -->
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>

const resourceNo = ${currentResourceNo };
//console.log(resourceNo );


//reminder 스트링으로 보내기
var remindercheck = document.getElementById('flexCheckDefault');

remindercheck.addEventListener('change', function() {
 if (remindercheck.checked) {
	  remindercheck.value = 'Y';
 } else {
	  remindercheck.value = 'N';
 }
}); 


(function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        googleCalendarApiKey: '',// 여기에 구글캘린더 api키 입력하시면 됩니다.
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(info) {
        	  // 시작과 종료 날짜의 기본값을 설정합니다.
        	  var defaultStartDate = info.startStr; // 선택한 시작 날짜
        	  var defaultEndDate = info.endStr; // 선택한 종료 날짜

        	  // Date Range Picker를 초기화하거나 업데이트합니다.
        	  $('.cal-event-date-start').daterangepicker({
        	    singleDatePicker: true,
        	    timePicker: true,
        	    timePicker24Hour: true,
        	    timePickerIncrement: 60,
        	    startDate: defaultStartDate, // FullCalendar에서 선택한 시작 날짜를 기본값으로 사용합니다.
        	    locale: {
        	      format: 'YYYY/MM/DD HH:mm'
        	    }
        	  }, function(start, end, label) {
        	    // 이 콜백 함수는 사용자가 날짜를 선택할 때 호출됩니다.
        	    var startTime = start.format('HH');
        	    var endTime = end.format('HH');

        	    // 선택된 시간이 09시 이전이거나 18시 이후인 경우 시간을 조정합니다.
        	    if(startTime < 9 || endTime > 18) {
        	      start.hour(9).minute(0);
        	      end.hour(18).minute(0);
        	      $('.cal-event-date-start').data('daterangepicker').setStartDate(start);
        	      $('.cal-event-date-end').data('daterangepicker').setEndDate(end);
        	    }
        	  });

        	  // 'cal-event-date-end'에 대해 동일한 설정을 적용합니다.
        	  $('.cal-event-date-end').daterangepicker({
        	    singleDatePicker: true,
        	    timePicker: true,
        	    timePicker24Hour: true,
        	    timePickerIncrement: 60,
        	    startDate: defaultEndDate, // FullCalendar에서 선택한 종료 날짜를 기본값으로 사용합니다.
        	    locale: {
        	      format: 'YYYY/MM/DD HH:mm'
        	    }
        	  }, function(start, end, label) {
        	    var startTime = start.format('HH');
        	    var endTime = end.format('HH');

        	    if(startTime < 9 || endTime > 18) {
        	      start.hour(9).minute(0);
        	      end.hour(18).minute(0);
        	      $('.cal-event-date-start').data('daterangepicker').setStartDate(start);
        	      $('.cal-event-date-end').data('daterangepicker').setEndDate(end);
        	    }
        	  });

        	  // 캘린더에서의 선택을 해제합니다.
        	  calendar.unselect();
        	  
        	  // 선택한 날짜에 해당하는 예약 리스트를 가져오는 AJAX 요청
        	  $.ajax({
        	    url: '/schedule/selectReservationBydate', // 예약 리스트를 가져올 서버의 URL을 입력해주세요
        	    method: 'POST',
        	    contentType: 'application/json', // 전송되는 데이터의 형식을 json으로 지정
        	      data: JSON.stringify({ selectDate: defaultStartDate, resourceNo: resourceNo }),
        	    success: function(response) {
        	      // 예약 리스트를 성공적으로 가져왔을 때 처리하는 로직을 작성합니다.
        	      console.log(response); // 예약 리스트를 콘솔에 출력하거나 원하는 방식으로 화면에 표시합니다.
        	      
        	      var tbody = $('.table tbody');
        	   
        	      // 테이블의 tbody를 찾습니다.
        	      // 이전 데이터를 삭제합니다.
        	      tbody.empty();

        	      // 예약 리스트를 반복하면서 테이블에 추가합니다.
        	      for (var i = 0; i < response.length; i++) {
        	        var res = response[i];
        	        var formattedStartDate = moment(res.calStartDate).format('YYYY-MM-DD HH:mm');
        	        var formattedEndDate = moment(res.calEndDate).format('YYYY-MM-DD HH:mm');

        	        // 새로운 행(tr)을 생성합니다.
        	        var newRow = $('<tr>');

        	        // 각 열(td)에 예약 정보를 추가합니다.
        	        newRow.append('<td>' + res.calNo + '</td>');
        	        newRow.append('<td>' + formattedStartDate + " ~ " + formattedEndDate + '</td>');
        	        newRow.append('<td>' + res.myEmpName + '</td>');

        	        // 생성한 행을 tbody에 추가합니다.
        	        tbody.append(newRow);
        	      }
        	    },
        	    error: function(error) {
        	      // 예약 리스트를 가져오는 데 실패했을 때 처리하는 로직을 작성합니다.
        	      console.log(error); // 에러 메시지를 콘솔에 출력하거나 에러 처리 방식을 구현합니다.
        	    }
        	  });
        	},
        //데이터 가져오는 이벤트
    /*     eventSources:[
          {
            events: async function (info, successCallback, failureCallback) {
          const eventResult = await axios({
            method: "POST",
            url: "/eventData",
          });
          const eventData = eventResult.data;
          //이벤트에 넣을 배열 선언하기
          const eventArray = [];
          eventData.forEach((res) => {
            eventArray.push({
              title: res.title,
              start: res.start,
              end: res.end,
              backgroundColor: res.backgroundColor,
            });
          });
          successCallback(eventArray);
        
        },
          },
            {
              googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com',
              backgroundColor: 'red',
            }
        ] */
      });
      // 캘린더 랜더링
      calendar.render();
      
      
      
      
    });
  })();

//부서 선택 시 직원 표시
document.getElementById('calDept1').addEventListener('change', function() {
 var selectedDeptCode = this.value;
 
 fetch('${path}/deptemplist?deptCode=' + encodeURIComponent(selectedDeptCode))
   .then(function(response) {
     if (response.ok) {
       return response.json();
     } else {
       throw new Error('요청이 실패하였습니다.');
     }
   })
   .then(function(employeeList) {
     var employeeSelect = document.getElementById('calEmp1');
     employeeSelect.innerHTML = ''; // 기존의 옵션 초기화
     
     employeeList.forEach(function(employee) {
       var option = document.createElement('option');
       option.value = employee.EMP_NO;
       option.textContent = employee.name;
       employeeSelect.appendChild(option);
     });
   })
   .catch(function(error) {
     console.error(error);
   });
}); 

//부서 직원 추가
const adddelFunction=(function(adddelFunction){
	let self = {};
  let count = 2;
  self.addFile=()=>{
     if(count<=5){
        const fileForm = $(".inviteContainer").eq(0).clone(true);
	     fileForm.removeClass("inviteContainer_1");
        fileForm.addClass("inviteContainer_"+count);
           const deptId = "calDept" + count;
           const empId = "calEmp" + count;
           
           fileForm.find("#calDept1").attr("id", deptId).val("").change(); // 부서 선택 시 직원 표시
           fileForm.find("#calEmp1").attr("id", empId).val(""); // 초기화
           
           // 부서 선택 시 해당 부서의 직원 표시
           fileForm.find("#" + deptId).on("change", function() {
             var selectedDeptCode = $(this).val();
             
             fetch('${path}/deptemplist?deptCode=' + encodeURIComponent(selectedDeptCode))
               .then(function(response) {
                 if (response.ok) {
                   return response.json();
                 } else {
                   throw new Error('요청이 실패하였습니다.');
                 }
               })
               .then(function(employeeList) {
                 var employeeSelect = document.getElementById(empId);
           
                 employeeSelect.innerHTML = ''; // 기존의 옵션 초기화
           
                 employeeList.forEach(function(employee) {
                   var option = document.createElement('option');
                   option.value = employee.no;
                   option.textContent = employee.name;
                   employeeSelect.appendChild(option);
                 });
               })
               .catch(function(error) {
                 console.error(error);
               });
           });
           
           $("div[name=someContainer]").before(fileForm);
           count++;
         } else {
           alert("공유인원은 5명까지 가능합니다.");
         }
  };
  self.delFile=(e)=>{
     if(count!=2){
		  $(e).parent().remove();
		  $(".inviteContainer").each(function(index, item){
			  item.removeAttribute('class');
			  $(item).addClass('inviteContainer').addClass('inviteContainer_'+(index+1));
		  });
   	  //$("div[name=someContainer]").prev().remove();
        count--;
     }
  };

	/**
	 * REGIST
	 */
	if (!adddelFunction) {
		window.adddelFunction = adddelFunction = {};
	}
	adddelFunction.util = self;
})();


</script>
<script src="${path}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${path}/resources/vendors/daterangepicker/daterangepicker.js"></script>
<script src="${path}/resources/js/daterangepicker-data.js"></script>
