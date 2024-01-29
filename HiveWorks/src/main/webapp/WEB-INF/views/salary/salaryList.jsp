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
		text-align: right;
    	padding-right: 60px;
    	padding-bottom: 10px;  
    }

	.d-xxl-flex{
    	display:none !important;
    	
    }
</style>

<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>

		<!-- Main Content -->
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="invoiceapp-wrap">
					<div class="invoiceapp-content" style="padding-left: 40px;">
						<div class="invoiceapp-detail-wrap">
							<header class="invoice-header">
								<div class="d-flex align-items-center">
									<a class="invoiceapp-title link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
										<h1>급여 관리</h1>
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
										<button class="btn btn-primary btn-sm" onclick="location.assign('${path}/salary/salaryWrite')" style="width:120px;">급여 신규 등록</button>
			<!-- 							<button class="btn btn-primary btn-sm" onclick="fn_deleteChoice();" style="width:100px; display:inline-block;">선택 삭제</button> -->
										</div>
									<div class="invoice-list-view">
										<table data-order='[[ 0, "desc" ]]' id="datable_2" class="table nowrap w-100 mb-5">
											<thead>
												<tr><!-- 
													<th><span class="form-check mb-0">
														<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
														<label class="form-check-label" for="customCheck1"></label>
													</span></th> -->
													<th>날짜</th>
													<th>사원번호</th>
													<th>이름</th>
													<th>아이디</th>
													<th>부서명</th>
													<th>지급 합계액</th>
													<th>공제액</th>
													<th>실수령액</th>
													<th>수정/삭제</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="s" items="${list }">
												<tr>
													<!-- <td></td> -->
													<input type="hidden" value="${s.sal_no }" />
													<input type="hidden" id="path" value="${path }"/>
													<td><a href="#" onclick="fn_salaryDetail(${s.sal_no});"><c:out value="${s.sal_date }" /></a></td>
													<td><a href="#" onclick="fn_salaryDetail(${s.sal_no});" class="table-link-text link-high-em"><c:out value="${s.employee.emp_no }" /></a></td>
													<td>
														<div class="text-dark"><c:out value="${s.employee.emp_name }" /></div>
													</td>
													<td><span><c:out value="${s.employee.emp_id }" /></span></td>
													<td><c:out value="${s.employee.dept_name }" /></td>
													<td>
														<c:set var="sal_total" value="${s.sal_base+s.sal_meal+s.sal_bonus+s.position_pay}"/>
														<fmt:formatNumber value="${sal_total}" type="number" />원
													</td>
													
													<td>
														<c:set var="sal_dedu" value="${sal_total - s.sal_actual}" />
														<fmt:formatNumber value="${sal_dedu}" type="number" />원
													</td>
													<td>
														<c:set var="sal_actual" value="${s.sal_actual}" />
														<fmt:formatNumber value="${sal_actual}" type="number" />원
													</td>
													<td>
														<div class="d-flex">
															<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="#" onclick="fn_updateSalaryDetail(${s.sal_no});" ><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
															<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" onclick='fn_delete_confirm(${s.sal_no});' ><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
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

	<!-- jQuery -->
    <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->

    <!-- Fancy Dropdown JS -->

	<!-- Simplebar JS -->
	<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
	
	<!-- Data Table JS -->
    <script src="${path}/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/vendors/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
	<script src="${path}/resources/vendors/datatables.net-select/js/dataTables.select.min.js"></script>
     
	<!-- Init JS -->

<script>
//salaryDetail로 a태그를 post방식으로 보내기(detail)
fn_salaryDetail=(event)=>{
	let $form = document.createElement('form');
	
	let $path = document.getElementById('path');
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','sal_no');
	obj.setAttribute('value',event);
	
	$form.appendChild(obj);
	$form.setAttribute('method','post');
	$form.setAttribute('action',$path.value+'/salary/salaryDetail');
	document.body.appendChild($form);
	
	$form.submit();
	
};


//updateSalaryDetail로 a태그를 post방식으로 보내기(update)
fn_updateSalaryDetail=(event)=>{
	let $form = document.createElement('form');
	
	let $path = document.getElementById('path');
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','sal_no');
	obj.setAttribute('value',event);
	
	$form.appendChild(obj);
	$form.setAttribute('method','post');
	$form.setAttribute('action',$path.value+'/salary/updateSalaryDetail');
	document.body.appendChild($form);
	
	$form.submit();
	
};





	function fn_delete_confirm(e){
		
		if(confirm("정말로 삭제하시겠습니까?")){
			location.replace("${path}/salary/deleteSalary?sal_no="+e);
		}else{
			alert("취소하였습니다.");
		};
	};

</script>

<script>

let salaryNoList=[];
let employeeNoList=[];


$(document).ready(function() {
    $('input[type="checkbox"]').change(function() {
        if (this.checked) {
            var row = $(this).closest('tr');
			
            var salaryNo = row.find('input[type=hidden]').val();
            
            var employeeNo = row.find('td:eq(2)').text(); 
            
           	salaryNoList.push(salaryNo);
           	employeeNoList.push(employeeNo);
        }
    });
});


//선택삭제 버튼 기능 작업X
/* fn_deleteChoice=()=>{
	if(salaryNoList.length===0 ||employeeNoList.length===0){
		alert("삭제할 급여 항목을 선택해 주세요.");
		return false;
	}
	
	if(confirm("정말 삭제하시겠습니까?")){
		fetch('${path}/salary/deleteChoice',{
			method:'post',
			headers:{
				'Content-Type' : 'application/json',
			},
			body: JSON.stringify({
				salaryNoList:salaryNoList,
				employeeNoList:employeeNoList
			}),
		})
		
		
		
	}else{
		alert("취소하였습니다.");
	}
	
	
	
}; */



</script>
<script>
$('#datable_2').DataTable( {
	/* scrollY:        "800px", */
	scrollX:        true,
	language: { search: "",
		searchPlaceholder: "Search",
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

} 

</script>


 <!-- Bootstrap Core JS -->
   	<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="${path}/resources/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

	<!-- Init JS -->
	<script src="${path}/resources/js/init.js"></script>
	<script src="${path}/resources/js/chips-init.js"></script>
	<script src="${path}/resources/js/dashboard-data.js"></script>