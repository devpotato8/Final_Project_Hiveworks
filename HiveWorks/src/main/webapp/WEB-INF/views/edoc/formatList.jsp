<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>
	
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp"%> --%>

<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>

<%@ page import="com.dna.hiveworks.model.code.DotCode" %>
<!-- Main Content -->
<div class="hk-pg-wrapper pb-0">
	<!-- Page Body -->
	<div class="hk-pg-body py-0">
		<div class="fmapp-wrap">
			<!-- PageSideBar -->
			<jsp:include page="/WEB-INF/views/edoc/common/edocSideBar.jsp">
			 	<jsp:param value="${currentPage }" name="currentPage"/>
			 	<jsp:param value="${countAll}" name="countAll"/>
				<jsp:param value="${countWait}" name="countWait"/>
				<jsp:param value="${countCheck}" name="countCheck"/>
				<jsp:param value="${countExpect}" name="countExpect"/>
				<jsp:param value="${countProcess}" name="countProcess"/>
			</jsp:include>
			<div class="fmapp-content">
				<div class="fmapp-detail-wrap">
					<header class="fm-header">
						<div class="d-flex align-items-center flex-grow-1">
							<span class="fmapp-title link-dark">
								<h1>${title }</h1>
							</span>
						</div>
						<div class="fm-options-wrap">	
							<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
								<span class="icon">
									<span class="feather-icon"><i data-feather="chevron-up"></i></span>
									<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
								</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable"></div>
					</header>
					<div class="fm-body">
						<div data-simplebar class="nicescroll-bar">
							<div class="file-list-view">
								<ul class="nav nav-tabs nav-line nav-icon nav-light">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="tab" href="#doc_list">
											<span class="nav-link-text">양식 목록</span>
										</a>
									</li>
									
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="doc_list">
										<div class="table-responsive">
											<table data-order='[[ 1, "asc" ]]' id="docTable" class="table nowrap table-hover">
												<thead>
													<tr>
														<th>양식번호</th>
														<th>양식구분</th>
														<th>양식이름</th>
														<th>생성일</th>
														<th>설명</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${formatList }" var="fmt">
														<tr>
															<td>${fmt.sampleNo }</td>
															<td>${fmt.sampleDotCode.code }</td>
															<td>${fmt.sampleName }</td>
															<td>${fmt.createDate }</td>
															<td>${fmt.sampleDesc }</td>
															<td>
																<a class="btn" href="#">
																	<span class="icon">
																		<span class="zmdi-icon">
																			<i class="zmdi zmdi-collection-item"></i>
																		</span>
																	</span>
																</a>
																<a class="btn" href="#">
																	<i class="zmdi zmdi-delete"></i>
																</a>
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
			</div>
		</div>
	</div>
	<!-- /Page Body -->
</div>
<!-- /Main Content -->

<!-- Bootstrap Core JS -->
<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FeatherIcons JS -->
<script src="${path}/resources/js/feather.min.js"></script>
<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>
<!-- Simplebar JS -->
<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
<!-- 체크박스 JS -->
<script src="${path}/resources/js/checkbox.js"></script>
<!-- Init JS -->
<script src="${path}/resources/js/init.js"></script>
<script src="${path}/resources/js/chips-init.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />


<!-- Data Table JS -->
<script src="${path }/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${path }/resources/vendors/jszip/dist/jszip.min.js"></script>
<script src="${path }/resources/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="${path }/resources/vendors/pdfmake/build/vfs_fonts.js"></script>
<script src="${path }/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-select/js/dataTables.select.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-fixedcolumns/js/dataTables.fixedColumns.min.js"></script>
<script src="${path }/resources/vendors/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>

<style>
	#docTable tbody tr{
		cursor:pointer;
	}
</style>
<script>
$('#docTable').DataTable( {
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
	}
});
</script>
<script>
	$(document).on('click','#docTable tbody tr', (e)=>{
		e.stopPropagation();
		const $target = $(e.currentTarget);
		const formatNo = $target.children().first().text();
		location.assign('${path}/edoc/format/view?formatNo='+formatNo);
	});
</script>
</div>
</body>
</html>