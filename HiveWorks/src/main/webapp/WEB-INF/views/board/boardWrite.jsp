<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style"/>
    <jsp:param value="" name="hover"/>
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="invoice-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="container">
										
										<div class="create-invoice-wrap mt-xxl-5 p-md-5 p-3">
											<select class="form-select" aria-label="Default select example" style="width: 145px;">
												<option selected>게시판 선택</option>
												<option value="1">공지사항</option>
												<option value="2">건의사항</option>
												<option value="3">블라인드</option>
											</select>
											<br>
											<h6 class="mb-4">Terms & Condition</h6>
											<div class="repeater">
												<ol class="ps-3" data-repeater-list="category-group">
													<li class="form-group close-over">
														<input type="text" class="form-control" value="Please pay within 15 days from the date of invoice, overdue interest @ 14% will be charged on delayed payments.">
														<button type="button" class="close-input btn-close">
															<span aria-hidden="true">×</span>
														</button>
													</li>
													<li class="form-group close-over">
														<input type="text" class="form-control" value="Please quote invoice number when remitting funds.">
														<button type="button" class="close-input btn-close">
															<span aria-hidden="true">×</span>
														</button>
													</li>
													<li data-repeater-item style="display:none;" class="form-group close-over">
														<input type="text" class="form-control">
														<button type="button" class="close-input btn-close">
															<span aria-hidden="true">×</span>
														</button>
													</li>
												</ol>
												<a data-repeater-create class="d-inline-flex align-items-center" href="#">
													<i class="ri-add-box-line me-1"></i> Add New Term Row
												</a>												
											</div>
											<div class="separator separator-light"></div>
											<div class="btn btn-light btn-file mb-4">
												Attach files
												<input type="file" class="upload">
											</div>
											
											<div class="row">
												<div class="col-lg-3 col-md-5 order-md-0 order-1">
													<div class="upload-logo">
														<input type="file" class="dropify-2" />
													</div>
												</div>						
											</div>																														
											<div class="separator separator-light"></div>
											<button type="button" class="btn btn-primary">등록</button>											
										</div>
									</div>																
							</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>