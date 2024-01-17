<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- 여기서 부터 시작 -->
<!-- Calendar Drawer -->
<!-- Modal -->
<%-- <div class="modal fade" id="add_fav_board" tabindex="-1" aria-labelledby="add_fav_boardLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="add_fav_boardLabel">캘린더 구독</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="inviteContainer" style="display: flex">
          <div class="col-sm-4">
            <div class="form-group">
              <label class="form-label">부서</label>
              <div class="d-flex">
                <select class="form-select me-3" name="calDept" id="yourcalDept1">
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
                <select class="form-select me-3" name="calEmp" id="yourcalEmp1">
                  <!-- 직원 목록이 동적으로 추가되는 곳 -->
                </select>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>
 --%>
<!-- 조회하는 모달 -->
<div class="hk-drawer calendar-drawer drawer-right">
	<div>
		<div class="drawer-header">
			<div class="drawer-header-action">
				<a href="#" id="edit_event"
					class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover"><span
					class="icon"><span class="feather-icon"><i
							data-feather="edit-2"></i></span></span></a> 
							
							
							
							<!-- 
							<a href="#" id="import_event"
					class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover"><span
					class="icon"><span class="feather-icon"><i
							data-feather="star"></i></span></span></a>  -->

				
				
				
				
				<a href="#" id="del_event"
					class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover"><span
					class="icon"><span class="feather-icon"><i
							data-feather="trash-2"></i></span></span></a>
				<button type="button" class="drawer-close btn-close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
		</div>
		<div class="drawer-body" id="viewContainer">
			<div data-simplebar class="nicescroll-bar">
				<div class="drawer-content-wrap">
				<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="event_import"> <label class="form-check-label"
									for="event_import">중요일정</label>
							</div>
					<div class="event-head mb-4">

						
						
						
						
						<div>
							<div class="event-name">Jampack Team Meet</div>
							
							<span class="event-code">내일정</span>
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
							<div id="someContainer1">
								<!-- The following structure will be repeated for each employee in the list -->
								<div class="d-flex flex-wrap" id="inviContainer1">
									<div class="chip chip-primary user-chip mb-2 me-2">
										<span> <span class="avatar"> </span> <span
											class="chip-text">Morgan</span>
										</span>
									</div>
								</div>
							</div></li>







						<li><span class="ev-icon-wrap"><span
								class="feather-icon"><i data-feather="menu"></i></span></span><span
							class="event-content">이벤트입니다</span></li>
						<li><span class="ev-icon-wrap"><span
								class="feather-icon"><i data-feather="bell"></i></span></span><span
							class="event-reminder">알림여부</span></li>
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
		<div class="drawer-body" id="modifyContainer">
			<div data-simplebar class="nicescroll-bar">
				<div class="drawer-content-wrap">
					<form id="reForm">
						<input type="hidden" name="reempno" id="reempno"
							value="${loginEmp.emp_no}" /> <input type="hidden"
							name="rebackgroundColor" id="rebackgroundColor" value="" />

						<div class="event-head mb-4">
							<span
								class="badge badge-violet badge-indicator badge-indicator-xl flex-shrink-0 me-2"></span>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="event-name" name="retitle"
										id="retitle" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-affix-wrapper"> <select
									class="form-select cal-event-code" name="recode" id="recode"
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
									class="form-control cal-event-date-start"
									name="single-date restart" id="reStartDate" type="text">

								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-affix-wrapper"> <span
									class="input-prefix"><span class="feather-icon"><i
											data-feather="calendar"></i></span></span> <input
									class="form-control cal-event-date-end"
									name="single-date reend" id="reEndDate" type="text">

								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="d-flex flex-wrap">
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-allday"
											name="reallday" type="checkbox" id="realldaycheck"> <label
											class="form-check-label" for="realldaycheck">종일여부</label>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-reminder"
											type="checkbox" id="reremindercheck" name="rereminder">
										<label class="form-check-label" for="reremindercheck">알림여부
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="d-flex flex-wrap">
								<button type="button" 
									id="addBtnRe" class="btn btn-light btn-floating;">일정
									공유 추가</button>
								<button type="button"
									id="delBtnRe" class="btn btn-light btn-floating;">삭제</button>
								<div id="shareListJob" class="row gx-3">


								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control event-content" name="recontent"
								id="recontent" rows="4">Annual meeting</textarea>
						</div>
						<div class="drawer-footer d-flex justify-content-end">
							<button type="button"
								class="btn btn-secondary drawer-edit-close me-2" id="cancelBtn ">취소</button>
							<button type="button" class="btn btn-primary drawer-edit-close"
								id="editBtn">저장</button>
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
						
						
						
						<!-- Search -->
						<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover  d-xl-none"><span class="icon"><span class="feather-icon"><i data-feather="search"></i></span></span></a>
						<div class="input-group d-xl-flex d-none">
							<span class="input-affix-wrapper input-search affix-border">
								<input type="text" id="searchEmp" class="form-control  bg-transparent"  data-navbar-search-close="false" placeholder="캘린더 검색" aria-label="Search">
								<span class="input-suffix"><span id="search-icon"><img src="${path}/resources/img/search.svg"></span>
									<span class="btn-input-clear"><i class="bi bi-x-circle-fill"></i></span>
									<span class="spinner-border spinner-border-sm input-loader text-primary" role="status">
										<span class="sr-only">Loading...</span>
									</span>
								</span>
							</span>
						</div>
						<!-- <div class="separator separator-light"></div> -->
						<div class="categories-wrap">
							<!-- 	<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="allcalendar"> <label class="form-check-label"
									for="allcalendar">전체일정보기</label>
							</div> -->
							<div class="separator separator-light"></div>
							<div
								class="d-flex align-items-center justify-content-between mb-2">
								<div class="title-sm text-primary mb-0">내 캘린더</div>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="mycalendar"
									checked> <label class="form-check-label"
									for="mycalendar" style="padding-right: 116px">내일정</label> <!-- <a
									href="#" class="btn btn-xs btn-icon btn-rounded btn-light"
									data-bs-toggle="modal" data-bs-target="#add_new_cat" id="shareall"><span
									class="icon" data-bs-toggle="tooltip" data-bs-placement="top"
									title="" data-bs-original-title="내일정 공유"><span
										class="feather-icon"><i
											data-feather="arrow-right-circle"></i></span></span></a> -->

							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="mydeptcalendar"> <label class="form-check-label"
									for="mydeptcalendar">내부서일정</label>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="companycalendar"> <label class="form-check-label"
									for="companycalendar">전사일정</label>
							</div>
						<!-- 	<div
								class="d-flex align-items-center justify-content-between mb-2">
								<div class="title-sm text-primary mb-0">관심캘린더</div>
								<a href="#" class="btn btn-xs btn-icon btn-rounded btn-light"
									data-bs-toggle="modal" data-bs-target="#add_fav_board"><span
									class="icon" data-bs-toggle="tooltip" data-bs-placement="top"
									title="" data-bs-original-title="Add Board"><span
										class="feather-icon"><i data-feather="plus"></i></span></span></a>
							</div> -->
					<!-- 		<div class="menu-group">
								<ul class="nav nav-light navbar-nav flex-column">
									<li class="nav-item">
										<div>
											<div class="media d-flex align-items-center">
												<div class="media-head me-2">
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
															data-feather="delete"></i></span></span>
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
							</div> -->
							<div class="separator separator-light"></div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="importantcalendar"> <label class="form-check-label"
									for="importantcalendar">중요일정</label>
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
									value="${loginEmp.emp_no}" />
								<%-- <input type="hidden" name="empDeptCode" id="cal-event-empdeptcode"
									value="${loginEmp.dept_code}"/> --%>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<input class="form-control  cal-event-name" type="text"
											placeholder="일정명을 입력해주세요" />
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-12 form-group">
										<select class="form-select cal-event-code" id="cal-event-code"
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
								<div class="row gx-3" style="display: flex">
									<div class="col-sm-12 form-group">
										<input class="form-check-input cal-event-allday"
											id="alldaycheck" type="checkbox"> <label
											class="form-check-label" for="alldaycheck"> 종일여부</label>
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
														<option value=""></option>
													</select>
												</div>
											</div>
										</div>
										<button type="button" onclick="window.adddelFunction.util.delFile(this);">삭제</button>
									</div>


								</div>

								<div name="someContainer"></div>
								<div class="row gx-3" id="contentContainer">
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
											type="checkbox" value="" id="remindercheck" name="reminder">
										<label class="form-check-label" for="remindercheck">
											알림여부 </label>
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
		</div>
	</div>
	<!-- /Page Body -->
