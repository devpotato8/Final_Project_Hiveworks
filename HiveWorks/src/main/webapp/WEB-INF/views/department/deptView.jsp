<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
</jsp:include>

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<!-- jstree -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- FeatherIcons JS -->
<script src="${path}/resources/js/feather.min.js"></script>

<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

<!-- Main Content -->
<div class="hk-pg-wrapper">
	<div class="container-xxl">
		
	<!-- Page Header -->
	<div class="hk-pg-header pg-header-wth-tab pt-7">
		<div class="d-flex">
			<div class="flex-1">
				<h1 class="pg-title">조직 관리</h1>
				<p class="p-lg col-lg-8">조직도로 부서관리를 하거나, 구성원들을 관리할 수 있습니다</p>
			</div>
		</div>
		<ul class="nav nav-line nav-light nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-bs-toggle="tab" href="#tab_block_1">
					<span class="nav-link-text">조직도 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-bs-toggle="tab" href="#tab_block_2">
					<span class="nav-link-text">구성원 관리</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- /Page Header -->

	<!-- Page Body -->
	<div class="hk-pg-body">
		<div class="tab-content">
			<!-- 조직도관리 -->
			<div class="tab-pane fade show active" id="tab_block_1">
				<div class="row">
					<div class="col-xl-10">
					
						<div class="title-lg fs-5"><span>부서 관리</span></div>
						<p class="mb-4">부서는 레벨5까지 추가 가능합니다</p>
						
    <div id="jstree">
        <ul>
            <li id="root">Root node
                <ul>
                    <li class="group" id="groupA">A 그룹
                        <ul>
                            <li id="child1">Child node 1</li>
                            <li id="child2">Child node 2</li>
                        </ul>
                    </li>
                    <li class="group" id="groupB">B 그룹
                        <ul>
                            <li id="child3">Child node 3</li>
                            <li id="child4">Child node 4</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

    <button id="confirmationBtn">선택확인</button>

