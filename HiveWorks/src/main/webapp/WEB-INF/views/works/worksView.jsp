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
		<div class="hk-pg-header pg-header-wth-tab pt-7">
			<div class="d-flex">
				<div class="d-flex flex-wrap justify-content-between flex-1">
					<div class="mb-lg-0 mb-2 me-8">
						<h1 class="pg-title">세부근무현황</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Header -->
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col"><input class="form-check-input"
							type="checkbox"></th>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><input class="form-check-input" type="checkbox"></th>
						<th>1</th>
						<td>제목</td>
						<td>12</td>
						<td>2024.01.03</td>
					</tr>
					<tr>
						<th><input class="form-check-input" type="checkbox"></th>
						<th>2</th>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th><input class="form-check-input" type="checkbox"></th>
						<th>3</th>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th><input class="form-check-input" type="checkbox"></th>
						<th>4</th>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="contact-list-view">
			<table id="datable_1" class="table nowrap w-100 mb-5">
				<thead>
					<tr>
						<th>
							<span class="form-check mb-0"> 
							<input type="checkbox" class="form-check-input check-select-all"
									id="customCheck1"> 
							<label class="form-check-label" for="customCheck1"></label>
							</span>
						</th>
						<th>Name</th>
						<th>Email Address</th>
						<th>Phone</th>
						<th>Tags</th>
						<th>Labels</th>
						<th>Date Created</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="d-flex align-items-center">
							</div>
						</td>
						<td>
							<div class="media align-items-center">
								<div class="media-body">
									<span class="d-block text-high-em">Morgan Freeman</span>
								</div>
							</div>
						</td>
						<td class="text-truncate">morgan@jampack.com</td>
						<td>+145 52 5689</td>
						<td><span class="badge badge-soft-violet my-1  me-2">Promotion</span><span
							class="badge badge-soft-danger  my-1  me-2">Collaborator</span></td>
						<td>Design</td>
						<td>13 Jan, 2020</td>
						<td>
							<div class="d-flex align-items-center">
								<div class="d-flex">
									<a
										class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover"
										data-bs-toggle="tooltip" data-placement="top" title=""
										data-bs-original-title="Archive" href="#"><span
										class="icon"><span class="feather-icon"><i
												data-feather="archive"></i></span></span></a> <a
										class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover"
										data-bs-toggle="tooltip" data-placement="top" title=""
										data-bs-original-title="Edit" href="edit-contact.html"><span
										class="icon"><span class="feather-icon"><i
												data-feather="edit"></i></span></span></a> <a
										class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button"
										data-bs-toggle="tooltip" data-placement="top" title=""
										data-bs-original-title="Delete" href="#"><span
										class="icon"><span class="feather-icon"><i
												data-feather="trash"></i></span></span></a>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>