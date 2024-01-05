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
															<input type="hidden" name="edocCreater" value="${emp.EMPNO }">
														</td>
													</tr>
													<tr>
														<th scope="row">보존연한</th>
														<td>
															<select class="form-select" name="edocPreservePeriod">
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
															<select class="form-select" name="edocDsgCode">
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
										<div class="edoc-detail-container">
											<div class="mb-3">
												<span class="form-label">제목 : </span>
												<input type="text" class="form-control"/>
											</div>
										</div>
										<span class="form-label">본문 : </span>
										<div class="document-container">
											<iframe class="doc-viewer" id="edoc">
												${document }
											</iframe>
										</div>
									</div>
									<!-- 결재선 설정 탭 -->
									<div class="tab-pane fade show active" id="approval_set">
										<div id="">
										</div>
									</div>
									<!-- 파일 첨부 탭 -->
									<div class="tab-pane fade show active" id="attach_file">
										<div id="">
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
<script type="text/javascript" src="${path }/resources/js/edoc/edoc-write.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>