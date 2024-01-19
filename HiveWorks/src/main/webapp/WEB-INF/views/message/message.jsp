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
	
<%@ include file="/WEB-INF/views/message/msgSideHeader.jsp" %>

<fmt:formatDate value="${msg.msg_date}" pattern="yy-MM-dd HH:mm:ss"/>

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

<!-- jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js" integrity="sha512-ekwRoEshEqHU64D4luhOv/WNmhml94P8X5LnZd9FNOiOfSKgkY12cDFz3ZC6Ws+7wjMPQ4bPf94d+zZ3cOjlig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<style>
	.msgTitle{
		font-weight : bold;
		font-size : 1.0rem;
		white-space: nowrap; overflow:hidden; text-overflow:ellipsis; width:200px;
		cursor: pointer;
	}
	.msgTitle:hover{
		color :  #3d9ca5;
		cursor: pointer;
	}
	.msgContent{
		white-space: nowrap; overflow:hidden; text-overflow:ellipsis; width:200px;
		cursor: pointer;
	}
	.msg_sender{
		display:none;
	}
	.msg_receiver{
		display:none;
	}
	.msgFile{
		white-space: nowrap; overflow:hidden; text-overflow:ellipsis; width:200px;
	}
	

</style>

	

<!-- MSG Main Content -->		
<div class="fm-body">
	
	<div data-simplebar class="nicescroll-bar">
		<div class="list-view">
			<div class="text-start">
				<button class="btn btn-soft-primary moveStarBtn">별표 쪽지함으로</button>
				<button class="btn btn-soft-primary moveTrashBtn">휴지통으로</button>
			</div>
			<br>
			<div>
				<div class="file-list-view" id="cloud_doc">
					<div class="table-responsive">
						<table id="datable_4c" class="table nowrap w-100 mb-5">
							<thead>
								<tr>
									<th class="w-30p"><span class="form-check mb-0">
										<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
										<label class="form-check-label" for="customCheck1"></label>
									</span></th>
									<th>No</th>
									<th></th>
									<th>Message</th>
									<th>Content</th>
									<th>Shared with</th>
									<th>Action</th>
									<th>Send Date</th>
									<th style="display:none;"></th>
									<th style="display:none;"></th>
								</tr>
							</thead>
							<tbody>
				<c:if test="${not empty msgList}">
					<c:forEach var="msg" items="${msgList}">
								<tr>
									<td>									
										<div class="msg_no"><c:out value="${msg.msg_no}"/></div>
									</td>
									<td>
										<div class="d-flex align-items-center">
											 <c:choose>
										        <c:when test="${msg.msg_marked_yn eq 'Y'}">
										            <span class="file-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
										        </c:when>
										        <c:otherwise>
										            <span class="file-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
										        </c:otherwise>
										    </c:choose>
										</div>
									</td>
									<td>
										<div class="media fmapp-info-trigger">
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
											<c:when test="${(fn:endsWith(msg.msg_file_oriname, '.jpg')
													or fn:endsWith(msg.msg_file_oriname, '.jpeg')
													or fn:endsWith(msg.msg_file_oriname, '.png')
													or fn:endsWith(msg.msg_file_oriname, '.bmp')
													or fn:endsWith(msg.msg_file_oriname, '.gif') )}">
												<div class="media-head me-3">
													<img src="${path}/resources/msgupload/${msg.msg_file_rename}" alt="user" class="d-block img-fluid w-50p">
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
											
											<c:otherwise>
												<div class="media-head me-3">
													<div class="avatar avatar-icon avatar-soft-blue avatar-sm">
														<span class="initial-wrap">
															<i class="bi bi-chat-right-quote"></i>
														</span>
													</div>
												</div>
											</c:otherwise>
											
										</c:choose>
											<div class="media-body">
												<div class="msgTitle"><c:out value="${msg.msg_title}"/></div>
												<div class="msgFile">
													<a class="msgFileTag" title="${msg.msg_file_oriname}">
														<c:out value="${empty msg.msg_file_oriname ? '첨부파일 없음': msg.msg_file_oriname}"/>
													</a>
												</div>
											</div>
										</div>
									</td>
									<td><div class="msgContent"><c:out value="${msg.msg_content}"/></div></td>
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
									<td class="text-right"><a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>내용보기</span></a>
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="star"></i></span><span>별표 쪽지함으로</span></a>
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>첨부파일 다운</span></a>
											<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>쪽지 삭제</span></a>
										</div>
									</td>
									<td class="msg_date"><c:out value="${msg.msg_date}"/></td>
									<td class="msg_sender" style="display:none;"><c:out value="${msg.msg_sender}"/></td>
									<td class="msg_sender_name" style="display:none;"><c:out value="${msg.msg_sender_name}"/></td>
								</tr>
					</c:forEach>
				</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
<!-- 행 어디를 선택해도 checkbox 선택되도록 -->
$(document).on('click', 'td', function(event){
	// '.file-star'를 클릭했을 때는 동작안함.
    if ($(event.target).is('.file-star') || $(event.target).closest('.file-star').length) {
        return;
    }
    
    if (!$(event.target).is('input[type="checkbox"]')) {
        var checkbox = $(this).closest('tr').find('input[type="checkbox"]');
        checkbox.prop('checked', !checkbox.prop('checked'));
    }
});

$(document).on('click', '.file-star', function(event){
    event.stopPropagation();  //이벤트버블링 방지. 상위요소에 event영향 미치지 않도록 함.
    var $star = $(this);
    $star.toggleClass("marked");
    var msg_no = $star.closest('tr').find('.msg_no').text();
    var isMarked = $star.hasClass("marked");
    var url = isMarked ? '/starmark' : '/starunmark';
    
    $.ajax({
        url: url, 
        type: 'POST',
        data: {
            'msg_no': msg_no 
        },
        success: function(response) {
            if(response.status === 'success'){
                console.log(isMarked ? "즐겨찾기 설정 완료" : "즐겨찾기 해제 완료");
            } else {
                console.log(isMarked ? "즐겨찾기 설정 실패" : "즐겨찾기 해제 실패");
            }
        },
        error: function(error) {
            console.log("서버 연결 실패");
        }
    });
});


/*MultiRow Select Checkbox*/
/*Checkbox Add*/
var tdCnt=0;
$(' table#datable_4c tbody tr').each(function(){
	$('<td><span class="form-check"><input type="checkbox" class="form-check-input" id="chk_sel_'+tdCnt+'"><label class="form-check-label" for="chk_sel_'+tdCnt+'"></label></span></td>').prependTo($(this));
	tdCnt++;
});
/*DataTable Init*/
var targetDt1 = $('#datable_4c').DataTable({
	scrollX:  true,
	autoWidth: false,
	"columnDefs": [ {
		"searchable": false,
		"orderable": false,
		"targets": 0
	} ],
	"order": [[ 7, 'desc' ]],
	language: { 
		search: "",
		searchPlaceholder: "Search",
		sLengthMenu: "_MENU_items",
			paginate: {
				next: '<i class="ri-arrow-right-s-line"></i>', // or '→'
				previous: '<i class="ri-arrow-left-s-line"></i>' // or '←' 
			}
	},
	"drawCallback": function () {
		$('.dataTables_paginate > .pagination').addClass('custom-pagination pagination-simple');
	}
});


											
</script>

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>



