<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- 부트스트랩CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!-- 부트스트랩CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
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
								<div class="calendarapp-content"
									style="width: 50%; padding: 30px;">
									<div id="calendar" class="w-100"></div>
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
										<div class="form-group">
											<label class="form-label">참석자</label> <input
												class="form-control" type="text" />
											<button type="button" class="btn btn-light btn-floating">추가</button>
										</div>
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
												<th scope="col">예약시각</th>
												<th scope="col">예약자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>18:00~20:00</td>
												<td>홍길동</td>
											</tr>
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
<script>
//reminder 스트링으로 보내기
var remindercheck = document.getElementById('flexCheckDefault');

remindercheck.addEventListener('change', function() {
 if (remindercheck.checked) {
	  remindercheck.value = 'Y';
 } else {
	  remindercheck.value = 'N';
 }
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

<!-- Bootstrap Notify JS -->
<script src="${path}/resources/js/bootstrap-notify.min.js"></script>