<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		<div class="fmapp-wrap">
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
							<h1>개인설정</h1>
						</div>
						<div class="fm-options-wrap">	
							<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
								<span class="icon">
									<span class="feather-icon"><i data-feather="chevron-up"></i></span>
									<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
								</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable"></div>
					</header>
					<div class="fm-body">
						<div data-simplebar class="nicescroll-bar">
							<div class="file-list-view">
								<ul class="nav nav-tabs nav-line nav-icon nav-light">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="tab" href="#cloud_doc">
											<span class="nav-link-text">기본설정</span>
										</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="cloud_doc">
										<div class="container autograph-setting">
											<h4>서명 설정</h4>
											<div class="current-autograph">
												<c:choose>
													<c:when test="${loginEmp.emp_auto_fileName eq null}">
														<figure>
															<figcaption class="figure-caption mb-3">현재 설정 :</figcaption>
															<img id="currentAuto" src="${path}/resources/upload/edoc/autograph/defaultApprove.png"/>
														</figure>
													</c:when>
													<c:otherwise>
														<figure>
															<figcaption class="figure-caption mb-3">현재 설정 :</figcaption>
															<img id="currentAuto" src="${path}/resources/upload/edoc/autograph/${loginEmp.emp_auto_fileName}"/>
														</figure>
													</c:otherwise>
												</c:choose>
												<div class="row mt-10">
													<span class="form-label">서명변경</span>
													<c:choose>
														<c:when test="${loginEmp.emp_auto_fileName eq null}">
															<figure class="mb-3">
																<figcaption class="figure-caption mb-3">현재 설정 :</figcaption>
																<img id="targetAuto" src="${path}/resources/upload/edoc/autograph/defaultApprove.png"/>
															</figure>
														</c:when>
														<c:otherwise>
															<figure class="mb-3">
																<figcaption class="figure-caption mb-3">현재 설정 :</figcaption>
																<img id="targetAuto" src="${path}/resources/upload/edoc/autograph/${loginEmp.emp_auto_fileName}"/>
															</figure>
														</c:otherwise>
													</c:choose>
													<input type="file" class="form-control mb-3" name="autograph" id="changeAutograph" accept="image/*">
													<div class="btn-container">
														<button type="button" class="btn btn-primary" id="setAutographBtn">서명변경</button>
														<button type="button" class="btn btn-primary" id="setDefaultBtn">기본으로변경</button>
													</div>
													<div class="new-auto-container">
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
	</div>
	<!-- /Page Body -->
</div>
<!-- /Main Content -->

<script>
	const contextPath = '${path}';
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

<script src="${path}/resources/js/edoc/edoc-psetting.js"></script>

</div>
</body>
</html>