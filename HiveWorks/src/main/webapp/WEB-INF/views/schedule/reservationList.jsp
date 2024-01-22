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
<div>
			<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="blogapp-wrap">
					<nav class="blogapp-sidebar">
						<div data-simplebar class="nicescroll-bar">
							<div class="menu-content-wrap">
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item active">
										<a class="nav-link" href="${path }/schedule/reservationlistbyno.do?empNo=${loginEmp.emp_no}">
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
										<c:if test="${not empty reList}">
											<c:forEach var="res" items="${reList}">
												<li class="nav-item">
													<a class="nav-link link-badge-right" href="${path }/schedule/reserveResource.do?resourceNo=${res.resourceNo}">
														<span class="nav-link-text">${res.resourceName}</span>
													</a>
												</li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
								<div class="menu-gap"></div>
								<div class="nav-header">
									<span>관리자</span>
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">	
										<li class="nav-item">
											<a class="nav-link" href="${path }/schedule/reservationlist.do">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="flag"></i></span></span>
												<span class="nav-link-text">전체 예약/대여 조회</span>
											</a>
										</li>
										
										<li class="nav-item">
											<a class="nav-link" href="${path}/schedule/resourcelist.do">
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
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Refresh" id="refreshButton"><span class="icon"><span class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
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
								<div data-simplebar class="nicescroll-bar">
								<div style="display:flex">
										<div class="dropdown">
											<a class="btn btn-outline-light dropdown-toggle  d-sm-inline-block d-none" href="#" data-bs-toggle="dropdown">전체보기</a>
											<div class="dropdown-menu dropdown-menu-end">
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="flag"></i></span><span>회의실</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="grid"></i></span><span>차량</span></a>
												<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="tag"></i></span><span>빔프로젝터</span></a>
											</div>
										</div>
										<button type="button" class="btn btn-secondary" id="delReserveBtn">예약취소</button>
									</div>
										<div class="tab-content">
											<div class="tab-pane fade show active" id="all_post">
												<table id="datable_1" class="table nowrap w-100 mb-5">
													<thead>
														<tr>
															<th><span class="form-check">
																<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
																<label class="form-check-label" for="customCheck1"></label>
															</span></th>
															<th>예약번호</th>
															<th>자산이름</th>
															<th>예약자</th>
															<th>자산종류</th>
															<th>예약시간</th>
															<th>예약상태</th>
															<th>에약일자</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty reserveList }">
															<c:forEach var="res" items="${reserveList}">
														<tr>
															<td></td>
															<td>${res.calNo }</td>
															<td class="mw-250p text-truncate text-high-em">
																<span>${res.resource.resourceName }</span>
															</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-body">
																		<span class="d-block">${res.myEmpName }</span> 
																	</div>
																</div>													
															</td>
															<td>${res.resource.resourceType }</td>
															<td>${res.calStartDate }~${res.calEndDate }</td>
															<td>${res.calStatus }</td>
															<td>${res.createDate }</td>
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
																		<a class="dropdown-item updateBtn" href="${path}/schedule/updateReservation?resourceNo=${res.resource.resourceNo}&calNo=${res.calNo}">수정</a>
																		<span class="dropdown-item reminderBtn">메시지알림요청</span>
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
<script>
const empPhone = '${loginEmp.emp_cellphone}'; //수정필요
const empNo = ${loginEmp.emp_no}; //수정 필요
console.log(empPhone, empNo);


//페이지 새로고침
$(document).ready(function() {
    $("#refreshButton").click(function(e) {
        e.preventDefault(); // 기본 클릭 이벤트를 방지함
        location.reload(); // 페이지를 새로고침함
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

    $("#delReserveBtn").click(function() {
    	var checkedList = [];
        var selectedDataList = [];

        // 체크된 체크박스를 찾아 예약 번호를 checkedList에 추가
        $(".check-select:checked").each(function() {
            var reserveNo = $(this).closest("tr").find("td:eq(1)").text();
            var resourceName = $(this).closest('tr').find('td:nth-child(3)').text().trim();
            var calStartDate = $(this).closest('tr').find('td:nth-child(6)').text().split('~')[0];

            checkedList.push(reserveNo);
            
            selectedDataList.push({
                reserveNo: reserveNo,
                resourceName: resourceName,
                calStartDate: calStartDate,
                empPhone: empPhone,
                empNo: empNo
            });
        });

        if (checkedList.length > 0) {
            // 사용자에게 확인을 받는다.
            var confirmed = confirm("선택한 예약을 취소하시겠습니까?");

            if (confirmed) {
                $.ajax({
                    url: "/schedule/deleteReservation", // 삭제 요청을 처리할 서버 URL
                    type: "POST",
                    data: JSON.stringify(checkedList), // JSON 데이터로 변환
                    contentType: "application/json",
                    success: function(response) {
                        // 요청 성공 시 처리할 코드
                        alert("취소 성공");
                        // 성공적으로 삭제되면 체크된 체크박스를 가진 행을 삭제
                        $(".check-select:checked").closest("tr").remove();
                        
                        $.ajax({
                            url: "/sendCancelMessage",
                            type: "POST",
                            data: JSON.stringify(selectedDataList),
                            contentType: "application/json", 
                            success: function(response) {
                                console.log("메시지 전송 성공")
                            },
                            error: function(request, status, error) {
                                console.log("메시지 전송 실패: " + error);
                            }
                        });
                    },
                    error: function(request, status, error) {
                        // 요청 실패 시 처리할 코드
                        alert("취소 실패");
                        console.log("취소 실패" + error);
                    }
                });
            }
        } else {
            alert("취소할 예약을 선택해주세요.");
        }
    });
    
    $(".reminderBtn").on("click", function(event) {
    	event.preventDefault();

        let resourceName = $(this).closest('tr').find('td:nth-child(3)').text().trim();
        let calStartDate = $(this).closest('tr').find('td:nth-child(6)').text().split('~')[0];
        let calNo = $(this).closest('tr').find('td:nth-child(2)').text().trim();

        var confirmed = confirm("알림 메시지를 요청하시겠습니까?");

        if (confirmed) {
            $.ajax({
                url: "/sendMessage",
                type: "POST",
                data: {
                    resourceName: resourceName,
                    calStartDate: calStartDate,
                    empPhone: empPhone,
                    empNo: empNo,
                    calNo: calNo
                },
                success: function(response) {
                    alert("메시지 전송 성공");
                },
                error: function(request, status, error) {
                    alert("메시지 전송 실패");
                    console.log("취소 실패" + error);
                }
            });
        }
    });
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

