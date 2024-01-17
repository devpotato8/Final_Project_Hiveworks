<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>

<style>
	.modal-info{
		margin-left : 15px;	
	}
	#modal_msgView .modal-content {
	    height: 600px;
	}
	#sendMsgModal .modal-content {
		height: 600px;
	}
	
	#msgContentArea {
	    resize : none;
	    height : 150px;
	}
	.autocomplete-dropdown {
		background-color: lightgray;
	    position: absolute; /* 절대 위치 설정 */
	    top: 15%; /* 부모 요소의 맨 아래에 위치 */
	    left: 20%; /* 부모 요소의 왼쪽 경계에 위치 */
	    z-index: 9999; /* 다른 요소 위에 위치 */
	}
	.autocomplete-dropdown li:hover {
    	background-color: #f2f2f2;
    	cursor: pointer;
    	width:auto;
    	max-width:300px;
	}
	.autocomplete-dropdown-item.selected {
	    background-color: #f2f2f2;
	}
	#msgCategory{
		width:200px;
	}
	#modal_selectEmp .modal-dialog {
	    width: 100%;
	    height: 100%;
	    margin: 0;
	    padding: 0;
	}
	#modal_selectEmp .modal-content {
	    height: auto;
	    width: auto;
	    min-height: 100%;
	    border-radius: 0;
	}
	.emp {
		color : #6464CD;
	}
	.no-employees {
	    display: none;
	}
</style>


<!-- 쪽지 상세내용 보기 modal -->
<div id="modal_msgView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal_label_id" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			  				  	
			</div>
			<div class="modal-info mt-3">
				<p><span>보낸사람 : </span><span class="sender"></span></p>
				<p><span>전송시간 : </span><span class="msgtime"></span></p>
				<p><span>첨부파일 : </span><span class="msg_file"></span></p>
				
			</div>
			<div class="modal-body" style="font-weight:bold;">
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-soft-primary" id="sendReply">답장 보내기</button>
				<button type="button" class="btn btn-soft-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 쪽지 보내기 modal -->
<div class="modal fade" id="sendMsgModal" tabindex="-1" aria-labelledby="sendMsgModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
    	<div class="modal-content">
	      		<div class="mt-3" style="margin-left:15px">	
	      			<h5>쪽지 보내기</h5>
	      		</div>
	      		<div class="modal-header">
      				<span>카테고리</span>&nbsp&nbsp
      				<select id="msgCategory" class="form-select" aria-label="msgCategory" name="msg_category">
						<option selected>쪽지 카테고리 선택</option>
						<option value="MCT001">업무연락</option>
						<option value="MCT002">전체공지</option>
						<option value="MCT003">일반</option>
						<option value="MCT004">긴급/중요</option>
						<option value="MCT005">답장</option>
					</select>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>        	
	      		</div>
			    <div class="modal-body">
	        		<div style="display: flex; align-items: center;" class="mb-3">
	        			<p>받는 사람</p>&nbsp&nbsp
	        			<input id="searchEmp"type="text" class="form-control" name="receiverEmpName" style="width:250px" placeholder="직원명을 검색하세요" autocomplete='off'>
	        			<input id="receiverEmpNo" type="hidden" name="receiverEmpNo">
	        			&nbsp&nbsp
	        			<button type="button" class="btn btn-soft-primary btn-sm" id="searchEmpBtn">조직도에서 선택</button>
	        		</div>
	
	        		<div style="display: flex; align-items: center;" class="mb-3">
	        			<p>쪽지 제목</p>&nbsp&nbsp
	        			<input type="text" class="form-control" name="sendMsgTitle" style="width:250px" autocomplete='off'>
	        		</div>
	        		
					<div class="input-group">
						<span class="input-group-text">쪽지내용</span>
						<textarea id="msgContentArea" class="form-control" aria-label="With textarea" name="sendMsgContent"></textarea>
					</div>
					<div id="byteCount" class="text-end mb-3">0 / 1500 byte</div>
					
					<div class="input-group mb-3">
						<input type="file" class="form-control" id="msgFileAttach" name="sendmsgFile" aria-label="Upload">
					</div>
				  	<p style="font-size:0.8rem;">파일 전송상태</p>
					<div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuemin="0" aria-valuemax="100">
					  	<div id="uploadProgressBar" class="progress-bar progress-bar-striped progress-bar-animated"></div>
					</div>
			    </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="sendMsgBtn">보내기</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
		</div>
	</div>
