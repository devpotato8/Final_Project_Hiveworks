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

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

		<!-- Main Content -->
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="invoiceapp-wrap">
					<div class="invoiceapp-content" style="padding-left: 40px;">
						<div class="invoiceapp-detail-wrap">
							<header class="invoice-header">
								<div class="d-flex align-items-center">
									<a class="invoiceapp-title link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
										<h1>내 급여</h1>
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
			<!-- 							<button class="btn btn-primary btn-sm" onclick="fn_deleteChoice();" style="width:100px; display:inline-block;">선택 삭제</button> -->
										</div>
									<div class="invoice-list-view">
										<table data-order='[[ 1, "desc" ]]' id="datable_2" class="table nowrap w-100 mb-5">
											<thead>
												<tr>
													<th>날짜</th>
													<th>이름</th>
													<th>아이디</th>
													<th>부서명</th>
													<th>지급 합계액</th>
													<th>공제액</th>
													<th>실수령액</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="s" items="${list }">
												<tr>
													<input type="hidden" value="${s.sal_no }" />
													<td><a href="${path }/salary/salaryDetail?sal_no=${s.sal_no}"><c:out value="${s.sal_date }" /></a></td>
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
												</tr>
												</c:forEach>
												<!-- <tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11235</a></td>
													<td>13 Jan, 2020</td>
													<td>
														<div class="text-dark">Huma Therman</div>
														<div class="fs-7">huma@clariesup.au</div>
													</td>
													<td>
														<span class="badge badge-danger">Unpaid</span>
														<div class="fs-8 mt-1">Due 25 Apr 2020</div>
													</td>
													<td>Sent</td>
													<td>$ 780.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Remind</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11236</a></td>
													<td>13 Jan, 2020</td>
													<td>
														<div class="text-dark">Charlie Chaplin</div>
														<div class="fs-7">charlie@leernoca.monster</div>
													</td>
													<td>
														<span class="badge badge-primary">Paid</span>
													</td>
													<td>Done</td>
													<td>$ 567.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Active</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11237</a></td>
													<td>13 Jan, 2020</td>
													<td>
														<div class="text-dark">Winston Churchil</div>
														<div class="fs-7">winston@worthniza.ga</div>
													</td>
													<td>
														<span class="badge badge-danger">Unpaid</span>
														<div class="fs-8 mt-1">Due 12 Sep 2020</div>
													</td>
													<td>-</td>
													<td>$ 1,500.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Sent</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11238</a></td>
													<td>13 Jan, 2020</td>
													<td>
														<div class="text-dark">Jaquiline Joker</div>
														<div class="fs-7">jaquljoker@jampack.com</div>
													</td>
													<td>
														<span class="badge badge-danger">Unpaid</span>
														<div class="fs-8 mt-1">Due 18 Oct 2020</div>
													</td>
													<td>Sent</td>
													<td>$ 900.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Remind</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11239</a></td>
													<td>3 July, 2020</td>
													<td>
														<div class="text-dark">Tom Cruz</div>
														<div class="fs-7">tomcz@jampack.com</div>
													</td>
													<td>
														<span class="badge badge-primary">Paid</span>
													</td>
													<td>Done</td>
													<td>$ 4,750.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Active</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11240</a></td>
													<td>24 Jun, 2019</td>
													<td>
														<div class="text-dark">Danial Craig</div>
														<div class="fs-7">danialc@jampack.com</div>
													</td>
													<td>
														<span class="badge badge-primary">Paid</span>
														<div class="fs-8 mt-1">Due 25 Apr 2020</div>
													</td>
													<td>Done</td>
													<td>$ 2,300.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Active</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11241</a></td>
													<td>24 Jun, 2019</td>
													<td>
														<div class="text-dark">Katharine Jones</div>
														<div class="fs-7">joneskath@jampack.com</div>
													</td>
													<td>
														<span class="badge badge-primary">Paid</span>
													</td>
													<td>Done</td>
													<td>$ 7,650.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Active</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="#" class="table-link-text link-high-em">11242</a></td>
													<td>24 Jun, 2019</td>
													<td>
														<div class="text-dark">Hence Work</div>
														<div class="fs-7">contact@hencework.com</div>
													</td>
													<td>
														<span class="badge badge-light">Draft</span>
													</td>
													<td>-</td>
													<td>$ 4,500.00 USD</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="btn-group selectable-split-dropdown">
																<button type="button" class="btn btn-outline-light btn-dyn-text w-100p">Sent</button>
																<button type="button" class="btn btn-outline-light dropdown-toggle dropdown-toggle-split me-3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="sr-only">Toggle Dropdown</span>
																</button>
																<div class="dropdown-menu dropdown-menu-end">
																	<a class="dropdown-item" href="#">Remind</a>
																	<a class="dropdown-item" href="#">Sent</a>
																	<a class="dropdown-item" href="#">Active</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="#">Edit</a>
																</div>
															</div>
															<div class="d-flex">
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="contact-details.html"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
																<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
															</div>
														</div>
													</td>
												</tr> -->
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
     
<script>
$('#datable_2').DataTable( {
	/* scrollY:        "400px", */
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