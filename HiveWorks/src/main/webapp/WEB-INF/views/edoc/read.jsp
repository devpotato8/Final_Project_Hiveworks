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
																	<button class="btn btn-sm btn-primary" type="button">결재</button> 
																</c:when>
															</c:choose>
														</td>
													</c:forEach>
												</tr>
												<tr>
													<c:forEach items="${edoc.approval }" var="a">
														<td class="text-center">
														<c:if test="${a.aprvlApvCode ne 'APV000' }">
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
<!-- Init JS -->
<script src="${path}/resources/js/init.js"></script>
<script src="${path}/resources/js/chips-init.js"></script>
<!-- jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js" integrity="sha512-ekwRoEshEqHU64D4luhOv/WNmhml94P8X5LnZd9FNOiOfSKgkY12cDFz3ZC6Ws+7wjMPQ4bPf94d+zZ3cOjlig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 체크박스 JS -->
<script src="${path}/resources/js/checkbox.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	
<link type="text/css" rel="stylesheet" href="${path }/resources/css/edoc/edocwrite.css">

<script>
$(function(){
	jampack();
	horizontalMenu();
	navheadMenu();

	/*App Functions */
	//emailApp();
	//contactApp();
	//chatApp();
	//calendarApp();
	fmApp();
	//blogApp();
	//invoiceApp();
	//galleryApp();
	//integrationsApp();
	//taskboardApp();
	//checklistApp();
	//todoApp();
	

	/*Table Search*/
	$(".table-search").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$(".table-filter tbody tr").filter(function() {
		  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
	
	/*Disabled*/
	$(document).on("click", "a.disabled,a:disabled",function(e) {
		 return false;
	});
	
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>