</div>

<!-- 직원 선택 modal -->
<div id="modal_selectEmp" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">직원을 선택하세요</h5>
      	<div style="margin-left:40px;"><input type="text" id="jstree_search" placeholder="직원명/부서명으로 검색" autocomplete='off'></div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div id="jstree"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="deptEmpSelect">선택</button>
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
									<a class="nav-link" href="${path}/messageview?empNo=${loginEmp.emp_no}">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="hard-drive"></i></span></span>
										<span class="nav-link-text">받은 쪽지함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="${path}/sendmessageview?empNo=${loginEmp.emp_no}">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="send"></i></span></span>
										<span class="nav-link-text">보낸 쪽지함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="${path}/starmessageview?empNo=${loginEmp.emp_no}">
										<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="star"></i></span></span>
										<span class="nav-link-text">별표 쪽지함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="${path}/delmessageview?empNo=${loginEmp.emp_no}">
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
	
			</nav>
			<!--/ MSG Sidebar END-->
			
			<!-- MSG Header Line -->
			<div class="fmapp-content">
				<div class="fmapp-detail-wrap">
					<header class="fm-header">
						
							<h4>${loginEmp.emp_name}님의 쪽지함</h4>
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
			

<script>


var msg_no;
var msg_title;
var msg_content;
var msg_date;
var msg_sender;
var msg_receiver;
var msg_file;
var msg_sender_name;

//쪽지 내용 보기
$(document).ready(function() {
    $(".msgTitle, .msgContent").click(function() {
    	//받은편지함 목록에서 해당 row의 정보들 가져오기
        msg_no = $(this).closest('tr').find('.msg_no').text();
        msg_title = $(this).closest('tr').find('.msgTitle').text();
        msg_content = $(this).closest('tr').find('.msgContent').text();
        msg_date = $(this).closest('tr').find('.msg_date').text();
        msg_sender = $(this).closest('tr').find('.msg_sender').text();
        msg_receiver = $(this).closest('tr').find('.msg_receiver').text();
        msg_file = $(this).closest('tr').find('.msgFile').text();
        msg_sender_name = $(this).closest('tr').find('.msg_sender_name').text();
        
        //가져온 정보들을 modal위치에 세팅
        $("#modal_msgView").find(".modal-title").text(msg_title);
        $("#modal_msgView").find(".modal-body").text(msg_content);
        $("#modal_msgView").find(".sender").text(msg_sender_name);
        $("#modal_msgView").find(".receiver").text(msg_receiver);
        $("#modal_msgView").find(".msgtime").text(msg_date);
        $("#modal_msgView").find(".msg_file").text(msg_file);
        
        //모달 보여주기
        $("#modal_msgView").modal('show');        
    });
    
});


//쪽지 글자 byte수 계산
$('#msgContentArea').on('input', function() {
    var len = encodeURI($(this).val()).split(/%..|./).length - 1;
    $('#byteCount').text(len + ' / 1500 byte');

    if (len > 500) {
        $(this).val($(this).val().substring(0, $(this).val().length - 1));
    }
});



//답장 modal에 받는사람 정보 미리 입력해주기
$(document).ready(function(){
    $("#sendReply").click(function(){
        $("#modal_msgView").modal('hide');
        $("#sendMsgModal").modal('show');
        $("#msgCategory").val("MCT005");
        $("#searchEmp").val(msg_sender_name);
        $("#receiverEmpNo").val(msg_sender);
    });
});




