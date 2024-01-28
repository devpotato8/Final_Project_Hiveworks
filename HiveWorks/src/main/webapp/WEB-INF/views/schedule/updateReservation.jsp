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
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
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
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item active"><a class="nav-link" href="${path }/schedule/reservationlistbyno"> <span class="nav-icon-wrap"><span
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
													<a class="nav-link link-badge-right" href="${path }/schedule/reserveResource?resourceNo=${res.resourceNo}">
														<span class="nav-link-text">${res.resourceName}</span>
													</a>
												</li>
											</c:forEach>
										</c:if>
									</ul>
						</div>
						<div class="menu-gap"></div>
						<c:if test="${loginEmp.aut_code == 'AUT001'}">
						<div class="nav-header">
							<span>관리자</span>
						</div>
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="${path }/schedule/reservationlist"> <span class="nav-icon-wrap"><span
											class="feather-icon"><i data-feather="flag"></i></span></span> <span
										class="nav-link-text">전체 예약/대여 조회</span>
								</a></li>

								<li class="nav-item"><a class="nav-link"
									href="${path}/schedule/resourcelist"> <span class="nav-icon-wrap"><span
											class="feather-icon"><i data-feather="grid"></i></span></span> <span
										class="nav-link-text">전사자산 목록</span>
								</a></li>
							</ul>
						</div>
					</c:if>	
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
								title="" data-bs-original-title="Refresh" id="refreshButton"><span class="icon"><span
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
							    <div id='calendar' style="width: 700px; padding:20px"></div>
							  </div>
								<div style="width: 50%; display: block;">
									<form action="${path}/schedule/updateReservationEnd"
										method="POST">
										<input type="hidden" name="empNo" value="${loginEmp.emp_no}"/>
										<input type="hidden" name="code" value="${currentR.calCode}"/>
										<input type="hidden" name="resourceNo" value="${currentResourceNo }"/>
										<input type="hidden" name="backgroundColor" value="#87f542"/>
										<input type="hidden" name="calNo" value="${currentCalNo }"/>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">시작일자</label> <input
														class="form-control cal-event-date-start" name="upstart"
														type="text" />
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">종료일자</label> <input
														class="form-control cal-event-date-end" name="upend"
														type="text" />
												</div>
											</div>
										</div>

									<div class="form-group">
							<div class="d-flex flex-wrap" >
								<button type="button" 
									id="addBtnRe" class="btn btn-light btn-floating;">일정
									공유 추가</button>
								<div id="shareListJob" class="row gx-3">


								</div>
							</div>
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
				</div>
			</div>
		</div>
		<!-- /Page Body -->
	</div>
	<!-- /Main Content -->
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
//model 값 js 배열로 바꿔서 사용
const current = $('${current}');
const currentRJson = JSON.parse('${currentRJson}');
const resourceNo = ${currentResourceNo };
const invitationEmpList = currentRJson.invitationEmpList;

var deptCodes = [];
var deptNames = [];

<c:forEach items="${deptList }" var="dept">
    deptCodes.push("${dept.deptCode}");
    deptNames.push("${dept.deptName}");
</c:forEach>

var empDeptCodes = [];
var empNames = [];
var empNos = []

<c:forEach items="${empList }" var="emp">
empDeptCodes.push("${emp.dept_code}");
empNames.push("${emp.emp_name}");
empNos.push("${emp.emp_no}");
</c:forEach>

var contextPath = "<c:out value='${path}'/>";


//reminder 스트링으로 보내기
/* var remindercheck = document.getElementById('flexCheckDefault');

remindercheck.addEventListener('change', function() {
 if (remindercheck.checked) {
	  remindercheck.value = 'Y';
 } else {
	  remindercheck.value = 'N';
 }
});  */


