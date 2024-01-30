<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
</jsp:include>
  <style>
    /* 스타일 추가 */
    .button-group {
       	/* text-align: center; */
		white-space: nowrap; /* 줄 바꿈을 방지합니다. */    
    }

    .button-group button {
      margin-left: 10px; /* 버튼 간의 간격을 조절합니다. */
      display: inline-block; /* 버튼을 인라인 블록으로 표시합니다. */
    }
    
    .button-group>#form_real {
      margin-left: 5px; /* 버튼 간의 간격을 조절합니다. */
      display: inline-block; /* 버튼을 인라인 블록으로 표시합니다. */
    }
   	
   	.button-group>#excelDownload_btn {
     justify-content: flex-end;
    }
    
    .right-btn {
 	 float:right;
	}

/*     enrollEmployee_btn
   	excelDownload_btn */
    .invoice-toolbar-left{
    	display:none !important;
    	
    }

  </style>


<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
   	<!-- Wrapper -->
	<div id="scrollable-container" class="hk-wrapper" data-layout="vertical" data-layout-style="collapsed" data-menu="light" data-footer="simple" data-hover="active">
		
		<!-- Main Content -->
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="invoiceapp-wrap">
					<div class="invoiceapp-content">
						<div class="invoiceapp-detail-wrap">
							<header class="invoice-header">
								<div class="d-flex align-items-center">
									<a class="invoiceapp-title link-dark" data-bs-toggle="dropdown" href="#" role="button"aria-haspopup="true"  aria-expanded="false">
										<h1>직원 관리</h1>
									</a>
									<!-- <div class="dropdown-menu">
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="users"></i></span><span>All Invoices</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="star"></i></span><span>Sent</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="archive"></i></span><span>Archive</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="edit"></i></span><span>Pending</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Deleted</span></a>
									</div> -->
									
								</div>
								<!-- <div class="invoice-options-wrap">	
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Refresh"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
									<div class="v-separator d-lg-inline-block d-none"></div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret ms-0  d-sm-inline-block d-none" href="#" data-bs-toggle="dropdown"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
									<div class="dropdown-menu dropdown-menu-end">
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="upload"></i></span><span>Manage Invoices</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="download"></i></span><span>Recurring Invoices</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="layers"></i></span><span>Manage Estimate</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="save"></i></span><span>Saved Templates</span></a>
									</div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" href="#" data-bs-toggle="dropdown"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="more-vertical"></i></span></span></a>
									<div class="dropdown-menu dropdown-menu-end">
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="settings"></i></span><span>Settings</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="slash"></i></span><span>Block Content</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="external-link"></i></span><span>Feedback</span></a>
									</div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
										<span class="btn-icon-wrap">
											<span class="feather-icon"><i data-feather="chevron-up"></i></span>
											<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
										</span>
									</a>
								</div> -->
								
							</header>
							<div class="invoice-body">
								<div data-simplebar class="nicescroll-bar">
										<div class="button-group">
											<button class="btn btn-primary btn-rounded" id="enrollEmployee_btn" onclick="location.assign('${path}/employees/enrollEmployee')" style="width:120px;">개별 등록</button>
											<button class="btn btn-primary btn-rounded right-btn" id="excelDownload_btn" onclick="fn_excelDownload();" style="width:140px; "><span><i class="ri-file-excel-2-fill"></i>&nbsp 전체 다운로드</span></button>
											<form action="${path }/employees/excelEmployeeUpload" id="form_real" method="post" enctype="multipart/form-data">
												<input type="file" id="excelUpFile" name="excelUpFile" accept=".xlsx, .xls" style="width:220px; ">
												<button type="button" class="btn btn-primary btn-rounded" onclick="fn_excelUpload(event);">일괄 업로드</button>
											</form>
											<a href="${path }/employees/sampleDownload ">업로드 샘플 양식 다운 받기</a>
										</div>
									<div class="invoice-list-view">
										<table data-order='[[ 1, "desc" ]]' id="datable_1" class="table nowrap w-100 mb-5">
											<thead>
												<tr>
													<th><span class="form-check mb-0">
														<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
														<label class="form-check-label" for="customCheck1"></label>
													</span></th>
													<th>사원번호</th>
													<th>이름</th>
													<th>아이디</th>
													<th>부서명</th>
													<th>직위</th>
													<th>사내전화</th>
													<th>핸드폰번호</th>
													<th>수정/삭제</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="s" items="${employees }">
												<tr>
													<td></td>
													<input type="hidden" id="path" value="${path }"/>
													<td><a href="#" onclick="fn_employeeDetail(${s.emp_no});" ><c:out value="${s.emp_no }" /></a></td>
													<td><a href="#" onclick="fn_employeeDetail(${s.emp_no});" class="table-link-text link-high-em"><c:out value="${s.emp_name }" /></a></td>
													<td>
														<div class="text-dark"><c:out value="${s.emp_id }" /></div>
													</td>
													<td><span><c:out value="${s.dept_name }" /></span></td>
													<td><c:out value="${s.position_name }" /></td>
													<td><c:out value="${s.emp_phone }"/></td>
													<td><c:out value="${s.emp_cellphone }" /></td>
													<td>
														<div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="#" onclick="fn_updateEmployeeDetail(${s.emp_no});"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#" onclick="fn_delete_confirm(${s.emp_no});"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									
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
	</div>

														
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
<script src="${path}/resources/js/invoice-data.js"></script>
<script>
	function fn_delete_confirm(e){
		
		if(confirm("퇴사 처리하시겠습니까?")){
			location.replace("${path}/employees/deleteEmployee?emp_no="+e);
		}else{
			alert("취소하였습니다.");
		};
	};

