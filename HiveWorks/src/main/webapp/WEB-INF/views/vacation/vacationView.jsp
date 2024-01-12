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
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<div class="hk-pg-wrapper">
	<div class="container-xxl">
		<!-- Page Header -->
		<div class="hk-pg-header pg-header-wth-tab pt-7 pb-2">
			<div class="d-flex">
				<div class="d-flex flex-wrap justify-content-between flex-1">
					<div class="mb-lg-0 mb-2 me-8">
						<h1 class="pg-title">휴가 사용내역</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Header -->
		<div class="contact-list-view vacationList">
			<!-- <table id="datable_1" class="table nowrap w-100 mb-5"> id="datable_1" 에 체크박스생성하는 js걸려있음-->
			<table class="table nowrap w-100 mb-5 "> 
				<thead>
					<tr>
						<th>
							<span class="form-check mb-0"> 
								<input class="form-check-input" type="checkbox"  id="checkAll">
								<label class="form-check-label" for="checkAll"></label>
							</span>
						</th>
						<th>순번</th>
						<th>기간</th>
						<th>신청일</th>
						<th>종류</th>
						<th>승인여부</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty  vacations}">
						<c:forEach var="v" items="${vacations }" varStatus="status">
							<tr>
								<td>
									<div class="form-check">
								      <input class="form-check-input" type="checkbox" id="checkbox1">
								      <label class="form-check-label" for="checkbox1"></label>
								    </div>
								</td>
								<td>
									<div class="media align-items-center">
										<div class="media-body">
											<span class="d-block text-high-em"><c:out value="${status.count }"/></span>
										</div>
									</div>
								</td>
								<td><span class="badge badge-soft-primary my-1  me-2"><c:out value="${v.createDate }"/></span></td>
								<td><span class="badge badge-soft-violet my-1  me-2"><c:out value="${v.modifyDate }"/></span></td>
								<td><span class="badge badge-soft-danger my-1  me-2"><c:out value="${v.vacOption }"/></span></td>
								<td><span class="badge badge-soft-warning my-1  me-2">승인</span></td>
								<td>
									<div class="d-flex align-items-center">
										<div class="d-flex">
										 	<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover"
											data-bs-toggle="tooltip" data-placement="top" title=""	data-bs-original-title="Edit" href="">
											<span class="icon">
											<span class="feather-icon"><i data-feather="edit"></i></span>
											</span></a>
											
											<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button"
											data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Delete" href="">
											<span	class="icon">
											<span class="feather-icon"><i data-feather="trash"></i></span>
											</span></a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>

	</div>
</div>
<style>
.contact-list-view{
	height: 700px;
}
.vacationList{
	overflow: auto;
}
.contact-list-view::-webkit-scrollbar {
  display: block;
}
::-webkit-scrollbar-thumb {
    background-color: lightblue;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#checkAll').click(function() {
        $('input[type="checkbox"]').prop('checked', $(this).prop('checked'));
      });
    });
  </script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>