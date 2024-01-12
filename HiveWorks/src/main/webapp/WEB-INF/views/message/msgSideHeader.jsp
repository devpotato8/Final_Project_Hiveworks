<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>
</jsp:include>
	
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<!-- Modal -->
<div class="modal fade" id="sendMsgModal" tabindex="-1" aria-labelledby="sendMsgModalLabel" aria-hidden="true">
  <div class="modal-dialog-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="sendMsgModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">전송</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<!-- Main Content -->
<div class="hk-pg-wrapper pb-0">
	<!-- Page Body -->
	<div class="hk-pg-body py-0">
		<div class="fmapp-wrap">
		<!--MSG Sidebar -->
			<nav class="fmapp-sidebar">
				<div data-simplebar class="nicescroll-bar">
					<div class="menu-content-wrap">
						<div class="btn btn-primary btn-rounded btn-block btn-file mb-4">
							<input type="button" class="sendMsgBtn" data-bs-toggle="modal" data-bs-target="#sendMsgModal">
							쪽지보내기
						</div>
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item active">
									<a class="nav-link" href="${path}/messageview">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="hard-drive"></i></span></span>
										<span class="nav-link-text">받은 쪽지함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="javascript:void(0);">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="send"></i></span></span>
										<span class="nav-link-text">보낸 쪽지함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="javascript:void(0);">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="star"></i></span></span>
										<span class="nav-link-text">별표 쪽지함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="javascript:void(0);">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span>
										<span class="nav-link-text">휴지통</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator separator-light"></div>
						<div class="menu-group">
							<div class="nav-header">
								<span>쪽지 첨부파일</span>
							</div>
							<br>
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item">
									<a class="nav-link" href="javascript:void(0);">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="image"></i></span></span>
										<span class="nav-link-text">사진 파일</span>
									</a>
								</li>
								
								<li class="nav-item">
									<a class="nav-link" href="javascript:void(0);">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="file-text"></i></span></span>
										<span class="nav-link-text">문서 파일</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- <div class="fmapp-storage">
					<p class="p-sm">Storage is 85% full. 78.5 GB of 1 TB used. You can buy more space.</p>
					<div class="progress-lb-wrap my-2">
						<label class="progress-label text-uppercase fs-8 fw-medium">78.5 GB of 1 TB</label>
						<div class="progress progress-bar-rounded progress-bar-xs">
							<div class="progress-bar bg-danger w-85" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
					<a href="#" class="fs-7"><u>Buy Storage</u></a>
				</div> -->
				<!--Sidebar Fixnav-->
				<!-- <div class="fmapp-fixednav">
					<div class="hk-toolbar">
						<ul class="nav nav-light">
							<li class="nav-item nav-link">
								<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Settings" href="#"><span class="icon"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
							</li>
							<li class="nav-item nav-link">
								<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive"><span class="icon"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
							</li>
							<li class="nav-item nav-link">
								<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Help"><span class="icon"><span class="feather-icon"><i data-feather="book"></i></span></span></a>
							</li>
						</ul>
					</div>
				</div> -->
				<!--/ Sidebar Fixnav-->
			</nav>
			<!--/ MSG Sidebar END-->
			
			<!-- MSG Header Line -->
			<div class="fmapp-content">
				<div class="fmapp-detail-wrap">
					<header class="fm-header">
						<div class="d-flex align-items-center flex-grow-1">
							<a class="fmapp-title dropdown-toggle link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
								<h5>쪽지함 검색</h5>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="file"></i></span><span>쪽지내용 검색</span></a>
								<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="file-plus"></i></span><span>첨부파일 검색</span></a>
								<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user"></i></span><span>보낸사람 검색</span></a>
							</div>
							<form class="mx-3 flex-grow-1 mw-400p" role="search">
								<input type="text" class="form-control" placeholder="검색어를 입력하세요">
							</form>
						</div>
						<div class="fm-options-wrap">	
							
							<a class="btn btn-icon btn-flush-dark flush-soft-hover dropdown-toggle no-caret active ms-lg-0 d-sm-inline-block d-none" href="#" data-bs-toggle="dropdown"><span class="icon"><span class="feather-icon"><i data-feather="list"></i></span></span></a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="${path}/messageview"><span class="feather-icon dropdown-icon"><i data-feather="list"></i></span><span>목록으로 보기</span></a>
								<a class="dropdown-item active" href="${path}/msgFileView"><span class="feather-icon dropdown-icon"><i data-feather="grid"></i></span><span>첨부파일만 보기</span></a>
							</div>
							<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
								<span class="icon">
									<span class="feather-icon"><i data-feather="chevron-up"></i></span>
									<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
								</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable"></div>
					</header>
			<!--/ MSG Header Line END-->
			


			
	