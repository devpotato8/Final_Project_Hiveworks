<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<div class="hk-pg-wrapper pb-0">
	<div class="hk-pg-body py-0">
		<div class="blogapp-wrap">
			<nav class="blogapp-sidebar">
				<div data-simplebar class="nicescroll-bar">
					<div class="menu-content-wrap">
						<div class="menu-group">
								<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item">
										<a class="nav-link" href="${path }/schedule/reservationlistbyno">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="users"></i></span></span>
												<span class="nav-link-text">내 예약 현황</span>
											</a>
										</li>
									</ul>
						</div>
						<div class="separator separator-light"></div>
						<div
							class="d-flex align-items-center justify-content-between mb-2">
							<div class="title-sm text-primary mb-0">전사자산</div>
						</div>
						<div class="menu-group">
						<ul class="nav nav-light navbar-nav flex-column">
										<c:if test="${not empty reList}">
											<c:forEach var="res" items="${reList}">
												<li class="nav-item">
													<a class="nav-link link-badge-right" href="${path }/schedule/reserveResource?resourceNo=${res.resourceNo}">
														<span class="nav-link-text">${res.resourceName}</span>
													</a>
												</li>
											</c:forEach>
										</c:if>
									</ul>
						</div>
						<div class="menu-gap"></div>
						<c:if test="${loginEmp.aut_code == 'AUT001'}">
						<div class="nav-header">
							<span>관리자</span>
						</div>
						<div class="menu-group">
							<ul class="nav nav-light navbar-nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="${path }/schedule/reservationlist"> <span
										class="nav-icon-wrap"><span class="feather-icon"><i
												data-feather="flag"></i></span></span> <span class="nav-link-text">전체
											예약/대여 조회</span>
								</a></li>

								<li class="nav-item"><a class="nav-link"
									href="${path}/schedule/resourcelist"> <span
										class="nav-icon-wrap"><span class="feather-icon"><i
												data-feather="grid"></i></span></span> <span class="nav-link-text">전사자산
											목록</span>
								</a></li>
							</ul>
					</c:if>	
				</div>
			</nav>
			<div class="blogapp-content">
				<div class="blogapp-detail-wrap">
					<header class="blog-header">
						<div class="d-flex align-items-center">
							<a class="blogapp-title link-dark" href="#">
								<h1>전사자산 목록</h1>
							</a>
						</div>
						<div class="blog-options-wrap">
							<a
								class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none"
								href="#" data-bs-toggle="tooltip" data-bs-placement="top"
								title="" data-bs-original-title="Refresh" id="refreshButton"><span class="icon"><span
									class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
							<div class="v-separator  d-lg-inline-block d-none"></div>
							<a
								class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0  d-lg-inline-block d-none"
								href="#" data-bs-toggle="tooltip" data-bs-placement="top"
								title="" data-bs-original-title="Collapse"> <span
								class="icon"> <span class="feather-icon"><i
										data-feather="chevron-up"></i></span> <span
									class="feather-icon d-none"><i
										data-feather="chevron-down"></i></span>
							</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable"></div>
					</header>

					<div class="blog-body">
						<button type="button" class="btn btn-primary" id="addResourceBtn">자산등록</button>
						<button type="button" class="btn btn-secondary"
							id="delResourceBtn">자산삭제</button>
						<div data-simplebar class="nicescroll-bar">
							<div class="dropdown">
								<a
									class="btn btn-outline-light dropdown-toggle  d-sm-inline-block d-none"
									href="#" data-bs-toggle="dropdown" id="dropdownMenuBtn">자산종류</a>
								<div class="dropdown-menu dropdown-menu-end">
									<a class="dropdown-item" href="#" data-type="회의실"><span
										class="feather-icon dropdown-icon"><i
											data-feather="flag"></i></span><span>회의실</span></a> <a
										class="dropdown-item" href="#" data-type="차량"><span
										class="feather-icon dropdown-icon"><i
											data-feather="grid"></i></span><span>차량</span></a> <a
										class="dropdown-item" href="#" data-type="빔프로젝터"><span
										class="feather-icon dropdown-icon"><i
											data-feather="tag"></i></span><span>빔프로젝터</span></a>
								</div>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="all_post">
									<table id="datable_1" class="table nowrap w-100 mb-5">
										<thead>
											<tr>
												<th><span class="form-check"> <input
														type="checkbox" class="form-check-input check-select-all"
														id="customCheck1"> <label class="form-check-label"
														for="customCheck1"></label>
												</span></th>
												<th>자산번호</th>
												<th>자산종류</th>
												<th>자산이름</th>
												<th>수용인원</th>
												<th>사용여부</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty reList }">
												<c:forEach var="r" items="${reList}">
													<tr>
														<td><input type="checkbox" class="form-check-input check-select" id="customCheck${r.resourceNo}"></td>
														<td>${r.resourceNo }</td>
														<td class="mw-250p text-truncate text-high-em"><span>${r.resourceType }</span>
														</td>
														<td>
															<div class="media align-items-center">
																<div class="media-head me-2"></div>
																<div class="media-body">
																	<span class="d-block">${r.resourceName }</span>
																</div>
															</div>
														</td>
														<td>${r.resourceMax }</td>
														<td>${r.useYn }</td>
														<td>
															<div class="d-flex align-items-center">
																<div class="dropdown">
																	<button
																		class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret"
																		aria-expanded="false" data-bs-toggle="dropdown">
																		<span class="icon"><span class="feather-icon"><i
																				data-feather="more-vertical"></i></span></span>
																	</button>
																	<div role="menu"
																		class="dropdown-menu dropdown-menu-end">
																		<span class="dropdown-item" id="updateBtn"
																			data-resourceNo="${r.resourceNo}"
																			data-resourceType="${r.resourceType}"
																			data-resourceName="${r.resourceName}"
																			data-resourceMax="${r.resourceMax}"
																			data-useYn="${r.useYn}">수정</span>
																	</div>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row mt-3">
									<div class="col-sm-12">
										<div class="float-end text-end">
											<ul
												class="pagination custom-pagination pagination-simple active-theme">
												<li class="paginate_button page-item previous disabled"><a
													href="#" class="page-link"><i
														class="ri-arrow-left-s-line"></i></a></li>
												<li class="paginate_button page-item active"><a
													href="#" class="page-link">1</a></li>
											<!-- 	<li class="paginate_button page-item "><a href="#"
													class="page-link">2</a></li>
												<li class="paginate_button page-item "><a href="#"
													class="page-link">3</a></li> -->
												<li class="paginate_button page-item next"><a href="#"
													class="page-link"><i class="ri-arrow-right-s-line"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 등록 모달 -->
			<div class="modal" id="addResource" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">자산등록</h5>
						</div>
						<div class="modal-body">
							<div class="resourceContainer">
								<form id="resourceForm" action="${path }/schedule/insertresource" method="post">
									<input type="hidden" name="creater" id="creater"
										value="${loginEmp.emp_no}" /> <input type="hidden"
										name="modifier" id="modifier" value="${loginEmp.emp_no}" />
									<div class="row gx-3">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="form-label">자산종류</label> <select
													class="form-control custom-select" name="resourceType">
													<option value="회의실">회의실</option>
													<option value="차량">차량</option>
													<option value="빔프로젝터">빔프로젝터</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-8">
											<div class="form-group">
												<label class="form-label">자산이름</label> <input
													class="form-control" type="text" name="resourceName"/>
											</div>
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-8">
											<div class="form-group">
												<label class="form-label">수용인원</label> <input
													class="form-control" type="number" name="resourceMax"/>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary"
											data-bs-dismiss="modal">등록</button>
										<button type="button" class="btn btn-secondary"
											id="addCancelBtn">취소</button>
									</div>
								</form>
							</div>

						</div>

					</div>
				</div>
			</div>

			<!-- 수정 모달 -->
			<div class="modal" id="updateResource" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body">
							<div class="resourceUpContainer">
								<form id="resourceReForm" action="${path }/schedule/updateresource" method="post">
									<input type="hidden" name="creater" id="creater"
										value="${loginEmp.emp_no}" /> <input type="hidden"
										name="modifier" id="modifier" value="${loginEmp.emp_no}" /> <input
										type="hidden" name="resourceNo" id="resourceNo" value="" />
									<div class="row gx-3">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="form-label">자산종류</label> <select
													class="form-control custom-select" name="resourceType">
													<option value="회의실">회의실</option>
													<option value="차량">차량</option>
													<option value="빔프로젝터">빔프로젝터</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-8">
											<div class="form-group">
												<label class="form-label">자산이름</label> <input
													class="form-control" type="text" name="resourceName"/>
											</div>
										</div>
									</div>
									<div class="row gx-3">
										<div class="col-sm-8">
											<div class="form-group">
												<label class="form-label">수용인원</label> <input
													class="form-control" type="number" name="resourceMax"/>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary"
											data-bs-dismiss="modal">수정</button>
										<button type="button" class="btn btn-secondary"
											id="upCancelBtn">취소</button>
									</div>
								</form>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Page Body -->