//modal창 내 jstree, 직원선택 로직
$('#searchEmpBtn').click(function(){
    $('#modal_selectEmp').modal('show');
    var deptEmpMap = {};
    function getJson(){
        $.ajax({
            type:'GET',
            url:'/modalDeptEmp',
            dataType:'JSON',
            success: function(data){
                var deptlist = new Array();
                var emplist = new Array();
                
                
                $.each(data.empList, function(idx, item){
                    if(!deptEmpMap[item.deptName]) {
                        deptEmpMap[item.deptName] = [];
                    }
                    deptEmpMap[item.deptName].push(item);
                });
                
                // 부서 정보를 임시로 저장할 배열
                var tempDeptList = new Array();
				
                // 부서 정보를 임시 배열에 저장
                $.each(data.deptList, function(idx, item){
                    tempDeptList[idx]={id:item.deptCode, parent:item.deptUpstair, text:item.deptName, type:'dept', li_attr: {class: 'dept'}};
                });

                // 직원 정보를 jstree 용으로 변환
                $.each(data.empList, function(idx, item){
                    var parentDept = tempDeptList.find(function(dept) {
                        return dept.text === item.deptName;
                    });

                    // 직원이 속한 부서를 부서 리스트에 추가
                    if (parentDept && !deptlist.includes(parentDept)) {
                        deptlist.push(parentDept);
                    }
                    
                    emplist[idx]={id:item.no, parent:parentDept.id, text:item.deptName + ' ' + item.name + ' ' + item.position, type:'emp', li_attr: {class: 'emp'}};
                });

                // 부서와 직원 정보 합치기
                var jstreeData = deptlist.concat(emplist);
                
                // 가져온 데이터들 jstree로 조직도 구현
                $('#jstree').jstree({
                    'plugins':['types','search','sort','checkbox'],
                    'core':{
                        'data':jstreeData
                    },
                    'types':{
                        'dept':{
                            'icon':'fa-solid fa-book-open-reader'
                        },
                        'emp':{
                            'icon':'fa-solid fa-user'
                        }
                    }
                });
            },
            error:function(data){
                alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요");
            }
        })
    }
    
    $('#deptEmpSelect').click(function() {
    	var selectedNodes = $('#jstree').jstree(true).get_selected(true);
        var selectedEmpNames = [];
        var selectedEmpNos = [];

        for(var i = 0; i < selectedNodes.length; i++) {
            var node = selectedNodes[i];
            
            if(node.type === 'emp') {
                var name = node.text.split(' ')[1]; // 텍스트에서 이름 부분만 추출

                // 이미 리스트에 이름이 있는지 확인
                if(selectedEmpNames.indexOf(name) === -1) {
                	// 리스트에 없으면 이름과 번호
                    selectedEmpNames.push(name);  
                    selectedEmpNos.push(node.id); 
                }
            } else if(node.type === 'dept') {
                var deptEmps = deptEmpMap[node.text];
				console.log(deptEmps);
                for(var j = 0; j < deptEmps.length; j++) {
                    var empName = deptEmps[j].name;

                    // 이미 리스트에 이름이 있는지 확인
                    if(selectedEmpNames.indexOf(empName) === -1) {
                        selectedEmpNames.push(empName); // 리스트에 없으면 이름 저장
                        selectedEmpNos.push(deptEmps[j].id); // 리스트에 없으면 번호 저장
                    }
                }
            }
        }
        
        // 컴마로 구분하여 문자열로 변환
        var empNameString = selectedEmpNames.join(', ');
        var empNoString = selectedEmpNos.join(', ');
        
        // 모달창의 입력 필드에 넣어주기
        $('#searchEmp').val(empNameString);
        $('#receiverEmpNo').val(empNoString);
        $('#modal_selectEmp').modal('hide');
        
    });
    
    getJson();
    
    $('#jstree_search').on("keyup", function(e){
        var searchString = $(this).val();
        $('#jstree').jstree('search', searchString);
    });
});