</script>

<script>
$('#datable_2').DataTable( {
	scrollX:  true,
	autoWidth: false,
	language: { search: "",
		searchPlaceholder: "Search",
		sLengthMenu: "_MENU_items",
		paginate: {
			next: '', // or '→'
			previous: '' // or '←' 
		}
	},
	"drawCallback": function () {
		$('.dataTables_paginate > .pagination').addClass('custom-pagination pagination-simple');
	
		fn_deleteEmployee=(e)=>{
			
			let result = confirm("해당 사용자의 정보를 삭제하시겠습니까?");
			
			if(result){
				location.replace("${path }/employees/deleteEmployee?emp_no="+e);
			}else{
				alert("취소하였습니다.");
			}
		}

	}
});
													
</script>
<script>
let $form = document.getElementById('form_real');
fn_excelUpload=(e)=>{
	e.preventDefault();
	
	let $excelUpFile = document.getElementById('excelUpFile');
	
	if($excelUpFile.value==""){
		alert("파일을 업로드해주세요.");
		$excelUpFile.addEventListener('focus',event);
		return false;
	}	
	
	$form.submit();
}

</script>
<script>
//엑셀 다운로드
fn_excelDownload=()=>{
	location.replace("${path}/employees/excelEmployeeDownload");
};

</script>
<script>

//feather 리로딩, 수정/삭제 아이콘 로딩
$(document).ready(function(){
	feather.replace();
	applyFeatherLoading();
});


function applyFeatherLoading(){
	//page버튼 변경 시
	$(document).on('click','.paginate_button',function(){
		feather.replace();
	});
	
	//selectbox 변경 시
	$(document).on('change','.form-select',function(){
		feather.replace();
	});
	
	//필터 버튼 클릭 시
	$(document).on('click','.sorting',function(){
		feather.replace();
	});
	
	//검색창 실행 시
	$(document).on('keyup','.form-control',function(){
		feather.replace();
	});
	
} 

</script>
<script>
//employeeDetail로 a태그를 post방식으로 보내기(Detail)
fn_employeeDetail=(event)=>{
	let $form = document.createElement('form');
	
	let $path = document.getElementById('path');
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','emp_no');
	obj.setAttribute('value',event);
	
	$form.appendChild(obj);
	$form.setAttribute('method','post');
	$form.setAttribute('action',$path.value+'/employees/employeeDetail');
	document.body.appendChild($form);
	
	$form.submit();
};

//updateEmployeeDetail로 a태그를 post방식으로 보내기(update)
fn_updateEmployeeDetail=(event)=>{
	let $form = document.createElement('form');
	
	let $path = document.getElementById('path');
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','emp_no');
	obj.setAttribute('value',event);
	
	$form.appendChild(obj);
	$form.setAttribute('method','post');
	$form.setAttribute('action',$path.value+'/employees/updateEmployeeDetail');
	document.body.appendChild($form);
	
	$form.submit();
};



</script>



	<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
    <!-- Bootstrap Core JS -->
   	<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="${path}/resources/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

	<!-- Init JS -->
	<script src="${path}/resources/js/init.js"></script>
	<script src="${path}/resources/js/chips-init.js"></script>
	<%-- <script src="${path}/resources/js/dashboard-data.js"></script> --%>