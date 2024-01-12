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

<%@ include file="/WEB-INF/views/message/msgSideHeader.jsp" %>
							
<!-- MSG Main Content -->		

<div class="fm-body">
	<div data-simplebar class="nicescroll-bar">
		<div class="file-card-view">
			<div class="alert alert-warning alert-wth-icon alert-dismissible fade show" role="alert">
				<span class="alert-icon-wrap"><i class="ri-alert-line"></i></span>
				<div class="d-flex align-items-center flex-wrap flex-sm-nowrap">
					You must provide value for account name.
					<a href="#" class="btn btn-sm btn-warning ms-sm-auto mt-sm-0 mt-2 flex-shrink-0">Upgrade Storage</a>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<div class="collapse-simple mt-4">
				<div class="card">
					<div class="card-header">
						<a role="button" data-bs-toggle="collapse" href="#fm_collapse_1" aria-expanded="true">
							<h5 class="mb-0">Quick Access</h5>
						</a>
					</div>
					<div id="fm_collapse_1" class="collapse show">
						<div class="row gx-3 row-cols-xxl-6 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-3">
							<div class="col">
								<div  class="card file-card card-border">
									<div class="card-body fmapp-info-trigger">
										<i class="ri-file-excel-2-fill text-blue"></i>
									</div>
									<div class="card-footer">
										<div class="d-flex justify-content-between align-items-start">
											<div>
												<div class="file-name">Website_content.exl</div>
												<div class="text-truncate fs-8 mb-2">2,637 KB</div>
											</div>
											<div class="d-flex">
												<span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
												<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
												</div>
											</div>
										</div>
										<p class="text-truncate p-xs">Last Access: 2 hours ago</p>
									</div>
								</div>
							</div>
							<div class="col">
								<div  class="card file-card card-border">
									<div class="card-body fmapp-info-trigger">
										<i class="ri-file-pdf-fill text-danger"></i>
									</div>
									<div class="card-footer">
										<div class="d-flex justify-content-between align-items-start">
											<div>
												<div class="file-name">Website_content.exl</div>
												<div class="text-truncate fs-8 mb-2">21.73 MB</div>
											</div>
											<div class="d-flex">
												<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
												<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
												</div>
											</div>
										</div>
										<p class="text-truncate p-xs">Last Access: 2 hours ago	</p>
									</div>
								</div>
							</div>
							<div class="col">
								<div  class="card file-card card-border">
									<div class="card-body fmapp-info-trigger">
										<i class="ri-file-word-2-fill text-blue"></i>
									</div>
									<div class="card-footer">
										<div class="d-flex justify-content-between align-items-start">
											<div>
												<div class="file-name">jampack.doc</div>
												<div class="text-truncate fs-8 mb-2">951 KB</div>
											</div>
											<div class="d-flex">
												<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
												<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
												</div>
											</div>
										</div>
										<p class="text-truncate p-xs">Last Access: 2 hours ago</p>
									</div>
								</div>
							</div>
							<div class="col">
								<div  class="card file-card card-border">
									<div class="card-body fmapp-info-trigger">
										<i class="ri-folder-2-fill text-warning"></i>
									</div>
									<div class="card-footer">
										<div class="d-flex justify-content-between align-items-start">
											<div>
												<div class="file-name">Jampack - html - v1.0</div>
												<div class="text-truncate fs-8 mb-2">1.6 GB</div>
											</div>
											<div class="d-flex">
												<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
												<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
												</div>
											</div>
										</div>
										<p class="text-truncate p-xs">Last Access: 2 hours ago</p>
									</div>
								</div>
							</div>
							<div class="col">
								<div  class="card file-card card-border">
									<div class="card-body fmapp-info-trigger">
										<i class="ri-folder-2-fill text-warning"></i>
									</div>
									<div class="card-footer">
										<div class="d-flex justify-content-between align-items-start">
											<div>
												<div class="file-name">Jampack - Angular</div>
												<div class="text-truncate fs-8 mb-2">2,637 KB</div>
											</div>
											<div class="d-flex">
												<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
												<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
													<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
												</div>
											</div>
										</div>
										<p class="text-truncate p-xs">Last Access: 2 hours ago</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="collapse-simple mt-4">
				<div class="card">
					<div class="card-header">
						<a role="button" data-bs-toggle="collapse" href="#fm_collapse_2" aria-expanded="true">
							<h5 class="mb-0">Folders</h5>
						</a>
					</div>
					<div id="fm_collapse_2" class="collapse show">
						<div class="row gx-3 row-cols-xxl-5 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-4">
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-sm avatar-soft-warning">
													<span class="initial-wrap"><i class="ri-folder-2-fill"></i></span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">Jampack - HTML - v1.0</div>
												<div class="text-truncate fs-8 mb-2">1.6 GB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-sm avatar-soft-warning">
													<span class="initial-wrap"><i class="ri-folder-2-fill"></i></span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">Jampack - Angular</div>
												<div class="text-truncate fs-8 mb-2">2,635 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-sm avatar-soft-warning">
													<span class="initial-wrap"><i class="ri-folder-2-fill"></i></span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">Designs</div>
												<div class="text-truncate fs-8 mb-2">1.48 GB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-sm avatar-soft-warning">
													<span class="initial-wrap"><i class="ri-folder-2-fill"></i></span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">Inspiration</div>
												<div class="text-truncate fs-8 mb-2">3.5 GB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="collapse-simple mt-4">
				<div class="card">
					<div class="card-header">
						<a role="button" data-bs-toggle="collapse" href="#fm_collapse_3" aria-expanded="true">
							<h5 class="mb-0">Files</h5>
						</a>
					</div>
					<div id="fm_collapse_3" class="collapse show">
						<div class="row gx-3 row-cols-xxl-5 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-4">
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
													<span class="initial-wrap">
														<i class="ri-file-excel-2-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">Website_content.exl</div>
												<div class="text-truncate fs-8 mb-2">2,635 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-danger avatar-sm">
													<span class="initial-wrap">
														<i class="ri-file-pdf-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">jampack.pdf</div>
												<div class="text-truncate fs-8 mb-2">21.73 MB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<img src="${path}/resources/img/gallery/mock7.jpg" alt="user" class="d-block img-fluid h-50p">
											</div>
											<div class="media-body">
												<div class="file-name">jonas-kakaroto-KIPqvvTxl</div>
												<div class="text-truncate fs-8 mb-2">4,178 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
													<span class="initial-wrap">
														<i class="ri-folder-zip-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">themeforest-pack.zip</div>
												<div class="text-truncate fs-8 mb-2">2.45 GB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-light avatar-sm">
													<span class="initial-wrap">
														<i class="ri-keynote-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">presentation.keynote</div>
												<div class="text-truncate fs-8 mb-2">20 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<img src="${path}/resources/img/gallery/mock5.jpg" alt="user" class="d-block img-fluid h-50p">
											</div>
											<div class="media-body">
												<div class="file-name">joel-mott-LaK153ghdig</div>
												<div class="text-truncate fs-8 mb-2">2,635 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
													<span class="initial-wrap">
														<i class="ri-file-text-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">expenses.doc</div>
												<div class="text-truncate fs-8 mb-2">2,635 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
													<span class="initial-wrap">
														<i class="ri-file-text-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">minutes_meeting.doc</div>
												<div class="text-truncate fs-8 mb-2">2,635 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card file-compact-card card-border">
									<div class="card-body d-flex justify-content-between">
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-sm avatar-soft-blue">
													<span class="initial-wrap">
														<i class="ri-file-word-2-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">proposal.doc</div>
												<div class="text-truncate fs-8 mb-2">951 KB</div>
											</div>
										</div>
										<div class="d-flex">
											<span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="skip-forward"></i></span><span>Move</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="user-plus"></i></span><span>Invite</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="link-2"></i></span><span>Share Link</span></a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="info"></i></span><span>View Details</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
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
	<div class="file-info">
	<div data-simplebar class="nicescroll-bar">
		<button type="button" class="info-close btn-close">
			<span aria-hidden="true">×</span>
		</button>
		<div class="file-name">bruce-mars-fiEG-PkjG</div>
		<span>JPG File</span>
		<img src="${path}/resources/img/gallery/mock2.jpg" alt="user" class="d-block img-fluid my-4 w-250p">
											
		<ul class="nav nav-justified nav-light nav-tabs nav-segmented-tabs active-theme mt-5">
			<li class="nav-item">
				<a class="nav-link active" data-bs-toggle="tab" href="#tab_info">
					<span class="nav-link-text">Details</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-bs-toggle="tab" href="#tab_activity">
					<span class="nav-link-text">Activity</span>
				</a>
			</li>
		</ul>
		<div class="tab-content mt-5">
			<div class="tab-pane fade show active" id="tab_info">
				<div class="collapse-simple">
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#fl_info" aria-expanded="true">Specification</a>
						</div>
						<div id="fl_info" class="collapse show">
							<div class="card-body">
								<ul class="fm-info">
									<li>
										<span>Date Modified</span>
										<span>20, Nov 2020</span>
									</li>
									<li>
										<span>Size</span>
										<span>15.2 GB</span>
									</li>
									<li>
										<span>Created by</span>
										<span>Morgan Freeman</span>
									</li>
									<li>
										<span>Date Created</span>
										<span>12, Nov 2020</span>
									</li>
									<li>
										<span>Dimension</span>
										<span>1950 x 1245</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#shared_with" aria-expanded="true">Shared with </a>
						</div>
						<div id="shared_with" class="collapse show">
							<div class="card-body">
								<ul class="hk-list">
									<li>
										<div class="avatar avatar-sm avatar-primary position-relative avatar-rounded">
											<img src="${path}/resources/img/avatar9.jpg" alt="user" class="avatar-img">
											<div class="badge-icon badge-circle text-blue badge-icon-xxs position-bottom-end-overflow-1">
												<div class="badge-icon-wrap">
													<i class="ri-upload-2-fill"></i>
												</div>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 127 127">
													<g data-name="Ellipse 302" transform="translate(8 8)" stroke-width="3">
													<circle cx="55.5" cy="55.5" r="55.5" stroke="currentColor"></circle>
													<circle cx="55.5" cy="55.5" r="59.5" fill="currentColor"></circle>
													</g>
												</svg>
											</div>
										</div>
									</li>
									<li>
										<div class="avatar avatar-sm  avatar-rounded">
											<img src="${path}/resources/img/avatar10.jpg" alt="user" class="avatar-img">
										</div>
									</li>
									<li>	
										<div class="avatar avatar-sm avatar-soft-danger avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Winston">
											<span class="initial-wrap">W</span>
										</div>
									</li>
									<li>	
										<a href="#" class="avatar avatar-sm avatar-icon avatar-soft-light avatar-rounded" data-bs-toggle="modal" data-bs-target="#invite_people">
											<span class="initial-wrap" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Add New">
												<span class="feather-icon"><i data-feather="plus"></i></span>
											</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#settings" aria-expanded="true">Settings </a>
						</div>
						<div id="settings" class="collapse show">
							<div class="card-body">
								<ul class="fm-action">
									<li>
										<a href="javascript:void(0);">
											<span class="text-danger">Delete File</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											Somthing's Wrong
										</a>
									</li>
								</ul>	
								<a href="#" class="d-block text-dark fs-7 mb-2">Give feedback and report conversation</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="tab_activity">
					<div class="collapse-simple">
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#act_info1" aria-expanded="true">Yesterday</a>
						</div>
						<div id="act_info1" class="collapse show">
							<div class="card-body">
								<ul class="activity-list list-group list-group-flush">
									<li class="list-group-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-primary avatar-rounded">
													<span class="initial-wrap">H</span>
												</div>
											</div>
											<div class="media-body">
												<p><span class="text-dark">Hencework</span> is working on <a href="#" class="link-url"><u>https://assets.adobe.com/id/urn:aaid:sc:AP:5cebaf53-ca19-420a-aeeb-1517b04ab8c0?view=file</u></a></p>
												<div class="last-activity-time">3:15 PM</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-soft-danger avatar-rounded">
													<span class="initial-wrap">W</span>
												</div>
											</div>
											<div class="media-body">
												<p><span class="text-dark">Morgan Fregman</span> completed react conversion of <a href="#" class="link-default"><u>components</u></a></p>
												<div class="last-activity-time">3:15 PM</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#act_info2" aria-expanded="true">23 April</a>
						</div>
						<div id="act_info2" class="collapse show">
							<div class="card-body">
								<ul class="activity-list list-group list-group-flush">
									<li class="list-group-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-rounded">
													<img src="${path}/resources/img/avatar15.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<p><span class="text-dark">Hencework</span> is working on <a href="#" class="link-url"><u>https://assets.adobe.com/id/urn:aaid:sc:AP:5cebaf53-ca19-420a-aeeb-1517b04ab8c0?view=file</u></a></p>
												<div class="last-activity-time">3:15 PM</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-rounded">
													<img src="${path}/resources/img/avatar12.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<p><span class="text-dark">Morgan Fregman</span> completed react conversion of <a href="#" class="link-default"><u>components</u></a></p>
												<div class="last-activity-time">3:15 PM</div>
											</div>
										</div>
									</li>
								</ul>
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
	
	<!-- /Main Content -->

    <!-- /Wrapper -->

    
    <!-- jQuery -->
    <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="${path}/resources/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

	<!-- Simplebar JS -->
	<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
	
	<!-- Data Table JS -->
    <script src="${path}/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/vendors/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
	<script src="${path}/resources/vendors/datatables.net-select/js/dataTables.select.min.js"></script>
	
	<!-- Init JS -->
	<script src="${path}/resources/js/init.js"></script>
	<script src="${path}/resources/js/fm-data.js"></script>
	<script src="${path}/resources/js/chips-init.js"></script>