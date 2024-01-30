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
	
<jsp:include page="/WEB-INF/views/message/msgSideHeader.jsp">
	<jsp:param value="쪽지 휴지통" name="nameofmsglist"/>
</jsp:include>

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
		font-size:0.8rem;
	}
	.msgCateName{
		font-size:0.6rem;
	}
	.headerContainer{
		display:flex;
		justify-content:space-between;
		align-items:center;
	}
	.msg_date{
		font-size:0.9rem;
	}
</style>

	

<!-- MSG Main Content -->		
<div class="fm-body">
	
	<div data-simplebar class="nicescroll-bar">
		<div class="list-view">
			<div class="headerContainer">
				<div class="text-start">
					<button class="btn btn-soft-primary returnMsgBtn">휴지통에서 꺼내기</button>
				</div>
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
									<th style="display:none;"></th>
									<th>Message Title</th>
									<th>Message Content</th>
									<th>Send Date</th>
									<th>Sender</th>
									<th>Action</th>
									<th style="display:none;"></th>
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
									<td style="display:none;">
										<div class="emp_no"><c:out value="${loginEmp.emp_no}"/></div>
									</td>
									
									<td>
										<div class="media fmapp-info-trigger attachfile">
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
												<div class="msgCateName mb-1"><c:out value="${empty msg.msg_category_name ? '미지정' : msg.msg_category_name}"/></div>
												<c:choose>
													<c:when test="${msg.msg_read_yn == 'Y'}">
														<div class="msgTitle mb-1"><c:out value="${msg.msg_title}"/></div>
													</c:when>
													<c:when test="${msg.msg_read_yn == 'N'}">
														<div class="msgTitle mb-1" style="font-weight:bolder;"><c:out value="${msg.msg_title}"/></div>
													</c:when>
												</c:choose>
												<div class="msgFile">
												<c:choose>
													<c:when test="${empty msg.msg_file_oriname}">
														<a class="msgFileTag" title="${msg.msg_file_oriname}" href="#">
	   														첨부파일 없음
	   													</a>
   													</c:when>
   													<c:when test="${not empty msg.msg_file_oriname}">
														<a class="msgFileTag" title="${msg.msg_file_oriname}" href="${path}/downfile?fn=${msg.msg_file_rename}">
	   														<c:out value="${msg.msg_file_oriname}"/>
	   													</a>
   													</c:when>
												</c:choose>
												</div>
											</div>
										</div>
									</td>
									<td><div class="msgContent"><c:out value="${msg.msg_content}"/></div></td>
									<td class="msg_date"><c:out value="${msg.msg_date}"/></td>
									<td>
										<div class="avatar-group avatar-group-overlapped">
											<div class="avatar avatar-rounded avatar-xs" data-bs-original-title="${msg.msg_sender_name}">
												<c:choose>
													<c:when test="${not empty msg.emp_profile_re_name}">
														<img src="${path}/resources/upload/profile/${msg.emp_profile_re_name}" alt="user" class="avatar-img">
													</c:when>
													<c:otherwise>
														<img src="${path}/resources/img/avatar12.jpg" alt="user" class="avatar-img">
													</c:otherwise>
												</c:choose>
												<span style="font-size:0.9rem">${msg.msg_sender_name}</span>
											</div>
										</div>														
									</td>
									<td class="text-right"><a class="actionbtn btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg></span></span></a>
										<div class="dropdown-menu">
											<a class="dropdown-item detailView" href="#"><span class="feather-icon dropdown-icon"><i data-feather="eye"></i></span><span>내용보기</span></a>
											
											<c:choose>
												<c:when test="${empty msg.msg_file_oriname}">
													<a class="dropdown-item filedown" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>첨부파일 다운</span></a>
												</c:when>
												<c:when test="${not empty msg.msg_file_oriname}">
													<a class="dropdown-item filedown" href="${path}/downfile?fn=${msg.msg_file_rename}"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>첨부파일 다운</span></a>
												</c:when>
											</c:choose>
											<a class="dropdown-item returnMsg" href="#"><span class="feather-icon dropdown-icon"><i data-feather="corner-down-left"></i></span><span>휴지통에서 꺼내기</span></a>
											
										</div>
									</td>
									<td class="msg_sender" style="display:none;"><c:out value="${msg.msg_sender_no}"/></td>
									<td class="msg_sender_name" style="display:none;"><c:out value="${msg.msg_sender_name}"/></td>
									<td class="msg_read_yn" style="display:none;"><c:out value="${msg.msg_read_yn}"/></td>
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
<!-- 보낸쪽지 회수하기 버튼 클릭 이벤트 jq -->

//체크된 행의 데이터를 저장할 배열
var selectedData = [];

