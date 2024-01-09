<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Sweetalert2 CSS -->
<link
	href="${path}/resources/vendors/@sweetalert2/theme-bootstrap-4/bootstrap-4.min.css"
	rel="stylesheet" type="text/css">

<!-- Calendar CSS -->
<link href="${path}/resources/vendors/fullcalendar/main.min.css"
	rel="stylesheet" type="text/css" />

<!-- Daterangepicker CSS -->
<link
	href="${path}/resources/vendors/daterangepicker/daterangepicker.css"
	rel="stylesheet" type="text/css" />

<!-- CSS -->
<link href="${path}/resources/css/style.css" rel="stylesheet"
	type="text/css">

<link rel="shortcut icon" href="favicon.ico">
<!-- 여기서 부터 시작 -->
<!-- Calendar Drawer -->
<!-- 조회하는 모달 -->
<div class="hk-drawer calendar-drawer drawer-right">
	<div>
		<div class="drawer-header">
			<div class="drawer-header-action">
				<a href="#" id="edit_event"
					class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover"><span
					class="icon"><span class="feather-icon"><i
							data-feather="edit-2"></i></span></span></a> <a href="#" id="del_event"
					class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover"><span
					class="icon"><span class="feather-icon"><i
							data-feather="trash-2"></i></span></span></a>
				<button type="button" class="drawer-close btn-close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
		</div>
		<div class="drawer-body">
			<div data-simplebar class="nicescroll-bar">
				<div class="drawer-content-wrap">
					<div class="event-head mb-4">
						<span
							class="badge badge-violet badge-indicator badge-indicator-xl flex-shrink-0 me-2"></span>
						<div>
							<div class="event-name">Jampack Team Meet</div>
							<span class="cal-type">내일정</span>
						</div>
					</div>
					<ul class="event-detail">
						<li><span class="ev-icon-wrap"><span
								class="feather-icon"><i data-feather="calendar"></i></span></span><span
							class="event-start-date">Aug 18,2020 - Aug 19, 2020</span></li>
						<li><span class="ev-icon-wrap"><span
								class="feather-icon"><i data-feather="calendar"></i></span></span><span
							class="event-end-date">Aug 18,2020 - Aug 19, 2020</span></li>
						<li><span class="ev-icon-wrap"><span
								class="feather-icon"><i data-feather="user-plus"></i></span></span>
							<div class="d-flex flex-wrap">
								<div class="chip chip-primary user-chip mb-2 me-2">
									<span> <span class="avatar"> <img
											src="dist/img/avatar11.jpg" alt="user" class="avatar-img">
									</span> <span class="chip-text">Morgan</span>
									</span>
								</div>
							</div></li>
						<li><span class="ev-icon-wrap"><span
								class="feather-icon"><i data-feather="menu"></i></span></span><span
							class="event-content">이벤트입니다</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정하는 모달 -->
	<div class="d-none">
		<div class="drawer-header">
			<div class="drawer-header-action">
				<button type="button" class="drawer-edit-close btn-close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
		</div>
		<div class="drawer-body">
			<div data-simplebar class="nicescroll-bar">
				<div class="drawer-content-wrap">
					<form>
						<div class="event-head mb-4">
							<span
								class="badge badge-violet badge-indicator badge-indicator-xl flex-shrink-0 me-2"></span>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="event-name" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-affix-wrapper"> <select
									class="form-select cal-event-code"
									aria-label="Default select example">
										<option selected value="CAL001">내일정</option>
										<option value="CAL002">부서일정</option>
										<option value="CAL003">전사일정</option>
								</select>
								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-affix-wrapper"> <span
									class="input-prefix"><span class="feather-icon"><i
											data-feather="calendar"></i></span></span> <input
									class="form-control cal-event-date-start" name="single-date"
									type="text">

								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-affix-wrapper"> <span
									class="input-prefix"><span class="feather-icon"><i
											data-feather="calendar"></i></span></span> <input
									class="form-control cal-event-date-end" name="single-date"
									type="text">

								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="d-flex flex-wrap">
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-allday"
											type="checkbox" id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault"> 종일여부</label>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-reminder"
											type="checkbox" value="" id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault"> 알림여부
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="d-flex flex-wrap">
								<div
									class="chip chip-primary chip-dismissable user-chip mb-2 me-2">
									<img src="dist/img/avatar11.jpg" alt="user" class="avatar-img">
									<input class="form-control" type="text" />
									<button type="button" class="btn btn-light btn-floating">추가</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control event-content" rows="4">Annual meeting</textarea>
						</div>
						<div class="drawer-footer d-flex justify-content-end">
							<button class="btn btn-secondary drawer-edit-close me-2">취소</button>
							<button type="submit" class="btn btn-primary drawer-edit-close">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Calendar Drawer -->

