<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<div class="hk-wrapper" data-layout="vertical"
	data-layout-style="collapsed" data-menu="light" data-footer="simple"
	data-hover="active">
	<div class="integrations-options-wrap">
		<select class="form-select">
			<option selected="">전체</option>
			<option value="1">진행중</option>
			<option value="2">완료</option>
		</select> <a
			class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0 d-sm-inline-block d-none"
			href="#" data-bs-toggle="tooltip" data-bs-placement="top" title=""
			data-bs-original-title="Collapse"> <span class="icon"> <span
				class="feather-icon"><i data-feather="chevron-up"></i></span> <span
				class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
		</span>
		</a>
	</div>
	<div class="hk-sidebar-togglable"></div>
	</header>
	<div class="integrations-body">
		<div data-simplebar class="nicescroll-bar">
			<div class="container mt-md-7 mt-3">
				<div
					class="d-flex flex-md-nowrap flex-wrap align-items-center justify-content-between mb-5">
					<div>
						<h5>설문</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-xxl-3 col-xl-4 col-md-6">
						<div class="card card-border card-int mb-4">
							<div class="card-body">
								<div class="avatar avatar-sm avatar-logo mb-3">
									<span class="initial-wrap">진행중</span>
								</div>
								<div class="app-name">제목</div>								
								<p class="p-sm multine-ellipsis">
									설문 요약
								</p>
							</div>
							<div class="card-footer justify-content-between border-0">								
								<a href="${path}/board/surveying" class="btn btn-sm btn-outline-secondary">설문하기</a>
							</div>
						</div>
					</div>
					<div class="col-xxl-3 col-xl-4 col-md-6">
						<div class="card card-border card-int mb-4">
							<div class="card-body">
								<div class="avatar avatar-sm avatar-logo mb-3">
									<span class="initial-wrap">완료</span>
								</div>
								<div class="app-name">제목</div>								
								<p class="p-sm multine-ellipsis">
									설문 요약
								</p>
							</div>
							<div class="card-footer justify-content-between border-0">								
								<a href="#" class="btn btn-sm btn-outline-secondary">설문하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
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
<!-- /Wrapper -->
<style>
.form-select {
	margin-top: 100px;
	width: 350px;
	margin-left: 300px;
}
</style>
<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- FeatherIcons JS -->
<script src="dist/js/feather.min.js"></script>

<!-- Fancy Dropdown JS -->
<script src="dist/js/dropdown-bootstrap-extended.js"></script>

<!-- Simplebar JS -->
<script src="vendors/simplebar/dist/simplebar.min.js"></script>

<!-- Init JS -->
<script src="dist/js/init.js"></script>
<script src="dist/js/chips-init.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>