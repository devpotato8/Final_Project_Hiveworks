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
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
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
							<h1 class="fmapp-title">양식 작성</h1>&emsp;
							<button type="button" class="btn btn-primary" id="submitButton">양식 전송하기</button>&emsp;
							<button type="button" class="btn btn-outline-primary" id="helpButton">양식 작성 서식</button>
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
											<span class="nav-link-text">양식작성</span>
										</a>
									</li>
								</ul>
								<!-- 탭 내용 -->
								<div class="tab-content">
									<!-- 문서 작성 탭 -->
									<div class="tab-pane fade show active" id="write_doc">
										<div class="container">
											<div class="table-responsive">
												<table class="table">
													<tbody>
														<tr>
															<th scope="row">문서종류</th>
															<td>
																<div class="input-group mb-3">
																	<select class="form-select" name="sampleDotCode" id="docType">
																		<option disabled="disabled" selected="selected">문서종류</option>
																		<c:forEach items="${dotcode }" var="t">
																			<option value="${t }">${DotCode.valueOf(t).code }</option>
																		</c:forEach>
																	</select>
																</div>
															</td>
															<th scope="row">문서이름</th>
															<td>
																<input type="text" class="form-control" name="sampleName" id="sampleName">
															</td>
														</tr>
														<tr>
															<th scope="row">문서설명</th>
															<td colspan="3">
																<input type="text"  class="form-control" name="sampleDesc" id="sampleDesc">
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>	
										<div class="ckeditor-container">
											<span class="form-label">본문 : </span>
											<div class="row">
												<div class="editor-toolbar-container">
												</div>
											</div>
											<div class="row row-editor">
												<div class="editor-container">
													<div class="editor editor-editable-container editor-editable-container--with-sidebar" id="content">
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
	const contextPath = "${path}";
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
	
<script type="text/javascript" src="${path }/resources/ckeditor/build/ckeditor.js"></script>
<script type="text/javascript" src="${path}/resources/js/edoc/edoc-format-write.js"></script>
<link rel="stylesheet" href="${path}/resources/css/edoc/formatwrite.css">

<script>

$(function(){
	ckeditor.data.set('<table style="width:17.5cm;height:25.2cm;padding:0;"><tbody><tr><td style="padding:0;">&nbsp;</td></tr></tbody></table>');
});
</script>

</div>
</body>
</html>