<!-- Main Content -->
<div class="hk-pg-wrapper pb-0">
	<!-- Page Body -->
	<div class="hk-pg-body py-0">
		<div class="calendarapp-wrap">
			<nav class="calendarapp-sidebar">
				<div data-simplebar class="nicescroll-bar">
					<div class="menu-content-wrap">
						<button class="btn btn-primary btn-rounded btn-block mb-4"
							data-bs-toggle="modal" data-bs-target="#create_new_event">일정등록</button>
						<!-- <div class="dropdown-menu">
									<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#create_new_event"><span class="feather-icon dropdown-icon"><i data-feather="calendar"></i></span><span>새로운 일정 등록하기</span></a>
									 <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#set_new_reminder"><span class="feather-icon dropdown-icon"><i data-feather="bell"></i></span><span>Set a Reminder</span></a>
								</div> -->
						<div class="text-center mt-4">
							<div id="inline_calendar" class="d-inline-block">
								<input class="form-control invisible position-absolute"
									type="text" name="calendar" value="" />
							</div>
						</div>
						<div class="separator separator-light"></div>
						<div class="categories-wrap">
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="customChecksc1"> <label class="form-check-label"
									for="customChecksc1">전체일정보기</label>
							</div>
							<div class="separator separator-light"></div>
							<div
								class="d-flex align-items-center justify-content-between mb-2">
								<div class="title-sm text-primary mb-0">내 캘린더</div>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="customChecksc2"> <label class="form-check-label"
									for="customChecksc2" style="padding-right: 116px">내일정</label> <a
									href="#" class="btn btn-xs btn-icon btn-rounded btn-light"
									data-bs-toggle="modal" data-bs-target="#add_new_cat"><span
									class="icon" data-bs-toggle="tooltip" data-bs-placement="top"
									title="" data-bs-original-title="내일정 공유"><span
										class="feather-icon"><i
											data-feather="arrow-right-circle"></i></span></span></a>

							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="customChecksc3"> <label class="form-check-label"
									for="customChecksc3">내부서일정</label>
							</div>
							<div
								class="d-flex align-items-center justify-content-between mb-2">
								<div class="title-sm text-primary mb-0">관심캘린더</div>
								<a href="#" class="btn btn-xs btn-icon btn-rounded btn-light"
									data-bs-toggle="modal" data-bs-target="#add_fav_board"><span
									class="icon" data-bs-toggle="tooltip" data-bs-placement="top"
									title="" data-bs-original-title="Add Board"><span
										class="feather-icon"><i data-feather="plus"></i></span></span></a>
							</div>
							<div class="menu-group">
								<ul class="nav nav-light navbar-nav flex-column">
									<li class="nav-item">
										<div>
											<div class="media d-flex align-items-center">
												<div class="media-head me-2">
													<div class="avatar avatar-xs avatar-primary avatar-rounded">
														<span class="initial-wrap">J</span>
													</div>
												</div>
												<div class="media-body">
													<div>
														<div class="name">Jampack</div>
													</div>
												</div>
											</div>
											<div class="ms-auto">
												<button
													class="btn btn-sm btn-icon btn-rounded btn-flush-light flush-soft-hover">
													<span class="icon"><span class="feather-icon"><i
															data-feather="lock"></i></span></span>
												</button>
												<button
													class="btn btn-sm btn-icon btn-rounded btn-flush-light flush-soft-hover">
													<span class="icon"><span class="feather-icon"><i
															data-feather="more-vertical"></i></span></span>
												</button>
											</div>
										</div>
									</li>
									<li class="nav-item">
										<div>
											<div class="media d-flex align-items-center">
												<div class="media-head me-2">
													<div class="avatar avatar-xs avatar-pink avatar-rounded">
														<span class="initial-wrap">H</span>
													</div>
												</div>
												<div class="media-body">
													<div>
														<div class="name">Hencework</div>
													</div>
												</div>
											</div>
											<div class="ms-auto">
												<button
													class="btn btn-sm btn-icon btn-rounded btn-flush-light flush-soft-hover">
													<span class="icon"><span class="feather-icon"><i
															data-feather="globe"></i></span></span>
												</button>
												<button
													class="btn btn-sm btn-icon btn-rounded btn-flush-light flush-soft-hover">
													<span class="icon"><span class="feather-icon"><i
															data-feather="more-vertical"></i></span></span>
												</button>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="separator separator-light"></div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="customChecksc4"> <label class="form-check-label"
									for="customChecksc4">중요일정</label>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="customChecksc4"> <label class="form-check-label"
									for="customChecksc4">전사일정</label>
							</div>
						</div>
					</div>
				</div>

			</nav>
			<div class="calendarapp-content">
				<div id="calendar" class="w-100"></div>
			</div>

			<!-- New Event -->
			<div id="create_new_event" class="modal fade" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="btn-close" id="closeBtn"
								data-bs-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h5 class="mb-4">일정등록</h5>
							<form>
								<input type="hidden" name="empNo" id="cal-event-empno"
									value="1234" />
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-control  cal-event-name" type="text"
											placeholder="일정명을 입력해주세요" />
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<select class="form-select cal-event-code"
											aria-label="Default select example">
											<option selected value="CAL001">내일정</option>
											<option value="CAL002">부서일정</option>
											<option value="CAL003">전사일정</option>
										</select>

									</div>
								</div>
								
								
								<div class="row gx-3">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">시작일자</label> <input
												class="form-control cal-event-date-start" id="startDate"
												name="single-date" type="text" />
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">종료일자</label> <input
												class="form-control cal-event-date-end" id="endDate"
												name="single-date" type="text" />
										</div>
									</div>
								</div>
								<div class="row gx-3" style="display:flex">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-allday"
											id="alldaycheck" type="checkbox" id="flexCheckDefault">
										<label class="form-check-label" for="flexCheckDefault">
											종일여부</label>
									</div>
									<div class="row gx-3">
										<div class="col-sm-3">
											<span>일정 공유</span>
										</div>
										<div class="col-sm-5">
											<div class="form-group">
												<button type="button" id="addBtn" class="btn btn-light btn-floating">추가</button>
												<button type="button" id="delBtn" class="btn btn-light btn-floating">삭제</button>
										</div>
								</div>
								</div>
									<div class="row gx-3">
									<div id="invitecontainer" style="display:flex">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="form-label">부서</label>
												<div class="d-flex">
													<select class="form-select me-3" name="calDept"
														id="calDept">
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
													<select class="form-select me-3" name="calEmp" id="calEmp">
														<option value=""></option>
													</select>
												</div>
											</div>
										</div>
										</div>
										
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<div class="form-label-group">
											<label>일정 내용</label> <small class="text-muted">200</small>
										</div>
										<textarea class="form-control cal-event-content" rows="3"></textarea>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-reminder"
											type="checkbox" value="" id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault"> 알림여부
										</label>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer align-items-center">
							<button id="cancelBtn" type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button id="add_event" type="button"
								class="btn btn-primary fc-addEventButton-button"
								data-bs-dismiss="modal">등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /New Event -->

			<!-- short Event -->
			<div id="create_short_event" class="modal fade" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h5 class="mb-4">일정등록</h5>
							<form>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-control  cal-event-name" type="text"
											placeholder="일정명을 입력해주세요" />
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<select class="form-select"
											aria-label="Default select example">
											<option selected>내일정</option>
											<option value="1">부서일정</option>
											<option value="2">전사일정</option>
										</select>

									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">Start Date</label> <input
												class="form-control cal-event-date-start"
												name="single-date-pick" type="text" />
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">Start Time</label> <input
												class="form-control input-single-timepicker"
												name="input-timepicker" type="text" />
										</div>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">End Date</label> <input
												class="form-control cal-event-date-end"
												name="single-date-pick" type="text" />
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="form-label">End Time</label> <input
											class="form-control input-single-timepicker" type="text" />
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault"> 종일 </label>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12">
										<label class="form-label">장소</label>
										<div class="form-group">
											<input class="form-control" type="text" />
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer align-items-center">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button id="add_event" type="button"
								class="btn btn-primary fc-addEventButton-button"
								data-bs-dismiss="modal">등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /New Event -->
		</div>
	</div>
	<!-- /Page Body -->