//쪽지보내기 modal창 닫힐때 값 초기화
$(document).ready(function(){
	$('#sendMsgModal').on('hide.bs.modal', function() {
	    // 모달이 닫힐 때 입력 필드 초기화
	    $('#searchEmp').val('');
	    $('#receiverEmpNo').val('');
	    $('#msgFileAttach').val('');
	    $('input[name="sendMsgTitle"]').val('');
	    $('#msgContentArea').val('');
	    $('#msgCategory').prop('selectedIndex',0);
	    
	});	
});




//쪽지 보내기 버튼 클릭시
$(document).ready(function(){
	$('#sendMsgBtn').click(function(){
		var receiverEmpNo = $('#receiverEmpNo').val().split(','); // 쉼표로 구분된 문자열을 배열로 변환
	    var msgCategory = $('#msgCategory').val();
	    var sendMsgTitle = $('input[name="sendMsgTitle"]').val();
	    var sendMsgContent = $('#msgContentArea').val();
	    var sendmsgFile = $('#msgFileAttach')[0].files[0]; // 파일 첨부의 경우
		var senderEmpNo = '${loginEmp.emp_no}';
	    var formData = new FormData();
	    receiverEmpNo.forEach(function(no) {
	        formData.append('receiverEmpNo', no.trim()); // 공백 제거 후 추가
	    });
	    formData.append('msgCategory', msgCategory);
	    formData.append('senderEmpNo', senderEmpNo);
	    formData.append('sendMsgTitle', sendMsgTitle);
	    formData.append('sendMsgContent', sendMsgContent);
	    formData.append('sendmsgFile', sendmsgFile[0]);
	    // 파일이 첨부되었는지 확인하고, 첨부된 경우에만 formData에 추가
        /* if(sendmsgFile.length > 0) {
            formData.append('sendmsgFile', sendmsgFile[0]);
        }; */
		
	    $.ajax({
	        type: 'POST',
	        url: '/sendMsg', // 실제 요청 URL
	        data: formData,
	        processData: false, // 파일 첨부를 위해 필요
	        contentType: false, // 파일 첨부를 위해 필요
	        xhr: function() {
	            var xhr = new window.XMLHttpRequest();
	            // 업로드 진행 상태 이벤트 핸들러 등록
	            xhr.upload.addEventListener("progress", function(evt){
	                if(evt.lengthComputable) {
	                    var percentComplete = (evt.loaded / evt.total) * 100;
	                    // 진행 상태를 백분율로 계산하여 Progress Bar에 반영
	                    $('#uploadProgressBar').css('width', percentComplete + '%').attr('aria-valuenow', percentComplete);
	                }
	            }, false);
	            return xhr;
	        },
	        success: function(response){
	        	if(response.status === 'success'){
	        		alert("쪽지 전송 성공!");
		            $('#sendMsgModal').modal('hide'); // 모달창 닫기
		            // 업로드 완료 후 Progress Bar 초기화
		            $('#uploadProgressBar').css('width', '0%').attr('aria-valuenow', 0);
	            } else {
	                alert("쪽지 전송 실패. 다시 시도해보세요.");
	                $('#sendMsgModal').modal('hide'); // 모달창 닫기
	                $('#uploadProgressBar').css('width', '0%').attr('aria-valuenow', 0);
	            }
	            
	        },
	        error: function(xhr, status, error){
	            // 요청 실패 시 처리
	            console.error("Error status: ", status);
			    console.error("Error thrown: ", error);
			    console.error("Error response: ", xhr.responseText);
	            alert("서버 통신 오류. 쪽지 전송 실패. 관리자 문의요망");
	            $('#uploadProgressBar').css('width', '0%').attr('aria-valuenow', 0);
	        }
	    });
	});
});





