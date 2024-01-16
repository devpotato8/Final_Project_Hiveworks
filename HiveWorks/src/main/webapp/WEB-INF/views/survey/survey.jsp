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
		<select class="form-select" onchange="javascript:myListener(this);">
			<option value="0">전체</option>
			<option value="1">진행중</option>
			<option value="2">완료</option>
		</select> <a href="${path}/survey/surveyWrite"
			class="btn btn-sm btn-outline-secondary" style="margin-left: 650px;">설문등록</a>
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
					<c:forEach var="s" items="${surveyList}">
					    <div class="col-xxl-3 col-xl-4 col-md-6" id="surveyOngoing" style="display: block;">
					        <div class="card card-border card-int mb-4">
					            <div class="card-body">
					                <div class="avatar avatar-sm avatar-logo mb-3">
					                    <span class="initial-wrap">
					                        <%-- <c:if test="${s.surveyStart != null and s.surveyEnd != null}">
					                            <c:if test="${s.surveyStart.before(now) and s.surveyEnd.after(now)}">진행 중</c:if>
					                            <c:if test="${s.surveyEnd.before(now)}">완료</c:if>
					                        </c:if> --%>
					                    </span>
					                </div>
					                <c:out value="${s.surveyNo}" />
					                <div class="app-name">
					                    <c:out value="${s.surveyTitle}" />
					                    <c:out value="${s.surveyStart }"/>
					                    <c:out value="${s.surveyEnd }"/>
					                </div>
					               
					            </div>
					            <div class="card-footer justify-content-between border-0">			               
					                    <a href="${path}/survey/surveying" class="btn btn-sm btn-outline-secondary">설문하기</a>
					                    <a href="${path}/survey/surveyresult" class="btn btn-sm btn-outline-secondary">결과보기</a>
					            </div>
					        </div>
					    </div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function myListener(selectedValue) {
		var ongoingSurvey = document.getElementById("surveyOngoing");
		var completedSurvey = document.getElementById("surveyCompleted");

		if (selectedValue.value === "0") {
			ongoingSurvey.style.display = "block";
			completedSurvey.style.display = "block";
		} else if (selectedValue.value === "1") {
			ongoingSurvey.style.display = "block";
			completedSurvey.style.display = "none";
		} else if (selectedValue.value === "2") {
			ongoingSurvey.style.display = "none";
			completedSurvey.style.display = "block";
		}
	}
</script>

<script>
	function btn() {
		alert('이미 완료된 설문입니다.');
	}
</script>
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