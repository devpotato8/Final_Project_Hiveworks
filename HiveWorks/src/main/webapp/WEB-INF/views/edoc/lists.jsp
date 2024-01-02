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
			</jsp:include>
			<div class="fmapp-content">
				<div class="fmapp-detail-wrap">
					<header class="fm-header">
						<div class="d-flex align-items-center flex-grow-1">
							<a class="fmapp-title dropdown-toggle link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
								<h1>My Space</h1>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#"><span>전체</span></a>
								<a class="dropdown-item" href="#"><span>All Files</span></a>
								<a class="dropdown-item" href="#"><span>All Files</span></a>
								<a class="dropdown-item" href="#"><span>All Files</span></a>
							</div>
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
						<div class="hk-sidebar-togglable"></div>
					</header>
					<div class="fm-body">
						<div data-simplebar class="nicescroll-bar">
							<div class="file-list-view">
								<ul class="nav nav-tabs nav-line nav-icon nav-light">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="tab" href="#cloud_doc">
											<span class="nav-link-text">Cloud Documents</span>
										</a>
									</li>
									
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="cloud_doc">
										<div class="table-responsive">
											
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>