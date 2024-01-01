<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>	
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="blogapp-wrap">
					<nav class="blogapp-sidebar">
						<div data-simplebar class="nicescroll-bar">
							<div class="menu-content-wrap">
								<a href="add-new-post.html" class="btn btn-primary btn-rounded btn-block mb-4">
									Create Post
								</a>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item active">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="users"></i></span></span>
												<span class="nav-link-text">내 예약 현황</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="separator separator-light"></div>
								<div class="d-flex align-items-center justify-content-between mb-2">
									<div class="title-sm text-primary mb-0">전사자산</div>
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">본사4층회의실</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">본사5층회의실</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">빔프로젝터</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">차량예약</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="menu-gap"></div>
								<div class="nav-header">
									<span>관리자</span>
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">	
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="flag"></i></span></span>
												<span class="nav-link-text">전체 예약/대여 조회</span>
											</a>
										</li>
										
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="grid"></i></span></span>
												<span class="nav-link-text">전사자산 목록</span>
											</a>
										</li>
									</ul>
								</div>
								
		
				
					</nav>
					<div class="blogapp-content">
						<div class="blogapp-detail-wrap">
							<header class="blog-header">
								<div class="d-flex align-items-center">
									<a class="blogapp-title link-dark" href="#">
										<h1>자산 예약</h1>
									</a>
								</div>
								<div class="blog-options-wrap">	
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Refresh"><span class="icon"><span class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
									<div class="v-separator  d-lg-inline-block d-none"></div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0  d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
										<span class="icon">
											<span class="feather-icon"><i data-feather="chevron-up"></i></span>
											<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
										</span>
									</a>
								</div>
								<div class="hk-sidebar-togglable"></div>
							</header>
							<div class="blog-body">
					  <!-- calendar 태그 -->
                      <div class="hk-pg-wrapper pb-0">
                        <div class="" style="display: flex;">
                            <div class="calendarapp-content" style="width: 50%; padding:30px;">
                                <div id="calendar" class="w-100"></div>
                            </div>
                            <div style="width: 50%; display: block;">
                                <form>
                                    <div class="form-group">
                                        <select class="form-select">
                                            <option  selected="" value="1">가능 </option>
                                            <option value="2">Half Day</option>
                                            <option value="3">9 to 5</option>
                                        </select>
                                        </div>
                                    <div class="form-group">
                                        <label class="form-label">종료일자</label>
                                        <input class="form-control" name="single-date" type="text"/>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">참석자</label>
                                        <input class="form-control" type="text"/>
                                        <button type="button" class="btn btn-light btn-floating">추가</button>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                          알림여부
                                        </label>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>10분전</option>
                                            <option value="1">30분전</option>
                                          </select>
                                </div>
                        </form>
                        
                       
                   
                    <button type="button" class="btn btn-secondary">취소</button>
					<button id="add_event" type="button" class="btn btn-primary fc-addEventButton-button">예약</button>
                    <table class="table">
                        <thead>
                            <tr>
                            <th scope="col">예약시각</th>
                            <th scope="col">예약자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <th scope="row">1</th>
                            <td>18:00~20:00</td>
                            <td>홍길동</td>
                            </tr>
                    </table>
                </div>
                    </div>
                    </div>
                    </div>
						
						<!-- Add Category -->
						<div id="add_new_cat" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Category</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<input class="form-control" type="text" placeholder="Category Name"/>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- /Add Category -->
						
						<!-- Add Tag -->
						<div id="add_new_tag" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Tag</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<select id="input_tags" class="form-control" multiple="multiple">
															<option selected="selected">Collaborator</option>
															<option selected="selected">Designer</option>
															<option selected="selected">React Developer</option>
															<option selected="selected">Promotion</option>
															<option selected="selected">Advertisement</option>
														</select>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Add Tag -->
					</div>
				</div>
			</div>
			<!-- /Page Body -->
		</div>
		<!-- /Main Content -->
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>