//Ajax 요청
function btnAjax(selectedData, url){
	$.ajax({
	    url: path+url,  // 요청을 보낼 URL
	    type: 'POST',  // HTTP 메서드
	    data: JSON.stringify(selectedData),  // 전송할 데이터
	    contentType: 'application/json',  // 요청 본문의 형식
	    success: function(response) {
	    	if(response.status === 'success') {
	            alert("요청 처리 완료");
	            location.reload();
	        } else {
	            alert("요청 처리 실패");
	        }
	    },
	    error: function(error) {
	        // 요청이 실패했을 때의 처리
	        alert("서버 통신 실패. 관리자에게 문의하세요.")
	    }
	});
}

//체크된 행 데이터 가져오기 함수
function getSelectedData() {
	
	var newData=[];

  $('.listCheckBox:checked').each(function() {
      // 체크박스가 속한 행을 가져옴
      var $row = $(this).closest('tr');
	
      var msg_no = parseInt($row.find('td').eq(1).text());
      var emp_no = parseInt($row.find('td').eq(2).text());
		

      
      // 배열에 추가
      newData.push({
          msg_no: msg_no,
          emp_no: emp_no
      });
  });

  return newData;
}

//휴지통에서 꺼내기 버튼 클릭 이벤트
$(document).ready(function(){
    $('.returnMsgBtn').on('click', function() {
        if(selectedData && selectedData.length > 0) {
            if(confirm("선택한 쪽지들을 복구합니까?")) {
                btnAjax(selectedData, '/returnTrashBtn');
            } else {

            }
        } else {
            alert('복구할 쪽지들을 먼저 선택하세요');
        }
    });
});

<!-- 행 어디를 선택해도 checkbox 선택되도록 -->
$(document).on('click', 'td', function(event){
	// '.file-star'를 클릭했을 때는 동작안함.
    if ($(event.target).is('.file-star') || $(event.target).closest('.file-star').length) {
        return;
    }
	
    if ($(event.target).is('.actionbtn') || $(event.target).closest('.actionbtn').length) {
        return;
    }
    
    if (!$(event.target).is('input[type="checkbox"]')) {
        var checkbox = $(this).closest('tr').find('input[type="checkbox"]');
        checkbox.prop('checked', !checkbox.prop('checked'));
    }
});


