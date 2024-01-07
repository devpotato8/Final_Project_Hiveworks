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
	<div class="hk-pg-wrapper">
		<div class="container-xxl">
			<!-- Page Header -->
			<div class="hk-pg-header pg-header-wth-tab pt-7">
				<div class="d-flex">
					<div class="d-flex flex-wrap justify-content-between flex-1">
						<div class="mb-lg-0 mb-2 me-8">
							<h1 class="pg-title">근무현황</h1>
						</div>
					</div>
				</div>
			</div>
				<!-- /Page Header -->
			<section>
		        <div class="container">
		            <div class="top-bar">
		                <div class="second-line">
		                    <div></div>
		                    <div>
		                        <button class="btn btn-dark">근무내역다운로드</button>
		                    </div>
		                </div>
		                <div class="thrid-line">
		                    <div class="day-filter"><button class="btn btn-dark">일</button><button class="btn btn-dark">주</button>
		                    <button class="btn btn-dark">월</button><button class="btn btn-dark">년</button><button class="btn btn-dark">주기</button>
		                    <button class="btn btn-dark"> < 2023.12.18~12.24 > </button></div>
		                    <div class="filter-right-part"><button class="btn btn-dark">새로고침</button><div>2023.12.26(화) 오전 08:00</div><button class="btn btn-dark">다운버튼</button></div>
		                </div>
		            </div>
		        </div>
		        
		        
		        <div class="taskboard-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="container-fluid">
										<div class="row justify-content-center board-team-wrap">
											<div class="col-md-8 col-sm-12">
												<div class="tab-content">
													<div class="tab-pane fade show active" id="tab_boards">
														<div class="d-flex justify-content-between align-items-center mb-5">
															<h5 class="mb-0">평균 출퇴근시간</h5>
														</div>
														
														<div class="row">
														
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>평균 출근시간</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-blue avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">3+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 25 min ago</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>평균 퇴근시간</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-blue avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">3+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 5 min ago</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="d-flex justify-content-between align-items-center mb-5">
															<h5 class="mb-0"> 근태 현황</h5>
														</div>
														<div class="row">
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>지각</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-orange avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">4+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated Yesterday</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>조퇴</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-orange avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">W</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 10 min ago</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>결근</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-orange avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">3+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 1 hour ago</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>근무시간 미달</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-orange avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">3+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 20 min ago</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>근무 시간 누락</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-orange avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">3+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 20 min ago</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="card board-card card-border">
																	<div class="card-body">
																		<div class="media align-items-center">
																			<div class="media-head">
																			</div>
																			<div class="media-body">
																				<span>근무 시간 초과</span>
																			</div>
																		</div>
																	</div>
																	<div class="card-footer text-muted justify-content-between">
																		<div>
																			<div class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																				<div class="avatar avatar-soft-orange avatar-rounded" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tooltip text">
																					<span class="initial-wrap">3+</span>
																				</div>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<p class="p-xs me-2">Updated 20 min ago</p>
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
								</div>
							</div>
							
		    </section>
		    
	    </div>
    </div>
<style>
		:root {
            --navy: rgba(14, 25, 90, 0.8);
        }
        .day-filter > button{
        	background-color: var(--navy);
        }
        .filter-right-part > button{
        	background-color: var(--navy);
        }
        .container{
            width: 100%;
            height: 100%;
            width: 90%;
            margin: auto;
        }
        
        .top-bar>div{
            display: flex;
            margin-bottom: 10px;
        }
        .first-line{
            font-size: 28px;
        }
        .first-line>div{
            margin-right: 20px;
        }
        .second-line{
            font-size: 18px;
            display: flex;
            justify-content: space-between;
        }
        .second-line>div{
            display: flex;
        }
        .second-line>div>div{
            margin-right: 10px;
        }
        .thrid-line{
            display: flex;
            justify-content: space-between;
        }
        .thrid-line>div{
            display: flex;
        }
        .day-filter>button{
            margin-right: 5px;
        }
        .filter-right-part>button{
            margin: 0 10px;
        }
    </style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>