<script>
/* $(document).ready(function() {
	$("#jstree").jstree("open_all");
});
    
$(function () {
	$('#jstree').jstree({
	    'plugins': [
	    	"contextmenu",
	    	"dnd",
	    	"search",
	    	"checkbox",
	    	"unique"
	   	]
	});
}); */
$(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
</script>	
						
						
						
						<div class="text-end mt-5">
							<button class="btn btn-primary btn-rounded">
								부서 일괄 등록
							</button>
						</div>
						<div class="text-end mt-5">
							<button class="btn btn-primary btn-rounded">
								변경사항 저장
							</button>
						</div>
					
					</div>
				</div>	
			</div>
			<!-- /조직도 관리 -->
			
			
			<div class="tab-pane fade" id="tab_block_2">
				<div class="row">
					<div class="col-md-8">
						<div class="title-lg fs-5"><span>Social profile links</span></div>
						<p class="mb-4">Connect your social media accounts for one-click sharing.</p>
						<form>
							<div class="form-group">
								<label class="form-label">Facebook</label>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="dist/img/symbol-avatar-17.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8" placeholder="Username" value="Hencework">
										<a href="#" class="input-suffix text-muted"><span class="feather-icon"><i data-feather="edit-3"></i></span></a>
									</span>
								</div>
								<small class="form-text text-muted">
									One-click sign in
								</small>
							</div>
							<div class="form-group">
								<label class="form-label">Twitter</label>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="dist/img/symbol-avatar-18.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8" placeholder="Username">
										<a href="#" class="input-suffix text-muted"><span class="feather-icon"><i data-feather="edit-3"></i></span></a>
									</span>
								</div>
								<small class="form-text text-muted">
									One-click sign in
								</small>
							</div>
							<div class="form-group mb-5">
								<label class="form-label">Linkedin</label>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="dist/img/symbol-avatar-19.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8" placeholder="Username">
										<a href="#" class="input-suffix text-muted"><span class="feather-icon"><i data-feather="edit-3"></i></span></a>
									</span>
								</div>
								<div class="form-check form-check-sm mt-2">
									<input type="checkbox" class="form-check-input" id="customCheckList4" checked>
									<label class="form-check-label" for="customCheckList4">
										This is a company account
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">Connect</label>
								<div class="input-group mb-3">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="dist/img/symbol-avatar-6.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8 pe-15" placeholder="Behance">
										<span class="input-suffix"><button class="btn btn-sm btn-outline-primary">
											connect
										</button></span>
									</span>
								</div>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="dist/img/symbol-avatar-5.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8 pe-15" placeholder="Dribbble">
										<span class="input-suffix"><button class="btn btn-sm btn-outline-primary">
											connect
										</button></span>
									</span>
								</div>
							</div>
						</form>
						<div class="text-end mt-6">
							<button class="btn btn-primary btn-rounded">
								Save changes
							</button>
						</div>
					</div>
				</div>	
			</div>
			<div class="tab-pane fade" id="tab_block_3">
				<div class="row">
					<div class="col-md-8">
						<div class="title-lg fs-5"><span>App Integrations</span></div>
						<p class="mb-4">Connect suitable apps with your app and get notifications wherever you go</p>
						<ul class="advance-list">
							<li class="advance-list-item transform-none shadow-none">
								<div class="d-flex align-items-center justify-content-between">
									<div class="media align-items-center">
										<div class="media-head me-3">
											<div class="avatar">
												<img src="dist/img/symbol-avatar-6.png" alt="user" class="avatar-img">
											</div>
										</div>
										<div class="media-body">
											<div class="text-dark fw-medium">Behance</div>
											<div class="fs-7">Design Platform</div>
										</div>
									</div>
									<button class="btn mnw-125p btn-outline-primary">
										Connect
									</button>
								</div>
							</li>
							<li class="advance-list-item transform-none shadow-none">
								<div class="d-flex align-items-center justify-content-between">
									<div class="media align-items-center">
										<div class="media-head me-3">
											<div class="avatar">
												<img src="dist/img/symbol-avatar-5.png" alt="user" class="avatar-img">
											</div>
										</div>
										<div class="media-body">
											<div class="text-dark fw-medium">Dribble</div>
											<div class="fs-7">Portfolio</div>
										</div>
									</div>
									<button class="btn mnw-125p btn-outline-danger">
										Disconnect
									</button>
								</div>
							</li>
							<li class="advance-list-item transform-none shadow-none">
								<div class="d-flex align-items-center justify-content-between">
									<div class="media align-items-center">
										<div class="media-head me-3">
											<div class="avatar">
												<img src="dist/img/symbol-avatar-14.png" alt="user" class="avatar-img">
											</div>
										</div>
										<div class="media-body">
											<div class="text-dark fw-medium">Intercom</div>
											<div class="fs-7">Chat Integrations</div>
										</div>
									</div>
									<button class="btn mnw-125p btn-outline-primary">
										Connect
									</button>
								</div>
							</li>
							<li class="advance-list-item transform-none shadow-none">
								<div class="d-flex align-items-center justify-content-between">
									<div class="media align-items-center">
										<div class="media-head me-3">
											<div class="avatar">
												<img src="dist/img/symbol-avatar-16.png" alt="user" class="avatar-img">
											</div>
										</div>
										<div class="media-body">
											<div class="text-dark fw-medium">Gitlab</div>
											<div class="fs-7">Developer Platform</div>
										</div>
									</div>
									<button class="btn mnw-125p btn-outline-primary">
										Connect
									</button>
								</div>
							</li>
						</ul>
						<div class="text-end mt-6">
							<button class="btn btn-primary btn-rounded">
								Save changes
							</button>
						</div>
					</div>
				</div>	
			</div>
			<div class="tab-pane fade" id="tab_block_4">
				<div class="row">
					<div class="col-lg-8">
						<div class="title-lg fs-5 justify-content-between mb-5"><span>Saved Cards</span>
							<button class="btn btn-outline-light">
								+ Add new card
							</button>
						</div>
						
						<ul class="advance-list">
							<li class="advance-list-item transform-none shadow-none py-3">
								<div class="d-flex align-items-center justify-content-between">
									<div class="media align-items-center">
										<div class="media-head me-5">
											<img src="dist/img/card-visa.png" alt="user" class="img-fluid">
										</div>
										<div class="media-body">
											<div>
												<span class="text-dark fw-medium">****4213</span>
												<span class="badge badge-soft-primary rounded-0 ms-3">Primary</span>
											</div>
										</div>
									</div>
									<div  class="d-lg-inline d-none">
										<span class="fs-7 text-muted me-5 d-xl-inline d-none">Last updated 12/03/2022</span>
										<button class="btn mnw-100p btn-outline-danger me-2">
											Delete
										</button>
										<button class="btn mnw-100p btn-light">
											Edit
										</button>
									</div>
								</div>
							</li>
							<li class="advance-list-item transform-none shadow-none py-3">
								<div class="d-flex align-items-center justify-content-between">
									<div class="media align-items-center">
										<div class="media-head me-5">
											<img src="dist/img/mastercard.png" alt="user" class="img-fluid">
										</div>
										<div class="media-body">
											<div>
												<span class="text-dark fw-medium">****1214</span>
											</div>
										</div>
									</div>
									<div class="d-lg-inline d-none">
										<span class="fs-7 text-muted me-5 d-xl-inline d-none">Last updated 25/04/2022</span>
										<button class="btn mnw-100p btn-outline-danger me-2">
											Delete
										</button>
										<button class="btn mnw-100p btn-light">
											Edit
										</button>
									</div>
								</div>
							</li>
						</ul>
						<div class="text-end mt-6">
							<button class="btn btn-primary btn-rounded">
								Save changes
							</button>
						</div>
					</div>
				</div>	
			</div>
			<div class="tab-pane fade" id="tab_block_5">
				<div class="row">
					<div class="col-lg-8">
						<div class="title-lg fs-5"><span>My Addresses</span></div>
						<div class="row gx-3">
							<div class="col-md-4">
								<div class="card card-border mnh-250p">
									<div class="card-body">
										<div class="card-action-wrap">
											<a class="btn btn-sm btn-icon btn-rounded btn-flush-danger flush-soft-hover card-close"  href="#"><span class="icon"><span class="feather-icon"><i data-feather="trash-2"></i></span><span class="feather-icon d-none"><i data-feather="minimize"></i></span></span></a>
											<a class="btn btn-sm btn-icon btn-rounded btn-flush-dark flush-soft-hover"><span class="icon"><span class="feather-icon"><i data-feather="edit-2"></i></span></span></a>
										</div>
										<i class="bi bi-house-door-fill fs-3 d-block mb-1 text-primary"></i>
										<h5>Home</h5>
										<p class="card-text">3421 Central Ave NE, Albuquerque, New York - 87106
											</p>
										<span class="badge badge-soft-primary">Primary</span>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card card-border mnh-250p">
									<div class="card-body">
										<div class="card-action-wrap">
											<a class="btn btn-sm btn-icon btn-rounded btn-flush-danger flush-soft-hover card-close"  href="#"><span class="icon"><span class="feather-icon"><i data-feather="trash-2"></i></span><span class="feather-icon d-none"><i data-feather="minimize"></i></span></span></a>
											<a class="btn btn-sm btn-icon btn-rounded btn-flush-dark flush-soft-hover"><span class="icon"><span class="feather-icon"><i data-feather="edit-2"></i></span></span></a>
										</div>
										<i class="bi bi-shield-fill-check fs-3 d-block mb-1 text-primary"></i>
										<h5>Office</h5>
										<p class="card-text">2035 7th St, Clanton, Alaska, 35045</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card card-border border-dashed mnh-250p">
									<div class="card-body d-flex align-items-center justify-content-center">
										<button class="btn btn-outline-light btn-block" data-bs-toggle="modal" data-bs-target="#add_new_board"><span data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Add New Address"><span class="icon"><span class="feather-icon"><i data-feather="plus"></i></span></span></span></button>
									</div>
								</div>
							</div>
						</div>
						<div class="text-end mt-6">
							<button class="btn btn-primary btn-rounded">
								Save changes
							</button>
						</div>
					</div>
				</div>	
			</div>
			</div>
		</div>
	</div>
	<!-- /Page Body -->		
</div>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
