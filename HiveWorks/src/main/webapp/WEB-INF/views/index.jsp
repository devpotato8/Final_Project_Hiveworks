<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<div class="container-xxl">
				<!-- Page Header -->
				<div class="hk-pg-header pg-header-wth-tab pt-7">
					<div class="d-flex">
						<div class="d-flex flex-wrap justify-content-between flex-1">
							<div class="mb-lg-0 mb-2 me-8">
								<h1 class="pg-title">여기부터 메인페이지 추가</h1>
								<h1 class="pg-title">이 페이지 삭제할까요? 그냥 둘까요?</h1>
								<p>메인 페이지의 헤더부분입니다</p>
								<p>${path}</p>
							</div>
						</div>
					</div>
					<ul class="nav nav-line nav-light nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" data-bs-toggle="tab" href="#">
								<span class="nav-link-text">메뉴1</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#">
								<span class="nav-link-text">메뉴2</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#">
								<span class="nav-link-text">메뉴3</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- /Page Header -->

				<!-- Page Body -->
				<div class="hk-pg-body">
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab_block_1">
							<div class="row">
								
							
							</div>	
							<div class="row">
								<div class="col-md-12 mb-md-4 mb-3">
								
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-md-4 mb-3">
									
							</div>	
						</div>
					</div>
				</div>
				<!-- /Page Body -->		
			</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>