<script>

var contextPath = "<c:out value='${path}'/>";

//페이지 새로고침
$(document).ready(function() {
    $("#refreshButton").click(function(e) {
        e.preventDefault(); // 기본 클릭 이벤트를 방지함
        location.reload(); // 페이지를 새로고침함
    });
});

//feather 리로딩, 수정/삭제 아이콘 로딩
/* $(document).ready(function(){
   feather.replace();
   applyFeatherLoading();
});


function applyFeatherLoading(){
   $(document).on('click','.paginate_button',function(){
      feather.replace();
      console.log("feather리로드");
   });

}  */


//페이징 시도
/* var targetElem = $('#datable_4');
var targetDt =targetElem.DataTable({
	scrollX:  true,
	autoWidth: false,
	language: { search: "",
		searchPlaceholder: "Search",
		sLengthMenu: "_MENU_items",
		paginate: {
			next: '<i class="ri-arrow-right-s-line"></i>', // or '→'
			previous: '<i class="ri-arrow-left-s-line"></i>' // or '←' 
		}
	},
	select: {
		style: 'multi'
	},
	"drawCallback": function () {
		$('.dataTables_paginate > .pagination').addClass('custom-pagination pagination-simple');
	}
}); */
/* $(document).on( 'click', '.del-button', function () {
	targetDt.rows('.selected').remove().draw( false );
});
$('Delete row').insertAfter(targetElem.closest('#datable_4_wrapper').find('.dataTables_length label')); */








	//등록 모달
	$(document).ready(function() {
		// '자산등록' 버튼을 찾아옵니다.
		var addResourceBtn = $('#addResourceBtn');
		// '자산등록' 버튼을 클릭했을 때의 이벤트를 정의합니다.
		addResourceBtn.on('click', function() {
			// 모달 창을 띄웁니다.
			$('#addResource').modal('show');
		});
	});

	$(document).ready(function() {
		// 취소 버튼에 대한 클릭 이벤트 추가
		$("#addCancelBtn").click(function() {
			// 모달 닫기
			$('#addResource').modal('hide');
			// 초기값으로 변경
			$("#resourceForm")[0].reset();
		});

	});

	//수정 모달
	$(document)
			.ready(
					function() {
						// 수정 링크 클릭 이벤트
						$(document)
								.on(
										'click',
										'#updateBtn',
										function(e) {
											e.stopPropagation();
											// 수정 링크에 저장된 data-* attribute 값을 가져옴
											var resourceNo = $(this).data(
													'resourceno');
											var resourceType = $(this).data(
													'resourcetype');
											var resourceName = $(this).data(
													'resourcename');
											var resourceMax = $(this).data(
													'resourcemax');
											var useYn = $(this).data('useyn');

											// 가져온 값을 모달의 각 필드에 설정
											$('#updateResource').find(
													'input[name="resourceNo"]')
													.val(resourceNo);
											$('#updateResource')
													.find(
															'select[name="resourceType"]')
													.val(resourceType);
											$('#updateResource')
													.find(
															'input[name="resourceName"]')
													.val(resourceName);
											$('#updateResource')
													.find(
															'input[name="resourceMax"]')
													.val(resourceMax);

											// 모달 보이게 설정
											$('#updateResource').modal('show');
											
										});

						// 취소 버튼에 대한 클릭 이벤트 추가
						$("#upCancelBtn").click(function() {
							// 모달 닫기
							$('#updateResource').modal('hide');
							// 테이블 다시 보이게 설정
							$("#resourceForm")[0].reset();
						});	
					});

	// 자산 타입 별로 조회 
	$(document).ready(function() {
		$('.dropdown-item').on('click',function(e) {
			e.preventDefault();

			var type = $(this).data('type');

			var selectedType = $(this).data('type');
											// 선택된 항목의 텍스트를 버튼에 업데이트
			$('#dropdownMenuBtn').text(selectedType);
	
			$.ajax({
				url :  contextPath+'/schedule/resourcelistByType',
				type : 'POST',
				data : {
					resourceType : type
				},
				dataType : 'json',
				success : function(response) {
					var tableBody = $('#datable_1 tbody');
					tableBody.empty();
					
					response.forEach(function(item) {	
					    // 테이블 행 요소 생성
					    var row = document.createElement('tr');
	
					    // 체크박스 셀 생성 및 추가
					    var checkboxCell = document.createElement('td');
					    checkboxCell.innerHTML = '<span class="form-check"><input type="checkbox" class="form-check-input check-select-all" id="customCheck1"><label class="form-check-label" for="customCheck1"></label></span>';
					    row.appendChild(checkboxCell);
	
					    // 데이터가 들어갈 셀 생성 및 추가
					    var cells = ['resourceNo', 'resourceType', 'resourceName', 'resourceMax', 'useYn'];
					    cells.forEach(function(cell) {
					        var dataCell = document.createElement('td');
					        dataCell.textContent = item[cell];
					        row.appendChild(dataCell);
					    });
	
					    // 드롭다운 셀 생성 및 추가
					    var dropdownCell = document.createElement('td');
					    var dropdownButton = document.createElement('button');
					    dropdownButton.className = 'btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret';
					    dropdownButton.setAttribute('aria-expanded', 'false');
					    dropdownButton.setAttribute('data-bs-toggle', 'dropdown');
					    dropdownButton.innerHTML = '<span class="icon"><span class="feather-icon"><i data-feather="more-vertical"></i></span></span>';
					    
					    var dropdownMenu = document.createElement('div');
					    dropdownMenu.className = 'dropdown-menu dropdown-menu-end';
					    var updateLink = document.createElement('span');
					    updateLink.className = 'dropdown-item update-link';
					    updateLink.setAttribute('data-resourceNo', item.resourceNo);
					    updateLink.textContent = '수정';
	
					    dropdownMenu.appendChild(updateLink);
					    dropdownButton.appendChild(dropdownMenu);
					    dropdownCell.appendChild(dropdownButton);
					    row.appendChild(dropdownCell);
	
					    // 행을 테이블 바디에 추가
					    var tableBody = document.getElementById('datable_1').getElementsByTagName('tbody')[0];
					    tableBody.appendChild(row);
					});

					// "수정" 링크 클릭 이벤트를 정의합니다.
					$('.update-link').on('click',function(e) {
						e.preventDefault();

						var resourceNo = $(this).data('resourceno');
						var $row = $(this).closest('tr');

						// 해당 행에서 데이터를 가져옵니다.
						var resourceType = $row.find('td:eq(2)').text();
						var resourceName = $row.find('td:eq(3)').text();
						var resourceMax = $row.find('td:eq(4)').text();

						// 모달창의 각 필드에 데이터를 채웁니다.
						$('#updateResource').find('input[name="resourceNo"]').val(resourceNo);
						$('#updateResource select[name="resourceType"]').val(resourceType);
						$('#updateResource input[name="resourceName"]').val(resourceName);
						$('#updateResource input[name="resourceMax"]').val(resourceMax);

						// 모달창을 표시합니다.
						$('#updateResource').modal('show');
						});
						
					 	feather.replace();
				      	console.log("feather리로드");
					
						},
						error : function(request, status, error) {
							// 요청 실패 시 처리할 코드
							alert("삭제 실패");
							console.log("삭제 실패" + error);
						}
					});
				});
			});

	$(document).ready(function() {
		  // 전체 체크박스 클릭
	    $("#customCheck1").click(function() {
	        // 전체 체크박스의 상태를 확인
	        var isChecked = $("#customCheck1").prop("checked");

	        // 모든 체크박스의 상태를 전체 체크박스에 맞춰 변경
	        $(".check-select").prop("checked", isChecked);
	    });

		$("#delResourceBtn").click(function() {
			var checkedList = [];

			// 체크된 체크박스를 찾아 체크된 자산의 번호를 checkedList에 추가
			$(".check-select:checked").not(".form-check-input.check-select-all").each(function() {
				var resourceNo = $(this).closest("tr").find("td:eq(1)").text();
				console.log(this);
				checkedList.push(resourceNo);
			});

			if (checkedList.length > 0) {
				    
				$.ajax({
					url :  contextPath+"/schedule/deleteResource", // 삭제 요청을 처리할 서버 URL
					type : "POST",
					data : JSON.stringify(checkedList), // JSON 데이터로 변환
					contentType : "application/json",
					success : function(response) {
						// 요청 성공 시 처리할 코드
						alert("삭제 성공");
						// 성공적으로 삭제되면 체크된 체크박스를 가진 행을 삭제
							$(".form-check-input:checked").closest("tr").remove();
			            
						
						console.log(response);
						
						 // 삭제된 resourceNo에 해당하는 HTML 요소를 삭제
						
						checkedList.forEach(function(resourceNo) {
							  var selector = "li.nav-item:has(a[href*='" + contextPath +"/schedule/reserveResource?resourceNo=" + resourceNo + "'])";
							  $(selector).remove();
							});
					    
						
					},
					error : function(request, status, error) {
						// 요청 실패 시 처리할 코드
						alert("삭제 실패");
						console.log("삭제 실패" + error);
					}
				});
			} else {
				alert("삭제할 자산을 선택해주세요.");
			}
		});
	});
	function fn_updateResource(e){
		e.preventDefault();
		console.log("")
	};

 </script>
<%-- <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>
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
<script src="${path}/resources/js/chips-init.js"></script>  --%>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>