<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
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
<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<link rel="shortcut icon" href="favicon.ico">
<div class="hk-wrapper" data-layout="vertical"
	data-layout-style="collapsed" data-menu="light" data-footer="simple"
	data-hover="active">
	<!-- 여기서 부터 시작 -->
	<!-- Calendar Drawer -->
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
								data-feather="trash-2"></i></span></span></a> <a href="#"
						class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover me-2"><span
						class="icon"><span class="feather-icon"><i
								data-feather="external-link"></i></span></span></a>
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
								<span>Event</span>
							</div>
						</div>
						<ul class="event-detail">
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="calendar"></i></span></span> Aug
								18,2020 - Aug 19, 2020</li>
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="clock"></i></span></span><span class="event=start-time">8:40
								AM - 5:40 PM</span></li>
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="map-pin"></i></span></span>
								Oslo, Canada</li>
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="check-square"></i></span></span>
								Meetings</li>
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="eye"></i></span></span> Default
								Visibility</li>
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="user-plus"></i></span></span>
								<div class="d-flex flex-wrap">
									<div class="chip chip-primary user-chip mb-2 me-2">
										<span> <span class="avatar"> <img
												src="dist/img/avatar11.jpg" alt="user" class="avatar-img">
										</span> <span class="chip-text">Morgan</span>
										</span>
									</div>
									<div class="chip chip-primary user-chip mb-2 me-2">
										<span> <span class="avatar"> <img
												src="dist/img/avatar12.jpg" alt="user" class="avatar-img">
										</span> <span class="chip-text">Charlie</span>
										</span>
									</div>
									<div class="chip chip-primary user-chip mb-2 me-2">
										<span> <span class="avatar"> <img
												src="dist/img/avatar13.jpg" alt="user" class="avatar-img">
										</span> <span class="chip-text">Winston</span>
										</span>
									</div>
								</div></li>
							<li><span class="ev-icon-wrap"><span
									class="feather-icon"><i data-feather="menu"></i></span></span><span class="event-content"></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="d-none">
			<div class="drawer-header">
				<div class="drawer-header-action">
					<a href="#"
						class="btn btn-sm btn-icon btn-flush-secondary btn-rounded flush-soft-hover me-2"><span
						class="icon"><span class="feather-icon"><i
								data-feather="external-link"></i></span></span></a>
					<button type="button" class="drawer-edit-close btn-close">
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
								<div class="event-name" contenteditable="true">Jampack
									Team Meet</div>
								<div class="form-group mt-2 mb-0">
									<div class="form-check form-check-inline ps-0">
										<div class="form-check">
											<input type="radio" id="event_1" name="eventSelect"
												class="form-check-input" checked=""> <label
												class="form-check-label" for="event_1">Event</label>
										</div>
									</div>
									<div class="form-check form-check-inline ps-0">
										<div class="form-check">
											<input type="radio" id="reminder_1" name="eventSelect"
												class="form-check-input"> <label
												class="form-check-label" for="reminder_1">Reminder</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<form>
							<div class="form-group">
								<div class="input-group">
									<span class="input-affix-wrapper"> <span
										class="input-prefix"><span class="feather-icon"><i
												data-feather="calendar"></i></span></span> <input
										class="form-control form-wth-icon" name="datetimes"
										value="Aug 18,2020 - Aug 19, 2020">
										
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-affix-wrapper"> <span
										class="input-prefix"><span class="feather-icon"><i
												data-feather="clock"></i></span></span> <input type="text"
										class="form-control form-wth-icon input-timepicker"
										value="8:40 AM - 5:40 PM">
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-affix-wrapper"> <span
										class="input-prefix"><span class="feather-icon"><i
												data-feather="map-pin"></i></span></span> <input type="text"
										class="form-control form-wth-icon" value="Oslo, Canada">
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-affix-wrapper"> <span
										class="input-prefix"><span class="feather-icon"><i
												data-feather="check-square"></i></span></span> <select class="form-select">
											<option selected="" value="1">All Time</option>
											<option value="2">Half Day</option>
											<option value="3">9 to 5</option>
									</select>
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-affix-wrapper"> <span
										class="input-prefix"><span class="feather-icon"><i
												data-feather="eye"></i></span></span> <select class="form-select">
											<option selected="">Default Visibility</option>
											<option value="1">Private</option>
											<option value="2">Public</option>
									</select>
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group color-picker">
									<span class="input-group-text colorpicker-input-addon"><i></i></span>
									<input type="text" class="form-control" value="#007D88" />
								</div>
							</div>
							<div class="form-group">
								<div class="d-flex flex-wrap">
									<div
										class="chip chip-primary chip-dismissable user-chip mb-2 me-2">
										<span> <span class="avatar"> <img
												src="dist/img/avatar11.jpg" alt="user" class="avatar-img">
										</span> <span class="chip-text">Morgan</span>
											<button type="button" class="btn-close"></button>
										</span>
									</div>
									<div
										class="chip chip-primary chip-dismissable user-chip mb-2 me-2">
										<span> <span class="avatar"> <img
												src="dist/img/avatar12.jpg" alt="user" class="avatar-img">
										</span> <span class="chip-text">Charlie</span>
											<button type="button" class="btn-close"></button>
										</span>
									</div>
									<div
										class="chip chip-primary chip-dismissable user-chip mb-2 me-2">
										<span> <span class="avatar"> <img
												src="dist/img/avatar13.jpg" alt="user" class="avatar-img">
										</span> <span class="chip-text">Winston</span>
											<button type="button" class="btn-close"></button>
										</span>
									</div>
									<input type="text"
										class="form-control border-0 p-0 shadow-none flex-1 mb-2 me-2" />
								</div>
							</div>
							<div class="form-group">
								<textarea class="form-control event-content" rows="4">Annual meeting with global branch teams & bosses about growth planning and fiscal year reports</textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="drawer-footer d-flex justify-content-end">
				<button class="btn btn-secondary drawer-edit-close me-2">discard</button>
				<button class="btn btn-primary drawer-edit-close">save</button>
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
							<!-- <div class="separator separator-light"></div> -->
							<!-- <div class="title-sm text-primary">Upcoming Events</div>
								<div class="upcoming-event-wrap">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item">
											<a class="nav-link" href="#">
												<div class="d-flex align-items-center">
													<span class="badge badge-violet badge-indicator badge-indicator-lg me-2"></span>
													<span class="event-time">Today, 5:00 onwards</span>
												</div>
												<div class="event-name">Jampack Team Meet</div>
											</a>
										</li>	
										<li class="nav-item">
											<a class="nav-link" href="#">
												<div class="d-flex align-items-center">
													<span class="badge badge-primary badge-indicator badge-indicator-lg me-2"></span>
													<span class="event-time">Tomorrow, 2:35 PM</span>
												</div>
												<div class="event-name">Indigo Flight to Indonesia</div>
											</a>
										</li>	
										<li class="nav-item">
											<a class="nav-link" href="#">
												<div class="d-flex align-items-center">
													<span class="badge badge-warning badge-indicator badge-indicator-lg me-2"></span>
													<span class="event-time">24 Jul, 9:30 AM</span>
												</div>
												<div class="event-name">Awwwards Conference</div>
											</a>
										</li>	
									</ul>	
								</div> -->
							<div class="separator separator-light"></div>
							<div class="categories-wrap">
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="customChecksc1" checked=""> <label
										class="form-check-label" for="customChecksc1">전체일정보기</label>
								</div>
								<div class="separator separator-light"></div>
								<div
									class="d-flex align-items-center justify-content-between mb-2">
									<div class="title-sm text-primary mb-0">내 캘린더</div>
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="customChecksc2" checked=""> <label
										class="form-check-label" for="customChecksc2"
										style="padding-right: 116px">내일정</label> <a href="#"
										class="btn btn-xs btn-icon btn-rounded btn-light"
										data-bs-toggle="modal" data-bs-target="#add_new_cat"><span
										class="icon" data-bs-toggle="tooltip" data-bs-placement="top"
										title="" data-bs-original-title="내일정 공유"><span
											class="feather-icon"><i
												data-feather="arrow-right-circle"></i></span></span></a>

								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="customChecksc3" checked=""> <label
										class="form-check-label" for="customChecksc3">내부서일정</label>
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
														<div
															class="avatar avatar-xs avatar-primary avatar-rounded">
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
													class="form-control cal-event-date-start" name="single-date" type="text" />
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="form-label">종료일자</label> <input
													class="form-control cal-event-date-end" name="single-date" type="text" />
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-check form-check-sm mt-2">
												<input type="checkbox" class="form-check-input cal-event-allday">
												<label class="form-check-label">종일여부</label>
											</div>
										</div>
									</div>
											<div class="col-sm-7">
												<div class="form-group">
													<label class="form-label">Visibility</label>
													<div class="d-flex">
														<select class="form-select me-3">
															<option selected="" value="2">Public</option>
															<option value="1">Private</option>
														</select>
														<div class="">
															<input type="color" class="form-control form-control-color p-0 cal-event-color" title="Choose your color">
														</div>
													</div>
												</div>
											</div>
									<div class="row gx-3">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="form-label">참석자</label> <input
													class="form-control" type="text" />
												<button type="button" class="btn btn-light btn-floating">추가</button>
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
												<input class="form-check-input" type="checkbox" value=""
													id="flexCheckDefault"> <label
													class="form-check-label cal-event-reminder" for="flexCheckDefault">
													알림여부 </label> 
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
													class="form-check-label" for="flexCheckDefault"> 종일
												</label>
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

				<!-- Set Reminder -->
				<div id="set_new_reminder" class="modal fade" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-body">
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<h5 class="mb-4">Create a Reminder</h5>
								<form>
									<div class="row gx-3">
										<div class="col-sm-12 form-group">
											<label class="form-label">Name</label> <input
												class="form-control" type="text" />
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-12 form-group">
											<div class="form-label-group">
												<label>Note/Description</label> <small class="text-muted">200</small>
											</div>
											<textarea class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="form-label">Start Date</label> <input
													class="form-control" name="single-date-pick" type="text" />
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="form-label">Start Time</label> <input
													class="form-control input-single-timepicker" type="text" />
											</div>
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="form-label">Remind</label> <select
													class="form-control form-select me-20">
													<option selected="">Daily</option>
													<option value="1">Monthly</option>
													<option value="2">Weekly</option>
												</select>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer align-items-center">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Discard</button>
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">Add</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Set Reminder -->

				<!-- Add Category -->
				<div id="add_new_cat" class="modal fade" tabindex="-1" role="dialog"
					aria-hidden="true">
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
			</div>
		</div>
		<!-- /Page Body -->
	</div>
	<!-- /Main Content -->
</div>
<!-- /Wrapper -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<!-- jQuery -->
<script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script
	src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- FeatherIcons JS -->
<script src="${path}/resources/js/feather.min.js"></script>

<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

<!-- Simplebar JS -->
<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>

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

<!-- Init JS -->
<script src="${path}/resources/js/init.js"></script>

