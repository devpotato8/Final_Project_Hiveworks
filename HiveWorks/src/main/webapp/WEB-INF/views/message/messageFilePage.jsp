<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/message/msgSideHeader.jsp">
	<jsp:param value="첨부파일함" name="nameofmsglist"/>
</jsp:include>

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

<!-- Data Table JS -->
<script src="${path}/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${path}/resources/vendors/jszip/dist/jszip.min.js"></script>
<script src="${path}/resources/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="${path}/resources/vendors/pdfmake/build/vfs_fonts.js"></script>
<script src="${path}/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-select/js/dataTables.select.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-fixedcolumns/js/dataTables.fixedColumns.min.js"></script>
<script src="${path}/resources/vendors/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>	

<!-- font-awesome -->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
							
<!-- MSG Main Content -->		

<div class="fm-body">
<c:if test="${empty msgList}">
<div class="alert alert-warning alert-wth-icon alert-dismissible fade show mt-5" role="alert">
					<span class="alert-icon-wrap"><i class="ri-alert-line"></i></span>
					<div class="d-flex align-items-center flex-wrap flex-sm-nowrap">
						<p>수신된 첨부파일이 없습니다</p>
					</div>
				</div>
</c:if>
<c:if test="${not empty msgList}">
	<div data-simplebar class="nicescroll-bar">
	<div class="input-affix-wrapper input-search w-300p mb-3">
		<input type="text" class="form-control card-search" placeholder="검색어를 입력하세요"  aria-describedby="basic-addon1">
		<span class="input-suffix"><span class="btn-input-clear"><i class="bi bi-x-circle-fill"></i></span>
			<span class="spinner-border spinner-border-sm input-loader text-primary" role="status">
				<span class="sr-only">Loading...</span>
			</span>
		</span>
	</div>
		<div class="file-card-view">
		
			
					
			<div class="collapse-simple mt-2">
				<div class="card imgContainer">
					<div class="card-header">
						<a role="button" data-bs-toggle="collapse" href="#fm_collapse_1" aria-expanded="true">
							<h5 class="mb-0">사진 파일</h5>
						</a>
					</div>
					<div id="fm_collapse_1" class="collapse show" >
						<div class="row gx-3 row-cols-xxl-6 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-3">
							<c:forEach var="msg" items="${msgList}">
								<c:choose>
									<c:when test="${(fn:endsWith(msg.msg_file_oriname, '.jpg')
											or fn:endsWith(msg.msg_file_oriname, '.jpeg')
											or fn:endsWith(msg.msg_file_oriname, '.png')
											or fn:endsWith(msg.msg_file_oriname, '.bmp')
											or fn:endsWith(msg.msg_file_oriname, '.gif') )}">
										<div class="col">
											<div  class="card file-card card-border fmapp-info-trigger">
												<div class="card-body me-3">
													<img src="${path}/resources/msgupload/${msg.msg_file_rename}"  style="width:100px; height:100px;">
												</div>
												<div class="card-footer">
													<div class="d-flex justify-content-between align-items-start">
														<div>
															<span class="fileMsgNo"style="display:none">${msg.msg_no}</span>
															<div class="file-name fileOriName"><c:out value="${msg.msg_file_oriname}"/></div>
															<div class="text-truncate fs-8 mb-2"><c:out value="${msg.msg_file_size}"/></div>
															<div class="text-truncate fs-8 fileMsgDate">${msg.msg_date}</div>
															<span class="fileMsgReceiver" style="display:none">${msg.msg_receiver_no}</span>
															<div class="text-truncate fs-8 mb-2 fileMsgSender">보낸사람 - ${msg.msg_sender_name}</div>
														</div>
														<div class="d-flex">
															<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
															<div class="dropdown-menu">
																<a class="dropdown-item flieDetailView" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>자세히 보기</span></a>
																<a class="dropdown-item fileDownAction" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>첨부파일 다운로드</span></a>
																<a class="dropdown-item fileDeletAction" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>첨부파일 삭제하기</span></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="collapse-simple mt-4">
				<div class="card docContainer">
					<div class="card-header">
						<a role="button" data-bs-toggle="collapse" href="#fm_collapse_2" aria-expanded="true">
							<h5 class="mb-0">문서 파일</h5>
						</a>
					</div>
					<div id="fm_collapse_2" class="collapse show">
						<div class="row gx-3 row-cols-xxl-5 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-4">
							<c:forEach var="msg" items="${msgList}">
							<c:choose>
							<c:when test="${(fn:endsWith(msg.msg_file_oriname, '.doc')
										or fn:endsWith(msg.msg_file_oriname, '.docx')
										or fn:endsWith(msg.msg_file_oriname, '.pdf')
										or fn:endsWith(msg.msg_file_oriname, '.xls')
										or fn:endsWith(msg.msg_file_oriname, '.xlsx')
										or fn:endsWith(msg.msg_file_oriname, '.ppt')
										or fn:endsWith(msg.msg_file_oriname, '.pptx')
										or fn:endsWith(msg.msg_file_oriname, '.hwp')
										or fn:endsWith(msg.msg_file_oriname, '.txt') )}">
							<div class="col" style="width:300px;">
								<div class="card file-compact-card card-border fmapp-info-trigger">
									<div class="card-body d-flex justify-content-between">
										<div class="media">
											<c:choose>
											<c:when test="${fn:endsWith(msg.msg_file_oriname, '.pdf')}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-danger avatar-sm">
														<span class="initial-wrap">
															<i class="fa-regular fa-file-pdf" style="color: #ff0000;"></i>
														</span>
													</div>
												</div>
											</c:when>
											<c:when test="${fn:endsWith(msg.msg_file_oriname, '.txt')}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
														<span class="initial-wrap">
															<i class="ri-file-text-fill"></i>
														</span>
													</div>
												</div>
											</c:when>
											<c:when test="${(fn:endsWith(msg.msg_file_oriname, '.doc') 
													or fn:endsWith(msg.msg_file_oriname, '.docx'))}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
														<span class="initial-wrap">
															<i class="ri-file-word-2-fill"></i>
														</span>
													</div>
												</div>
											</c:when>
											<c:when test="${fn:endsWith(msg.msg_file_oriname, '.zip')}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-warning avatar-sm">
														<span class="initial-wrap">
															<i class="ri-folder-zip-fill"></i>
														</span>
													</div>
												</div>
											</c:when>
											<c:when test="${(fn:endsWith(msg.msg_file_oriname, '.xls') 
													or fn:endsWith(msg.msg_file_oriname, '.xlsx'))}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-success avatar-sm">
														<span class="initial-wrap">
															<i class="ri-file-excel-2-fill"></i>
														</span>
													</div>
												</div>
											</c:when>
											<c:when test="${(fn:endsWith(msg.msg_file_oriname, '.ppt') 
													or fn:endsWith(msg.msg_file_oriname, '.pptx'))}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-danger avatar-sm">
														<span class="initial-wrap">
															<i class="fa-regular fa-file-powerpoint" style="color: #ff0000;"></i>
														</span>
													</div>
												</div>
											</c:when>
											<c:when test="${fn:endsWith(msg.msg_file_oriname, '.hwp')}">
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
														<span class="initial-wrap">
															<i class="fa-regular fa-file-lines" style="color: #0080ff;"></i>
														</span>
													</div>
												</div>
											</c:when>
											</c:choose>
											<div class="media-body">
												<span class="fileMsgNo"style="display:none">${msg.msg_no}</span>
												<div class="file-name fileOriName"><c:out value="${msg.msg_file_oriname}"/></div>
												<div class="text-truncate fs-8 mb-2"><c:out value="${msg.msg_file_size}"/></div>
												<div class="text-truncate fs-8 fileMsgDate">${msg.msg_date}</div>
												<span class="fileMsgReceiver" style="display:none">${msg.msg_receiver_no}</span>
												<div class="text-truncate fs-8 mb-2 fileMsgSender">보낸사람 - ${msg.msg_sender_name}</div>
											</div>
										</div>
										<div class="d-flex">
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item flieDetailView" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item fileDownAction" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item fileDeletAction" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:when>
							</c:choose>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="collapse-simple mt-4">
				<div class="card filesContainer">
					<div class="card-header">
						<a role="button" data-bs-toggle="collapse" href="#fm_collapse_3" aria-expanded="true">
							<h5 class="mb-0">기타 파일</h5>
						</a>
					</div>
					<div id="fm_collapse_3" class="collapse show">
						<div class="row gx-3 row-cols-xxl-5 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-4">
						<c:forEach var="msg" items="${msgList}">
							<c:choose>
							<c:when test="${fn:endsWith(msg.msg_file_oriname, '.zip')}">
							<div class="col"  style="width:300px;">
								<div class="card file-compact-card card-border fmapp-info-trigger">
									<div class="card-body d-flex justify-content-between">
										<div class="media">
											<div class="media-head me-3">
												<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
													<span class="initial-wrap">
														<i class="ri-folder-zip-fill"></i>
													</span>
												</div>
											</div>
											<div class="media-body" >
												<span class="fileMsgNo"style="display:none">${msg.msg_no}</span>
												<div class="file-name fileOriName"><c:out value="${msg.msg_file_oriname}"/></div>
												<div class="text-truncate fs-8 mb-2"><c:out value="${msg.msg_file_size}"/></div>
												<div class="text-truncate fs-8 fileMsgDate">${msg.msg_date}</div>
												<span class="fileMsgReceiver" style="display:none">${msg.msg_receiver_no}</span>
												<div class="text-truncate fs-8 mb-2 fileMsgSender">보낸사람 - ${msg.msg_sender_name}</div>
											</div>
										</div>
										<div class="d-flex">
											<a class="btn btn-xs btn-icon btn-flush-dark btn-rounded flush-soft-hover flex-shrink-0" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
											<div class="dropdown-menu">
												<a class="dropdown-item flieDetailView" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>Preview</span></a>
												<a class="dropdown-item fileDownAction" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Download</span></a>
												<a class="dropdown-item fileDeletAction" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:when>
							</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
</div>



<script>





//검색창
$(".card-search").on("keyup", function() {
	var value4 = $(this).val().toLowerCase();
	$(".card").parent().filter(function() {
	$(this).toggle($(this).text().toLowerCase().indexOf(value4) > -1)
	});
});

//확장자명 추출
$(document).ready(function(){
    $(".file-name").each(function() {
        var fileName = $(this).text();
        var extension = fileName.split('.').pop();
        var fileSize = $(this).next().text();
        $(this).next().text(extension + ' 파일' + ' / ' + fileSize);
    });
});




</script>
    