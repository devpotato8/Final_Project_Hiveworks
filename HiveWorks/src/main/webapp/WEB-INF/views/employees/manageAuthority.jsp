<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>

<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<style>

	.table td, .table th {
    vertical-align: middle;
    padding: 0;
	}

 	.table td:nth-child(n+5){
	text-align: left;
	padding-left: 10px;

	}
	
	.d-xxl-flex{
    	display:none !important;
    	
    }
    
    #save_btn{
    	text-align: right;
    	margin-bottom: 10px;
    }
    

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- Main Content -->
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="invoiceapp-wrap">
					<div class="invoiceapp-content" style="padding-left: 40px;">
						<div class="invoiceapp-detail-wrap">
							<header class="invoice-header">
								<div class="d-flex align-items-center">
									<a class="invoiceapp-title link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
										<h1>권한 관리</h1>
									</a>
								</div>
							</header>
							<div class="invoice-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="invoice-list-view">
										<div id ="save_btn">
											<button class="btn btn-primary btn-sm" type="button" onclick="fn_updateAuthorities();">저장</button>
										</div>
										<table id="datable_4c" class="table nowrap w-100 mb-5">
											<thead>
												<tr>
													<th><span class="form-check mb-0">
														<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
														<label class="form-check-label" for="customCheck1"></label>
													</span></th>
													<th>사원번호</th>
													<th>이름</th>
													<th>아이디</th>
													<c:forEach var="a" items="${autCodeList.authorityList }">
													<th><c:out value="${a.AUTNAME }" /></th>
													</c:forEach>
													<th>권한조정</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="s" items="${employees }">
												<tr class="list">
													<td><c:out value="${s.emp_no }" /></td>
													<td><c:out value="${s.emp_name }" /></td>
													<td>
														<div class="text-dark"><c:out value="${s.emp_id }" /></div>
													</td>
														<c:forEach var="a" items="${autCodeList.authorityList }">
													<td>
 														<input type="radio" class="aut_code" onchange="fn_changeRadio(event);" name="${s.emp_no }" value="${a.AUTCODE }" ${s.aut_code eq a.AUTCODE?"checked":""} ${s.emp_id eq 'emp001'?"disabled":""}/> 
													</td>
														</c:forEach>
													<td>
													<c:choose>
														<c:when test="${s.emp_id ne 'emp001' }">
														<div>
															<div class="d-flex">
																<button class="btn btn-soft-primary btn-file mb-1" id="changeDefault" type="button" onclick="fn_changeDefault(${s.emp_no}, event);">해제</button>
															</div>
														</div>
														</c:when>
														<c:otherwise>
														<div>
															<div class="d-flex">
																<button class="btn btn-soft-primary btn-file mb-1" id="changeDefault" type="button">-</button>
															</div>
														</div>
														</c:otherwise>
													</c:choose>
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
	    <!-- /Wrapper -->

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
	<script>
	
	fn_changeRadio=(event)=>{
			let $row = $(event.target).closest('tr').find('span');
			
			let checkbox = $row.find('input[type=checkbox]').eq(0);

			checkbox.prop('checked',true);
		}	
/* 	$(document).ready(function(){
		$('input[type=radio]').change(function(){ */
		/* });
	}); */
	
	
/* 	function getSelectedData() {
		   
		   var newData=[];

		  $('.form-check-input:checked').each(function() {
		      // 체크박스가 속한 행을 가져옴
		      var $row = $(this).closest('tr');
		   
		      var msg_no = parseInt($row.find('td').eq(1).text());
		      var emp_no = parseInt($row.find('td').eq(2).text());
		      
		      console.log(msg_no,emp_no);
		      
		      // 배열에 추가
		      newData.push({
		          msg_no: msg_no,
		          emp_no: emp_no
		      });
		  });

		  return newData; */
	

	
	fn_updateAuthorities=()=>{
		let autCode = document.querySelectorAll('.aut_code');

		let autCodeArray = Array.from(autCode);
		
		let input_values =[];
		let input_names =[];
		autCodeArray.forEach(e=>{
			if(e.checked){		
				input_names.push(e.name);
				input_values.push(e.value);
				
			}

		});
 		$.ajax({
			type:'POST',
			url:'${path}/employees/updateAuthorities',
			contentType:'application/json',
			data:JSON.stringify({
				names:input_names,
				values:input_values
			}),
			success:data=>{
				alert("업데이트 완료");
				location.reload();
			},
			error:data=>{
				alert("업데이트 실패");
				location.reload();
			}
		});

	}
	
	</script>
	<script>
		fn_changeDefault=(e,event)=>{
			let $radio=$('input[name='+e+']').eq(6);	
			$radio.prop('checked',true);
			fn_changeRadio(event);
		};
	</script>
	<script>
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
		"order": [[ 1, 'asc' ]],
		language: { search: "",
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

