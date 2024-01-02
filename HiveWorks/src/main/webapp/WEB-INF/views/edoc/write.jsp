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
							<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover disabled d-xl-inline-block d-none" href="#" ><span class="icon"><span class="feather-icon"><i data-feather="user-plus"></i></span></span></a>
							
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
								<ul class="nav nav-tabs nav-line nav-icon nav-light">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="tab" href="#write_doc">
											<span class="nav-link-text">문서작성</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#approval_set">
											<span class="nav-link-text">결재선 설정</span>
										</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="write_doc">
										<form class="form" action="${path }/edoc/write" method="post">
											<div>
												<span class="form-label">제목 : </span><input type="text" class="form-control"/>
											</div>
											<div class="editor">
												<div class="editor-toolbar-container"></div>
												<div class="editor-editable-container">
													<div class="editor-editable"></div>
												</div>
											</div>
										</form>
									</div>
									<div class="tab-pane fade show active" id="approval_set">
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
<script type="text/javascript" src="${path }/resources/ckeditor/build/ckeditor.js">
</script>
<script>
	const path = '${path}';
	DecoupledEditor
		.create(document.querySelector(".editor .editor-editable"))
		.then(editor =>{
			const toolbarContainer = document.querySelector(".editor .editor-toolbar-container");
			toolbarContainer.appendChild(editor.ui.view.toolbar.element);
			window.editor = editor;
		})
		.catch(error =>{
			console.error(error);
		})
</script>
<link href="${path }/resources/ckeditor/build/style.css" rel="stylesheet" type="text/css">
<%@ include file="/WEB-INF/views/common/footer.jsp"%>