</div>
<!-- /Main Content -->
<!-- /Wrapper -->
<script>
	$('#alldaycheck').on(
			'click',
			function() {
				console.log(this);
				if ($(this).is(':checked')) {
					console.log('종일여부 체크됨');
					var clickedDate = $('#startDate').data(
							'daterangepicker').startDate;
				
					clickedDate.set({
						hour : 0,
						minute : 0,
						second : 0,
						millisecond : 0
					});
					$('#startDate').data('daterangepicker')
							.setStartDate(clickedDate);
					
					
					
					clickedDate = $('#endDate').data(
							'daterangepicker').startDate;
					clickedDate.set({
						hour : 23,
						minute : 59,
						second : 59,
						millisecond : 999
					});
					

					$('#endDate').data('daterangepicker')
							.setEndDate(clickedDate);
					
				} else {
					console.log('종일 체크 안됨');
					var clickedDate = $('#startDate').data(
							'daterangepicker').startDate;
					clickedDate.set({
						hour : 0,
						minute : 0,
						second : 0,
						millisecond : 0
					});
					$('#startDate').data('daterangepicker')
							.setStartDate(clickedDate);

					clickedDate = $('#endDate').data(
							'daterangepicker').startDate;
					clickedDate.set({
						hour : 0,
						minute : 0,
						second : 0,
						millisecond : 0
					});
					$('#endDate').data('daterangepicker')
							.setEndDate(clickedDate);
				}
			});

	 document.querySelector('#closeBtn').addEventListener('click', function() {
		resetForm();
	 });
	

	// 취소 버튼 클릭 이벤트 처리
	document.querySelector('#cancelBtn').addEventListener('click', function() {
		resetForm();
	});

	// 값 초기화 함수
	function resetForm() {
		document.querySelector('.cal-event-name').value = '';
		document.querySelector('.cal-event-code').selectedIndex = "CAL001";
		document.querySelector('.cal-event-date-start').value = getCurrentDateTime();
		document.querySelector('.cal-event-date-end').value = getCurrentDateTime();
		document.getElementById('alldaycheck').checked = false;
		document.querySelector('.cal-event-content').value = '';
		document.getElementById('flexCheckDefault').checked = false;
	}

	// 현재 날짜와 시간을 가져오는 함수
	function getCurrentDateTime() {
		var now = new Date();
		var year = now.getFullYear();
		var month = ('0' + (now.getMonth() + 1)).slice(-2);
		var day = ('0' + now.getDate()).slice(-2);
		var hours = ('0' + now.getHours()).slice(-2);
		var minutes = ('0' + now.getMinutes()).slice(-2);
		var seconds = ('0' + now.getSeconds()).slice(-2);
		return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes
				+ ':' + seconds;
	};
	
	// 부서 선택 시 직원 표시