</div>
<!-- /Main Content -->
<!-- /Wrapper -->

<script>
//로그인 정보 변수 저장
var loginEmpNo = ${loginEmp.emp_no}
var loginDeptCode = '${loginEmp.dept_code}';

//model 값 js 배열로 바꿔서 사용
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

console.log(empDeptCodes);

//체크박스 value주기	
	$(document).ready(function(){
	    $('#realldaycheck').change(function() {
	        if(this.checked) {
	            $(this).val('Y');
	        } else {
	            $(this).val('N');
	        }
	    });
	});
	
	$(document).ready(function(){
	    $('#reremindercheck').change(function() {
	        if(this.checked) {
	            $(this).val('Y');
	        } else {
	            $(this).val('N');
	        }
	    });
	});


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
      document.querySelector('.cal-event-code').selectedIndex = "CAL001";
      document.querySelector('.cal-event-date-start').value = getCurrentDateTime();
      document.querySelector('.cal-event-date-end').value = getCurrentDateTime();
      document.getElementById('alldaycheck').checked = false;
      document.querySelector('.cal-event-content').value = '';
      document.querySelector('.cal-event-name').value = '';
      document.getElementById('reremindercheck').checked = false;
   	  $("[class$='inviteContainer']:not(:first)").remove();
      // 첫 번째 항목의 값 초기화
      $(".inviteContainer:first").find("select").val("");
    	  
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
                    option.value = employee.EMP_NO;
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
//
// const fn_addFileForm=adddelFunction[0];
// const fn_deleteFileForm=adddelFunction[1];

/* 
import { Calendar } from '@fullcalendar/core';
import googleCalendarPlugin from '@fullcalendar/google-calendar';

let calendar = new Calendar(calendarEl, {
	 plugins: [ googleCalendarPlugin ],
	 googleCalendarApiKey : "AIzaSyDTmzIpCFcBNK5_MAtLBPVD-j7O9mkXb_c",
events : 
    {
        googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com', 
        color: '#b342f5',
        textColor: 'black'
    } 
}); */
</script>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>