<!-- 직원 검색창 자동완성 결과 ajax -->
var empNo;
var isLeader;
var empId;
$(document).ready(function(){
    var ajaxRequest = false;
    var currentSelection = -1;
    var maxSelection = 0;  // 초기값을 0으로 설정합니다.
	
    $('#searchEmp').keyup(function(e){
        var searchText = $(this).val();

        // 방향키나 엔터키가 눌린 경우에는 검색을 수행하지 않습니다.
        if (e.which === 38 || e.which === 40 || e.which === 13) {
            return;
        }

        // 입력창 비워주기
        $('.autocomplete-dropdown').remove();
        currentSelection = -1;  // 검색 결과가 바뀔 때마다 선택 항목을 초기화합니다.

        // 입력창이 비어있지 않을 때만 ajax요청
        if(searchText !== '' && !ajaxRequest){
            ajaxRequest=true;
            $.ajax({
                type:'GET',
                url:'/searchEmp',
                data:{ name : searchText },
                dataType:'JSON',
                success: function(response){
                    ajaxRequest=false;
                    var searchResult= $('<ul class="autocomplete-dropdown">');
                    maxSelection = response.length;  // 검색 결과의 개수를 저장합니다.

                    $.each(response, function(index, employee){
                        listItem = $('<li class="autocomplete-dropdown-item">'+ employee.dept_name +' '+ employee.emp_name + ' ' + employee.position_name + '</li>');
                        listItem.data('empName', employee.emp_name); // 직원 이름만 저장
                        listItem.data('deptName', employee.dept_name);  // 직원 부서 저장
                        listItem.data('deptCode', employee.dept_code);  // 직원 부서 코드 저장
                        listItem.data('empNo', employee.emp_no);  // 직원 번호 저장
                        listItem.data('isLeader', employee.dept_leader); //조직장여부 저장
                        listItem.data('empId',employee.emp_id); // 직원 아이디 저장
                        
                        listItem.click(function() {
                            $('#searchEmp').val($(this).data('empName'));  // 클릭 시 직원 이름만 입력창에 반영
                            empNo=$(this).data('empNo');
                            empId=$(this).data('empId');
                            isLeader=$(this).data('isLeader');
                            $(this).remove(); // 선택한 항목 제거
                            if ($('.autocomplete-dropdown').children().length == 0) { // 모든 항목이 제거되었으면 dropdown도 제거
                                $('.autocomplete-dropdown').remove();
                            }
                        });

                        searchResult.append(listItem);
                    });

                    $('#searchEmp').after(searchResult);
                },
                error: function(){
                    ajaxRequest=false;
                    alert("직원 검색 실패. 관리자에게 문의하세요.")
                }
            });
        }
    });

    // 방향키와 엔터키 처리
    $('#searchEmp').keydown(function(e) {
        switch(e.which) {
            case 38: // 위쪽 방향키
                $('.autocomplete-dropdown-item').removeClass('selected');
                if (currentSelection > 0) {
                    currentSelection--;
                }
                $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').addClass('selected');
                break;
            case 40: // 아래쪽 방향키
                $('.autocomplete-dropdown-item').removeClass('selected');
                if (currentSelection < maxSelection - 1) {
                    currentSelection++;
                }
                $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').addClass('selected');
                break;
            case 13: // 엔터키
                if (currentSelection > -1) {
                	var text = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('empName');
                	empNo = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('empNo');
                	isLeader = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('isLeader');
                	empId = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('empId');
                    $('#searchEmp').val(text);
                    $('#receiverEmpNo').val(empNo);
                    $('.autocomplete-dropdown').remove();  // 선택 후에는 목록을 제거합니다.
                }
                currentSelection = -1;
                break;
        }
    });
	//검색결과 외부에 다른 곳을 클릭하면 검색결과창 사라지게
    $(document).click(function(e) {
        if (!$(e.target).closest('#searchEmp, .autocomplete-dropdown').length) {
            $('.autocomplete-dropdown').remove();
        }
    });
});




</script>


			
	