document.getElementById('calDept').addEventListener('change', function() {
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
      var employeeSelect = document.getElementById('calEmp');
      employeeSelect.innerHTML = ''; // 기존의 옵션 초기화
      
      employeeList.forEach(function(employee) {
        var option = document.createElement('option');
        option.value = employee.id;
        option.textContent = employee.name;
        employeeSelect.appendChild(option);
      });
    })
    .catch(function(error) {
      console.error(error);
    });
});
	
//추가 버튼 클릭 시 invitecontainer 복제
document.getElementById("addBtn").addEventListener("click", function() {
  var inviteContainer = document.getElementById("invitecontainer");
  var clonedInviteContainer = inviteContainer.cloneNode(true);

  // calDept 요소의 id 속성에 1씩 더하기
  var calDept = clonedInviteContainer.querySelector(".form-select[name='calDept']");
  var calDeptId = parseInt(calDept.getAttribute("id").replace("calDept", "")) + 1;
  calDept.setAttribute("id", "calDept" + calDeptId);

  // calEmp 요소의 id 속성에 1씩 더하기
  var calEmp = clonedInviteContainer.querySelector(".form-select[name='calEmp']");
  var calEmpId = parseInt(calEmp.getAttribute("id").replace("calEmp", "")) + 1;
  calEmp.setAttribute("id", "calEmp" + calEmpId);

  // 삭제 버튼 클릭 시 해당 invitecontainer 삭제
  var deleteBtn = clonedInviteContainer.querySelector(".deleteBtn");
  deleteBtn.addEventListener("click", function() {
    clonedInviteContainer.parentNode.removeChild(clonedInviteContainer);
  });

  inviteContainer.parentNode.appendChild(clonedInviteContainer);
});	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

<!-- Bootstrap Colorpicker JavaScript -->
<script src="${path}/resources/js/color-picker-data.js"></script>

<!-- Fullcalendar JS -->
<script src="${path}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${path}/resources/vendors/fullcalendar/index.global.min.js"></script>
<script
	src="${path}/resources/vendors/@fullcalendar/bootstrap5/index.global.min.js"></script>

<script
	src="${path}/resources/vendors/daterangepicker/daterangepicker.js"></script>
<script src="${path}/resources/js/daterangepicker-data.js"></script>
<script
	src="${path}/resources/vendors/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${path}/resources/js/fullcalendar-init.js"></script>

<!-- Bootstrap Notify JS -->
<script src="${path}/resources/js/bootstrap-notify.min.js"></script>

