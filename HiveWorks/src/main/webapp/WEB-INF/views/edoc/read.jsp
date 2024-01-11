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
							<h1 class="fmapp-title">기안하기</h1>
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
										<a class="nav-link active" data-bs-toggle="tab" href="#write_doc">
											<span class="nav-link-text">문서작성</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#approval_set">
											<span class="nav-link-text">결재선설정</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#attach_file">
											<span class="nav-link-text">파일첨부</span>
										</a>
									</li>
								</ul>
								<!-- 탭 내용 -->
								<div class="tab-content">
									<!-- 문서 작성 탭 -->
									<div class="tab-pane fade show active" id="write_doc">
										<div class="table-responsive col-sm-8">
											<table class="table">
												<tbody>
													<tr>
														<th scope="row">문서종류</th>
														<td>
															<div class="input-group mb-3">
																<select class="form-select" name="edocDotCode" id="edocType">
																	<option disabled="disabled" selected="selected">문서종류</option>
																	<c:forEach items="${dotcode }" var="t">
																		<option value="${t }">${DotCode.valueOf(t).code }</option>
																	</c:forEach>
																</select>
																<select class="form-select" id="edocFormat">
																	<option disabled="disabled" selected="selected">종류를 선택해주세요</option>
																</select>
															</div>
														</td>
														<th scope="row">작성자</th>
														<td>
															<c:out value="${emp.DEPTNAME }"/> <c:out value="${emp.JOBNAME }"/> <c:out value="${emp.EMPNAME }"/>
															<input type="hidden" name="edocCreater" value="${emp.EMPNO }" id="edocCreter">
														</td>
													</tr>
													<tr>
														<th scope="row">보존연한</th>
														<td>
															<select class="form-select" name="period" id="period">
																<optgroup label="보존연한">
																	<option value="1">1년</option>
																	<option value="3" selected="selected">3년</option>
																	<option value="5">5년</option>
																	<option value="10">10년</option>
																</optgroup>
															</select>
														</td>
														<th scope="row">보안등급</th>
														<td>
															<select class="form-select" name="edocDsgCode" id="edocDsgCode">
																<optgroup label="보안등급">
																	<c:forEach items="${dsgcode }" var="s">
																		<option value="${s}"
																			<c:if test="${s eq 'DSG003' }">selected</c:if>
																		>${DsgCode.valueOf(s).code }</option>
																	</c:forEach>
																</optgroup>
															</select>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="submitButton">기안하기</button>
										</div>
										<div class="edoc-detail-container">
											<div class="mb-3">
												<span class="form-label">제목 : </span>
												<input type="text" class="form-control" name="edocTitle" id="edocTitle"/>
											</div>
										</div>
										<span class="form-label">본문 : </span>
										<div class="editor">
											<div class="editor-toolbar-container">
											</div>
											<div class="editor-editable-container">
												<div class="editor-editable"  id="content">
												</div>
											</div>
										</div>
									</div>
									<!-- 결재선 설정 탭 -->
									<div class="tab-pane fade" id="approval_set">
										<div class="row">
											<div class="col-xl-3" id="deptTree"> </div>
											
											<div class="col-xl-3">
												<label for="employee-list-container">소속사원</label>
												<div id="employee-list-containter">
													<select class="form-select form-select-lg" multiple size="10" id="employee-list">
													</select>
												</div>
												<div class="d-flex justify-content-evenly">
													<button type="button" class="btn-sm btn-outline fw-bold" id="employeeSelectAllBtn">전체선택</button>
													<button type="button" class="btn-sm btn-outline fw-bold" id="employeeDeselectAllBtn">선택해제</button>
												</div>
											</div>
											<div class="col-xl-4 d-flex flex-column">
												<label for="approvalList" class="px-10">결재</label>
												<div class="d-flex flex-row mb-3">
													<div class="d-flex flex-column justify-content-center">
														<button type="button" class="btn btn-sm btn-outline mb-3" id="addApprovalList"><span><i class="ti-angle-right"></i></span></button>
														<button type="button" class="btn btn-sm btn-outline" id="removeApprovalList"><span><i class="ti-angle-left"></i></span></button>
													</div>
													<div class="container">
														<select class="form-select" multiple size="5" name="approvalList" id="approvalList">
														</select>
													</div>
													<div class="approval-direction">
														결<br>
														재<br>
														방<br>
														향<br>
													</div>
												</div>
												<label for="referenceList" class="px-10">참조</label>
												<div class="d-flex flex-row mb-3">
													<div class="d-flex flex-column justify-content-center">
														<button type="button" class="btn btn-sm btn-outline mb-3" id="addReferenceList"><span><i class="ti-angle-right"></i></span></button>
														<button type="button" class="btn btn-sm btn-outline" id="removeReferenceList"><span><i class="ti-angle-left"></i></span></button>
													</div>
													<div class="container">
														<select class="form-select" multiple size="5" name="referenceList" id="referenceList">
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 파일 첨부 탭 -->
									<div class="tab-pane fade" id="attach_file">
										<div class="file-container"  id="fileContainer">
											<input type="file" name="file" id="file" multiple/>
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

<script type="text/javascript" src="${path }/resources/ckeditor/build/ckeditor.js"></script>
<script type="text/javascript" src="${path }/resources/js/edoc/edoc-write.js"></script>
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
	getDeptList();

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
	
	// 결재목록에 자동으로 자기자신 추가
	fnAddApprovalListLoginEmp('${emp.EMPNO }', '${emp.DEPTNAME }', '${emp.JOBNAME }', '${emp.EMPNAME }');
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>