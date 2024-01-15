<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.dna.hiveworks.model.code.*" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp"%> --%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<!-- Main Content -->
<div class="hk-pg-wrapper pb-0">
	<!-- Page Body -->
	<div class="hk-pg-body py-0">
		<div class="fmapp-wrap fmapp-sidebar-toggle">
			<!-- PageSideBar -->
			<jsp:include page="/WEB-INF/views/edoc/common/edocSideBar.jsp">
			 	<jsp:param value="${currentPage }" name="currentPage"/>
				<jsp:param value="${countAll}" name="countAll"/>
				<jsp:param value="${countWait}" name="countWait"/>
				<jsp:param value="${countCheck}" name="countCheck"/>
				<jsp:param value="${countExpect}" name="countExpect"/>
				<jsp:param value="${countProcess}" name="countProcess"/>
			</jsp:include>
			<div class="fmapp-content">
				<div class="fmapp-detail-wrap">
					<header class="fm-header">
						<div class="d-flex align-items-center flex-grow-1">
							<h1 class="fmapp-title">문서 열람</h1>
						</div>
						<div class="fm-options-wrap">	
							<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
								<span class="icon">
									<span class="feather-icon"><i data-feather="chevron-up"></i></span>
									<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
								</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable active"></div>
					</header>
					<div class="fm-body">
						<div data-simplebar class="nicescroll-bar">
							<div class="file-list-view">
								<!-- 탭 메뉴 -->
								<ul class="nav nav-tabs nav-line nav-icon nav-light">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="tab" href="#document">
											<span class="nav-link-text">전자문서</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#attach_file">
											<span class="nav-link-text">첨부파일</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#comment_history">
											<span class="nav-link-text">의견/이력</span>
										</a>
									</li>
								</ul>
								<!-- 탭 내용 -->
								<div class="tab-content">
									<!-- 전자문서 탭 -->
									<div class="tab-pane fade show active" id="document">
										<div class="table-responsive col-sm-8">
											<table class="table">
												<tbody>
													<tr>
														<th scope="row">문서종류</th>
														<td>${edoc.edocDotCode.code}</td>
														<th scope="row">기안자</th>
														<td>
															<c:out value="${edoc.createrDeptName }"/> <c:out value="${edoc.createrJobName }"/> <c:out value="${edoc.createrEmpName }"/>
														</td>
													</tr>
													<tr>
														<th scope="row">보존연한</th>
														<td>
															<fmt:formatDate type="date" value="${edoc.edocPreservePeriod }"/>
														</td>
														<th scope="row">보안등급</th>
														<td>
															${edoc.edocDsgCode.code}
														</td>
													</tr>
													<tr>
														<th scope="row">문서기안일</th>
														<td>
															<fmt:formatDate type="both" value="${edoc.createDate }" timeStyle="short"/>
														</td>
														<th scope="row">문서종료일</th>
														<td>
															<fmt:formatDate type="both" value="${edoc.finalizedDate }" timeStyle="short"/>
														</td>
													</tr>
												</tbody>
											</table>
											<table class="table">
												<tr>
													<td rowspan="3">결재</td>
													<c:forEach items="${edoc.approval }" var="a">
														<td class="text-center">
															${a.aprvlEmpName }
														</td>
													</c:forEach>
												</tr>
												<tr>
													<c:forEach items="${edoc.approval }" var="a">
														<td class="text-center">
															<c:choose>
																<c:when test="${a.aprvlApvCode ne 'APV000' }">
																	<img src="${path }/resources/upload/edoc/autograph/${a.aprvlAutoFilename}">
																</c:when>
																<c:when test="${a.aprvlStatus eq 'W' and a.aprvlEmpNo eq loginEmp.emp_no }">
																	<c:set var="currentApprovalNo" value="${a.aprvlNo }"/>
																	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_approval">
																		결재
																	</button>
																</c:when>
															</c:choose>
														</td>
													</c:forEach>
												</tr>
												<tr>
													<c:forEach items="${edoc.approval }" var="a">
														<td class="text-center">
														<c:if test="${a.aprvlApvCode ne 'APV000'}">
															<fmt:formatDate type="date" value="${a.aprvlDate }"/>
														</c:if>
														</td>
													</c:forEach>
												</tr>
											</table>
										</div>
										
										<span class="form-label">본문 : </span>
										<div class="container document-container">									
											${edoc.edocContent}
										</div>
									</div>
									<!-- 첨부파일 탭 -->
									<div class="tab-pane fade" id="attach_file">
										<div class="row">
											
										</div>
									</div>
									<!-- 의견/이력 탭 -->
									<div class="tab-pane fade" id="comment_history">
										
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
<!-- Modal Content -->
<div class="modal fade" id="modal_approval" tabindex="-1" role="dialog" aria-labelledby="modal-approval" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal_approval_label">결재하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<form id="form_approval" action="${path}/edoc/processapproval" method="post">
						<input type="hidden" name="aprvlNo" value="${currentApprovalNo}">
						<input type="hidden" name="aprvlEdocNo" value="${edoc.edocNo}">
						<div class="row">
							<div class="col mb-1">
								<c:forEach items="${apvCode }" var="code"  varStatus="status" >
									<c:choose>
										<c:when test="${code.name() eq 'APV001' or code.name() eq 'APV002' }">
											<div class="form-check form-check-inline">
												<input type="radio" name="aprvlApvCode" id="aprvlApvCode${status.count}" class="form-check-input" value="${code.name()}"
												<c:if test="${code.name() eq 'APV001'}">checked</c:if>
												>
												<label for="aprvlApvCode${status.count}" class="form-check-label">${code.code}</label>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<textarea name="aprvlComment" id="aprvlComment" cols="50" rows="4" class="form-control mt-1" style="resize: none;"></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary" id="btn_approval">결재하기</button>
			</div>
		</div>
	</div>
</div>
<script>
	const path = "${path}";
</script>
<!-- Bootstrap Core JS -->
<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FeatherIcons JS -->
<script src="${path}/resources/js/feather.min.js"></script>
<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>
<!-- Simplebar JS -->
<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
<!-- 체크박스 JS -->
<script src="${path}/resources/js/checkbox.js"></script>
<!-- Init JS -->
<script src="${path}/resources/js/init.js"></script>
<script src="${path}/resources/js/chips-init.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<script src="${path}/resources/js/edoc/edoc-read.js"></script>

</div>
</body>
</html>