<!-- data테이블관련 js -->
<!-- data테이블에서 생성된 버튼이나 check박스들은 여기서 jq를 직접 지정해주는 편이 좋다. -->
/*MultiRow Select Checkbox*/
/*Checkbox Add*/
var tdCnt=0;
$(' table#datable_4c tbody tr').each(function(){
	$('<td><span class="form-check"><input type="checkbox" class="form-check-input listCheckBox" id="chk_sel_'+tdCnt+'"><label class="form-check-label" for="chk_sel_'+tdCnt+'"></label></span></td>').prependTo($(this));
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
	"order": [[ 5, 'desc' ]],
	language: { 
		search: "",
		searchPlaceholder: "Search",
		sLengthMenu: "_MENU_items",
			paginate: {
				next: '<i class="ri-arrow-right-s-line"></i>', // or '→'
				previous: '<i class="ri-arrow-left-s-line"></i>' // or '←' 
			}
	},
	
	//data테이블이 그려질때마다 실행시킬 함수는 여기에 넣으면 됨.
	"drawCallback": function () {
		// 최상단 체크박스 클릭 이벤트
		$('thead input[type="checkbox"]').on('click', function() {
		  	// 최상단 체크박스의 체크 상태를 가져옴
		  	var isChecked = $(this).is(':checked');
		  
		  	// tbody의 모든 체크박스를 최상단 체크박스와 동일한 상태로 만듦
			$('tbody input[type="checkbox"]').prop('checked', isChecked);
		});
		
		$('.dataTables_paginate > .pagination').addClass('custom-pagination pagination-simple');
		
		//목록에서 카테고리이름 색상부여하기
		$(".media-body .msgCateName").each(function() {
	        var $msgCate = $(this);
	        var msg_cate_name = $msgCate.text().trim();

	        switch(msg_cate_name) {
	            case '긴급/중요':
	                $msgCate.css('color', 'red'); break;
	            case '업무연락':
	                $msgCate.css('color', '#5050FF'); break;
	            case '전체공지':
	                $msgCate.css('color', '#FFB914'); break;
	            case '답장':
	                $msgCate.css('color', '#50C785'); break;   
	            case '미지정':
	            	$msgCate.text('카테고리 없음');	break;
	            case '일반':
	            	$msgCate.css('color', 'black'); break;
	        }
	    });

		//쪽지리스트랑 Action 옵션에서 첨부파일 다운로드 클릭시
		$(".msgFileTag, .filedown").click(function(e) {
		    e.preventDefault();  // 버블링 방지
		
		    var downloadUrl = $(this).attr("href");

		    if(downloadUrl === '#'){
		        alert("첨부파일이 없습니다.");
		    }else{
		        // AJAX 요청으로 파일 존재 여부 확인
		        $.ajax({
		            url: path+downloadUrl,
		            type: "HEAD",  // HEAD 요청은 실제 파일을 다운로드하지 않고 메타데이터만 요청
		            error: function() {
		                // 파일이 없거나 다른 오류가 발생한 경우
		                alert("파일을 찾을 수 없습니다.");
		            },
		            success: function() {
		                // 파일이 존재하면 실제 파일 다운로드를 진행
		                location.href = downloadUrl;
		            }
		        });
		    }
		});
		
		//Action옵션에서 쪽지 세부 내용 보기 modal창
		$(document).on("click",".detailView",function() {
			//받은편지함 목록에서 해당 row의 정보들 가져오기
		    msg_no = $(this).closest('tr').find('.msg_no').text();
		    msg_title = $(this).closest('tr').find('.msgTitle').text();
		    msg_content = $(this).closest('tr').find('.msgContent').text();
		    msg_date = $(this).closest('tr').find('.msg_date').text();
		    msg_sender = $(this).closest('tr').find('.msg_sender').text();
		    msg_receiver = $(this).closest('tr').find('.msg_receiver').text();
		    msg_file = $(this).closest('tr').find('.msgFile').text();
		    msg_file_rename= $(this).closest('tr').find('.msgFileTag').attr('href');
		    msg_sender_name = $(this).closest('tr').find('.msg_sender_name').text();
		    msg_cate_name = $(this).closest('tr').find('.msgCateName').text();
		    
		    //가져온 정보들을 modal위치에 세팅
		    $("#modal_msgView").find(".modal-title").text(msg_title);
		    $("#modal_msgView").find(".modal-body").html(msg_content);
		    $("#modal_msgView").find(".sender").text(msg_sender_name);
		    $("#modal_msgView").find(".receiver").text(msg_receiver);
		    $("#modal_msgView").find(".msgtime").text(msg_date);
		    $("#modal_msgView").find(".msg_file").text(msg_file);
		    
		    $("#modal_msgView").find(".msg_file").attr('href',msg_file_rename);
		    
		  //함께 쪽지받은 사람 가져와서 modal에 세팅
		    var msgSharedEmps = {
		    	emp_no:emp_no,
		    	msg_no:msg_no,
		    	msg_title:msg_title,
		    	msg_content:msg_content
		    };
		    
		    $.ajax({
		    	url: path+'/sharedEmp',
		    	type: 'POST',
		    	data: JSON.stringify(msgSharedEmps),
		    	contentType:'application/json; charset=utf-8',
		 		success:function(response){

		 	        var sharedEmps = '';
		 	        if(response && response.length > 0) {
		 	            sharedEmps = response.join(', ');
		 	        } else {
		 	            sharedEmps = '없음';
		 	        }
		 	        $("#modal_msgView").find(".msgshared").text(sharedEmps);
		 		},
		 		error:function(error){

		 		}
		    });
		    
		    //카테고리에 따라 카테고리글자색 다르게 표시
			$msgCate = $("#modal_msgView").find(".msgCate");
			$msgCate.text(msg_cate_name);
					
			switch(msg_cate_name) {
			    case '긴급/중요':
			        $msgCate.css('color', 'red');
			        break;
			    case '업무연락':
			        $msgCate.css('color', '#5050FF');
			        break;
			    case '전체공지':
			        $msgCate.css('color', '#FFB914');
			        break;
			    case '답장':
			        $msgCate.css('color', '#50C785');
			        break;   
			}
		        //모달 보여주기
		        $("#modal_msgView").modal('show');
		        
		        $.ajax({
		        	url: path+'/readMsg',
		        	type: 'POST',
		        	data: { 
		        		'emp_no' : emp_no,
		        		'msg_no' : msg_no
		        	},
		     		success:function(){

		     		},
		     		error:function(response){

		     		}
		        });
		    });

		
		//Action 옵션에서 휴지통에서 꺼내기 클릭시
		$(document).on('click', '.returnMsg', function(event){
		    event.stopPropagation();  //이벤트버블링 방지. 상위요소에 event영향 미치지 않도록 함.
		    
		    var msg_no = $(this).closest('tr').find('.msg_no').text();
		    var emp_no = $(this).closest('tr').find('.emp_no').text();

		    $.ajax({
		        url: path+'/returnTrash',
		        type: 'POST',
		        data: {
		        	'emp_no': emp_no,
		            'msg_no': msg_no 
		        },
		        success: function(response) {
		            if(response.status === 'success'){

		                location.reload();
		            } else {

		            }
		        },
		        error: function(error) {

		        }
		    });
		});
		
		
		//리스트에서 check박스 선택시 해당 checkbox데이터 가져오는 함수 실행
		$('.form-check-input').on('change', function() {
		    selectedData = getSelectedData();

		});
		
		
	}
});





											
</script>

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>