//페이지 새로고침
$(document).ready(function() {
    $("#refreshButton").click(function(e) {
        e.preventDefault(); // 기본 클릭 이벤트를 방지함
        location.reload(); // 페이지를 새로고침함
    });
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
        select: function(selectionInfo) {
        	var currentDate = new Date();
			var currentHours = '09'; // 시간을 두 자리 숫자로 설정
			var currentMinutes = '00'; // 항상 00으로 설정

			var startTime = selectionInfo.startStr + ' ' + currentHours + ':' + currentMinutes;

			// 종료일자에서 하루를 빼기
			var endDate = new Date(selectionInfo.endStr);
			endDate.setDate(endDate.getDate() - 1);
			var endYear = endDate.getFullYear();
			var endMonth = ('0' + (endDate.getMonth() + 1)).slice(-2);
			var endDay = ('0' + endDate.getDate()).slice(-2);
			var endTime = endYear + '-' + endMonth + '-' + endDay + ' ' + currentHours + ':' + currentMinutes;

			$('.cal-event-date-start').val(startTime);
			$('.cal-event-date-end').val(endTime);

			// 달력도 해당 날짜 시각으로 바꾸는 코드 추가
			$('.cal-event-date-start').daterangepicker({
				timePicker: true,
				singleDatePicker: true,
				timePicker24Hour: true,
				timePickerIncrement: 1,
				startDate: startTime,
				locale: {
					format: 'YYYY/MM/DD HH:mm'
				}
			}).on('show.daterangepicker', function(ev, picker) {
	    	    $('.hourselect').empty();
	    	    for (var i = 9; i <= 18; i++) {
	    	        $('.hourselect').append($('<option />').val(i).text(i));
	    	    }
	    	});

			$('.cal-event-date-end').daterangepicker({
				timePicker: true,
				singleDatePicker: true,
				timePicker24Hour: true,
				timePickerIncrement: 1,
				startDate: endTime,
				locale: {
					format: 'YYYY/MM/DD HH:mm'
				}
			}).on('show.daterangepicker', function(ev, picker) {
	    	    $('.hourselect').empty();
	    	    for (var i = 9; i <= 18; i++) {
	    	        $('.hourselect').append($('<option />').val(i).text(i));
	    	    }
	    	});
			

        	  // 캘린더에서의 선택을 해제합니다.
        	  calendar.unselect();
        	  
        	  // 선택한 날짜에 해당하는 예약 리스트를 가져오는 AJAX 요청
        	  $.ajax({
        	    url: contextPath+'/schedule/selectReservationBydate', // 예약 리스트를 가져올 서버의 URL을 입력해주세요
        	    method: 'POST',
        	    contentType: 'application/json', // 전송되는 데이터의 형식을 json으로 지정
        	      data: JSON.stringify({ selectDate: startTime, resourceNo: resourceNo }),
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
        	events: function(info, successCallback, failureCallback) { // ajax 처리로 데이터를 로딩 시킨다. 
				$.ajax({
					url: contextPath+'/schedule/selectReserveByresource',
					type: "POST",
					dataType: "JSON",
					data: JSON.stringify({ resourceNo: resourceNo }),
					contentType: "application/json",
					traditional: true,
					async: false, //동기
					success: function(data) {

						var events = data.map(function(event, i) {
							return {
								id: event.calCode,
								title: event.calSubject,
								start: event.calStartDate,
								end: event.calEndDate,
								backgroundColor: event.calColor,
								extendedProps: {
									content: event.calContent,   // 추가
									myEmpNo: event.myEmpNo,// 추가
									myDeptCode: event.myDeptCode,
									invitationEmpList: event.invitationEmpList,
									calCode: event.calCode,//추가
									important: event.calImportYn,
									status: event.calStatus,
									reminder: event.reminderYn,
									allday: event.calAlldayYn,
									calNo: event.calNo,
									
								}

							};
						});
						successCallback(events); // 로드된 이벤트 데이터를 콜백으로 전달
						console.log(events);


					},
					error: function(request, status, error) {
						alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
						console.log("code = " + request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			}
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
  
  
$(document).ready(function() {
	  // 서버에서 전달받은 날짜 값을 JavaScript Date 객체로 변환
	  const calStartDate = new Date('${currentR.calStartDate}'); 
	  console.log(calStartDate);

	  // DateRangePicker 초기화
	  $('input[name="upstart"]').daterangepicker({
	    timePicker: true,
	    singleDatePicker: true,
	    timePicker24Hour: true,
	    timePickerIncrement: 1,
	    startDate: calStartDate,
	    locale: {
	      format: 'YYYY/MM/DD HH:mm'
	    }
	  }).on('show.daterangepicker', function(ev, picker) {
		    $('.hourselect').empty();
		    for (var i = 9; i <= 18; i++) {
		        $('.hourselect').append($('<option />').val(i).text(i));
		    }
		});
	  
	  $('input[name="upstart"]').attr('readonly', 'readonly');

	  // 서버에서 전달받은 종료 날짜 값을 JavaScript Date 객체로 변환
	  const calEndDate = new Date('${currentR.calEndDate}'); 

	  // DateRangePicker 초기화
	  $('input[name="upend"]').daterangepicker({
	    timePicker: true,
	    singleDatePicker: true,
	    timePicker24Hour: true,
	    timePickerIncrement: 1,
	    startDate: calEndDate,
	    locale: {
	      format: 'YYYY/MM/DD HH:mm'
	    }
	  }).on('show.daterangepicker', function(ev, picker) {
		    $('.hourselect').empty();
		    for (var i = 9; i <= 18; i++) {
		        $('.hourselect').append($('<option />').val(i).text(i));
		    }
		});
	  
	  $('input[name="upend"]').attr('readonly', 'readonly');
	});  

const invitationEmpListLength = invitationEmpList.length;
let removedItemsCount = 0; // 삭제된 요소의 수를 추적하는 변수
shareProjectCount = 2;

	if (invitationEmpList.length > 0) {
		
		
		for (var i = 0; i < invitationEmpListLength; i++) {
		    var YourEmpNo = invitationEmpList[i].yourEmpNo;
		    var YourEmpName = invitationEmpList[i].yourEmpName;
		    var YourDeptName = invitationEmpList[i].yourDeptName;
		    var YourDeptCode = invitationEmpList[i].yourDeptCode;
		    var InviUseYn = invitationEmpList[i].inviUseYn;
		    
		    if(InviUseYn == 'Y'){
		    
		    // 다시 생성
		    let reInviContainer = document.createElement('div');
		    reInviContainer.className = 'reinvicontainer' + (i + 1);
		    reInviContainer.style.display = 'flex';
		    reInviContainer.style.paddingTop = '5px';
		    reInviContainer.style.paddingBottom = '5px';
	
		    let deptContainer = document.createElement('div');
		    deptContainer.className = 'col-sm-5';
		    let empContainer = document.createElement('div');
		    empContainer.className = 'col-sm-5';
	
		    let deptSelect = document.createElement('select');
		    deptSelect.className = 'form-select me-3';
		    deptSelect.name = 'recalDept';
		    deptSelect.id = 'recalDept' + (i + 1);
	
		    let empSelect = document.createElement('select');
		    empSelect.className = 'form-select me-3';
		    empSelect.name = 'recalEmp';
		    empSelect.id = 'recalEmp' + (i + 1);
	
		    deptContainer.appendChild(deptSelect);
		    empContainer.appendChild(empSelect);
	
		    reInviContainer.appendChild(deptContainer);
		    reInviContainer.appendChild(empContainer);
	
		    let someContainer2 = document.getElementById('shareListJob');
		    someContainer2.appendChild(reInviContainer);
	
		    // 추가된 부분: 삭제 버튼 생성 및 이벤트 핸들러 연결
		    let delButton = document.createElement('button');
		    delButton.type = 'button';
		    delButton.textContent = '삭제';
		    delButton.addEventListener('click', function () {
		        // 클릭된 삭제 버튼의 부모 요소인 컨테이너를 삭제
		        reInviContainer.remove();
		        removedItemsCount++;
		        count = invitationEmpListLength - removedItemsCount + 1; // count 업데이트
		    });
	
		    reInviContainer.appendChild(delButton);
	
		    // 나머지 코드는 그대로 유지
	
		    for (var j = 0; j < deptCodes.length; j++) {
		        let deptOption = document.createElement('option');
		        deptOption.value = deptCodes[j];
		        deptOption.text = deptNames[j];
		        deptSelect.appendChild(deptOption);
		    }
	
		    for (var j = 0; j < deptSelect.options.length; j++) {
		        console.log("Option value: " + deptSelect.options[j].value);
		        console.log("YourDeptCode: " + YourDeptCode);
		        if (deptSelect.options[j].value == YourDeptCode) {
		            deptSelect.options[j].selected = true;
		            break;
		        }
		    }
		    
		    // 부서 선택 시 이벤트 핸들러 함수
			function handleDeptSelect() {
				// 선택된 부서의 인덱스를 가져옵니다.
				var selectedDeptIndex = deptSelect.selectedIndex;
	
				// 선택된 부서에 해당하는 사원 이름과 사원 번호를 담을 배열을 초기화합니다.
				var matchingEmpNames = [];
				var matchingEmpNos = [];
	
				// 선택된 부서의 코드를 가져옵니다.
				var selectedDeptCode = deptCodes[selectedDeptIndex];
	
				// 선택된 부서의 코드와 일치하는 사원을 찾아서 배열에 추가합니다.
				for (var k = 0; k < empDeptCodes.length; k++) {
					if (empDeptCodes[k] === selectedDeptCode) {
						matchingEmpNames.push(empNames[k]);
						matchingEmpNos.push(empNos[k]);
					}
				}
	
				// 직원 선택(select) 요소를 초기화합니다.
				empSelect.innerHTML = "";
	
				// 매칭된 직원 이름과 사원 번호를 새로운 옵션으로 추가합니다.
				for (var l = 0; l < matchingEmpNames.length; l++) {
					var empOption = document.createElement("option");
					empOption.value = matchingEmpNos[l];
					empOption.text = matchingEmpNames[l];
					empSelect.appendChild(empOption);
				}
	
				for (var l = 0; l < empSelect.options.length; l++) {
					if (empSelect.options[l].value == YourEmpNo) {
						empSelect.options[l].selected = true;
						break;
					}
				}
			}
	
	
		    handleDeptSelect();
	
		    deptSelect.addEventListener("change", handleDeptSelect);
		    }
		}
	}


//수정 부서 직원 추가 
function createContainer(index) {
    let reInviContainer = document.createElement('div');
    reInviContainer.className = 'reinvicontainer' + index;
    reInviContainer.style.display = 'flex';
    reInviContainer.style.paddingTop = '5px';
    reInviContainer.style.paddingBottom = '5px';

    let deptContainer = document.createElement('div');
    deptContainer.className = 'col-sm-5';
    let empContainer = document.createElement('div');
    empContainer.className = 'col-sm-5';

    let deptSelect = document.createElement('select');
    deptSelect.className = 'form-select me-3';
    deptSelect.name = 'recalDept';
    deptSelect.id = 'recalDept' + index;

    let empSelect = document.createElement('select');
    empSelect.className = 'form-select me-3';
    empSelect.name = 'recalEmp';
    empSelect.id = 'recalEmp' + index;

    for (var j = 0; j < deptCodes.length; j++) {
        let deptOption = document.createElement('option');
        deptOption.value = deptCodes[j];
        deptOption.text = deptNames[j];
        deptSelect.appendChild(deptOption);
    }
    
    deptSelect.addEventListener("change", function(){
		var selectedDeptIndex = deptSelect.selectedIndex;

		// 선택된 부서에 해당하는 사원 이름과 사원 번호를 담을 배열을 초기화합니다.
		var matchingEmpNames = [];
		var matchingEmpNos = [];

		// 선택된 부서의 코드를 가져옵니다.
		var selectedDeptCode = deptCodes[selectedDeptIndex];

		// 선택된 부서의 코드와 일치하는 사원을 찾아서 배열에 추가합니다.
		for (var k = 0; k < empDeptCodes.length; k++) {
			if (empDeptCodes[k] === selectedDeptCode) {
				matchingEmpNames.push(empNames[k]);
				matchingEmpNos.push(empNos[k]);
			}
		}

		// 직원 선택(select) 요소를 초기화합니다.
		empSelect.innerHTML = "";

		// 매칭된 직원 이름과 사원 번호를 새로운 옵션으로 추가합니다.
		for (var l = 0; l < matchingEmpNames.length; l++) {
			var empOption = document.createElement("option");
			empOption.value = matchingEmpNos[l];
			empOption.text = matchingEmpNames[l];
			empSelect.appendChild(empOption);
		}

	});

    var selectedDeptIndex = deptSelect.selectedIndex;
    var selectedDeptCode = deptCodes[selectedDeptIndex];

    var matchingEmpNames = [];
    var matchingEmpNos = [];

    for (var k = 0; k < empDeptCodes.length; k++) {
        if (empDeptCodes[k] === selectedDeptCode) {
            matchingEmpNames.push(empNames[k]);
            matchingEmpNos.push(empNos[k]);
        }
    }

    empSelect.innerHTML = "";

    for (var l = 0; l < matchingEmpNames.length; l++) {
        var empOption = document.createElement("option");
        empOption.value = matchingEmpNos[l];
        empOption.text = matchingEmpNames[l];
        empSelect.appendChild(empOption);
    }

    deptContainer.appendChild(deptSelect);
    empContainer.appendChild(empSelect);

    reInviContainer.appendChild(deptContainer);
    reInviContainer.appendChild(empContainer);

    // 추가된 부분: 삭제 버튼 생성 및 이벤트 핸들러 연결
    let delButton = document.createElement('button');
    delButton.type = 'button';
    delButton.textContent = '삭제';
    delButton.addEventListener('click', function () {
        // 클릭된 삭제 버튼의 부모 요소인 컨테이너를 삭제
        reInviContainer.remove();
        shareProjectCount--;
    });

    reInviContainer.appendChild(delButton);

    return reInviContainer;
}

function updateCount() {
    shareProjectCount = document.querySelectorAll("[class^='reinvicontainer']").length + 1;
}

$('#addBtnRe').on('click', function () {
    if (shareProjectCount <= 5) {
        let reInviContainer = createContainer(shareProjectCount);

        let someContainer2 = document.querySelector('#shareListJob');
        someContainer2.appendChild(reInviContainer);

        shareProjectCount++;
    } else {
        alert("공유인원은 5명까지 가능합니다.");
    }
    updateCount(); // count를 업데이트하는 함수 호출
});


</script>
<script src="${path}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${path}/resources/vendors/daterangepicker/daterangepicker.js"></script>
<script src="${path}/resources/js/daterangepicker-data.js"></script>
