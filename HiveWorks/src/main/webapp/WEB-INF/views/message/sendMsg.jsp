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
		<div class="file-list-view">
			<div class="text-end">
				<button class="btn btn-soft-primary moveStarBtn">별표 쪽지함으로</button>
				<button class="btn btn-soft-primary moveTrashBtn">휴지통으로</button>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="cloud_doc">
					<div class="table-responsive">
						<table id="datable_1" class="table nowrap w-100 mb-5">
							<thead>
								<tr>
									<th class="w-30p"><span class="form-check mb-0">
										<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
										<label class="form-check-label" for="customCheck1"></label>
									</span></th>
									<th>Message</th>
									<th>Shared with</th>
									<th>Send Date</th>
									<th>File Size</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
										</div>
									</td>
									<td>
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
												<div>exel</div>
											</div>
										</div>
									</td>
									<td>
										<div class="avatar-group avatar-group-overlapped">
											<div class="avatar avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Dean">
												<img src="${path}/resources/img/avatar13.jpg" alt="user" class="avatar-img">
											</div>
											<div class="avatar avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Danial">
												<img src="${path}/resources/img/avatar14.jpg" alt="user" class="avatar-img">
											</div>
										</div>														
									</td>
									<td>Today 11:02 AM</td>
									<td>2,637KB</td>
									<td class="text-right"><a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>내용보기</span></a>
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="star"></i></span><span>별표 쪽지함으로</span></a>
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>첨부파일 다운</span></a>
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>쪽지 삭제</span></a>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
										</div>
									</td>
									<td>
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
												<div>document</div>
											</div>
										</div>
									</td>
									<td>
										<div class="avatar-group avatar-group-overlapped">
											<div class="avatar avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Dean">
												<img src="${path}/resources/img/avatar12.jpg" alt="user" class="avatar-img">
											</div>
										</div>														
									</td>
									<td>12 Feb, 12:30 PM</td>
									<td>76.3 KB</td>
									<td class="text-right"><a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
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
									</td>
								</tr>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
										</div>
									</td>
									<td>
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<img src="${path}/resources/img/gallery/mock8.jpg" alt="user" class="d-block img-fluid w-50p">
											</div>
											<div class="media-body">
												<div class="file-name">joel-mott-LaK153ghdigdss</div>
												<div>jpeg</div>
											</div>
										</div>
									</td>
									<td>
										-													
									</td>
									<td>02 Jan, 4:32 PM</td>
									<td>3,028 KB</td>
									<td class="text-right"><a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
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
									</td>
								</tr>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
										</div>
									</td>
									<td>
										<div class="media fmapp-info-trigger">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
													<span class="initial-wrap">
														<i class="ri-file-word-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div class="file-name">proposal.doc</div>
												<div>word document</div>
											</div>
										</div>
									</td>
									<td>
										<div class="avatar-group avatar-group-overlapped">
											<div class="avatar avatar-soft-success avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tom">
												<span class="initial-wrap">A</span>
											</div>
											<div class="avatar avatar-soft-success avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tom">
												<span class="initial-wrap">B</span>
											</div>
											<div class="avatar avatar-soft-success avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tom">
												<span class="initial-wrap">C</span>
											</div>
											<div class="avatar avatar-soft-primary avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tom">
												<span class="initial-wrap">D</span>
											</div>
										</div>														
									</td>
									<td>02 Jan, 9:45 AM</td>
									<td>951 KB</td>
									<td class="text-right"><a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
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
									</td>
								</tr>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
										</div>
									</td>
									<td>
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
												<div>zip</div>
											</div>
										</div>
									</td>
									<td>
										<div class="avatar-group avatar-group-overlapped">
											<div class="avatar avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Danial">
												<img src="${path}/resources/img/avatar12.jpg" alt="user" class="avatar-img">
											</div>
										</div>														
									</td>
									<td>10 Jun, 8:00 AM</td>
									<td>2.45 GB</td>
									<td class="text-right"><a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
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
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="file-info">
	<div data-simplebar class="nicescroll-bar">
		<div class="text-end">
			<button type="button" class="info-close btn-close">
				<span aria-hidden="false">×</span>
			</button>
		</div>
		<div class="file-name">쪽지 제목</div>
		<span>첨부파일종류(ex: JPG File)</span>
		
		
		<div class="tab-content mt-5">
			<div class="tab-pane fade show active" id="tab_info">
				<div class="collapse-simple">
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#fl_info" aria-expanded="true">쪽지 정보</a>
						</div>
						<div id="fl_info" class="collapse show">
							<div class="card-body">
								<ul class="fm-info">
									<li>
										<span>보낸사람</span>
										<span>김이사</span>
									</li>
									<li>
										<span>받는사람</span>
										<span>내이름</span>  
									</li>
									<li>
										<span>첨부파일</span>
										<span>파일명.jpg</span>
									</li>
									<li>
										<span>전송일자</span>
										<span>00-00-00 23:00</span>
									</li>
									
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#fl_info" aria-expanded="true">쪽지 내용</a>
						</div>
						<div id="fl_info" class="collapse show">
							<div class="card-body">
								<ul class="fm-info">
									<li>
										<p class="msgContent">
											여기에 메시지 내용이 들어갈겁니다. 모든 국민은 능력에 따라 균등하게 교육을 받을 권리를 가진다. 국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는 국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.
										</p>
									</li>
									<li>
										<div class="text-end">
											<button class="btn btn-soft-primary btn-sm">000님에게 답장하기</button>
										</div>
									</li>
									<li>
										<span>첨부파일</span>
									</li>
									<li>
										<img src="${path}/resources/img/gallery/mock2.jpg"  class="d-block img-fluid my-4 w-250p">
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#shared_with" aria-expanded="true">함께 받은사람</a>
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
									
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<a role="button" data-bs-toggle="collapse" href="#settings" aria-expanded="true">설정하기</a>
						</div>
						<div id="settings" class="collapse show">
							<div class="card-body">
								<ul class="fm-action">
									<li>
										<a href="javascript:void(0);">
											<span class="text-danger">휴지통으로</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											별표 쪽지함으로
										</a>
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
		<!-- /MSG Main Content END-->		
	</div>
	<!-- /Page Body -->
</div>
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