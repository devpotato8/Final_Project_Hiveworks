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
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<style>
.schedulemenu:hover{
		background-color: #ebf5f5;
    	cursor: pointer;
    	width:auto;
    	max-width:300px;
	}
</style>
<div>
			<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="blogapp-wrap">
					<nav class="blogapp-sidebar">
						<div data-simplebar class="nicescroll-bar">
							<div class="menu-content-wrap">
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item">
											<a class="nav-link schedulemenu" href="${path }/schedule/reservationlistbyno">
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
												<li class="nav-item schedulemenu">
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
										<li class="nav-item schedulemenu">
											<a class="nav-link" href="${path }/schedule/reservationlist">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="flag"></i></span></span>
												<span class="nav-link-text">전체 예약/대여 조회</span>
											</a>
										</li>
										
										<li class="nav-item schedulemenu">
											<a class="nav-link" href="${path}/schedule/resourcelist">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="grid"></i></span></span>
												<span class="nav-link-text">전사자산 목록</span>
											</a>
										</li>
									</ul>
								</div>
								</c:if>

					</nav>
					<div class="blogapp-content">
						<div class="blogapp-detail-wrap">
							<header class="blog-header">
								<div class="d-flex align-items-center">
									<a class="blogapp-title link-dark" href="#">
										<h1>${loginEmp.emp_name}님의 예약 현황</h1>
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
							<button type="button" class="btn btn-secondary" id="delReserveBtn">예약취소</button>
								<div data-simplebar class="nicescroll-bar">
								<div style="display:flex">
						<select name="type" id="searchType" class="form-select" aria-label="Default select example" style="width: 114px;">
							<option value="resource_name">자산이름</option>
							<option value="cal_status">예약상태</option>
						</select>
						<input type="text" name="keyword" id="searchKeyword" placeholder="검색어입력" class="form-control" style="width: 225px;">
						<button id="searchButton" class="btn btn-light">검색</button>
										<!-- <div class="dropdown" id="resType">
											<a class="btn btn-outline-light dropdown-toggle  d-sm-inline-block d-none" href="#" data-bs-toggle="dropdown">자산타입</a>
											<div class="dropdown-menu dropdown-menu-end">
												<a class="dropdown-item" href="#" data-type="회의실"><span class="feather-icon dropdown-icon"><i data-feather="flag"></i></span><span>회의실</span></a>
												<a class="dropdown-item" href="#" data-type="챠량"><span class="feather-icon dropdown-icon" ><i data-feather="grid"></i></span><span>차량</span></a>
												<a class="dropdown-item" href="#" data-type="빔프로젝터"><span class="feather-icon dropdown-icon"><i data-feather="tag"></i></span><span>빔프로젝터</span></a>
											</div>
										</div>
										<div class="dropdown" id="resStatus">
											<a class="btn btn-outline-light dropdown-toggle  d-sm-inline-block d-none" href="#" data-bs-toggle="dropdown">예약상태</a>
											<div class="dropdown-menu dropdown-menu-end">
												<a class="dropdown-item" href="#" data-status="승인완료"><span class="feather-icon dropdown-icon"></span><span>승인완료</span></a>
												<a class="dropdown-item" href="#" data-status="취소"><span class="feather-icon dropdown-icon"></span><span>취소</span></a>
											</div>
										</div>  -->
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
															<th>예약일자</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty MyReserveList}">
															<c:forEach var="myres" items="${MyReserveList}">
														<tr>
															<td><input type="checkbox" class="form-check-input check-select" id="customCheck+${myres.calNo}"></td>
															<td>${myres.calNo }</td>
															<td class="mw-250p text-truncate text-high-em">
																<span>${myres.resource.resourceName }</span>
															</td>
															<td>
																<div class="media align-items-center">
																	<div class="media-body">
																		<span class="d-block">${myres.myEmpName }</span> 
																	</div>
																</div>													
															</td>
															<td>${myres.resource.resourceType }</td>
															<td>${myres.calStartDate.toString().substring(0, 16)} ~ ${myres.calEndDate.toString().substring(0, 16)}</td>
															<td>${myres.calStatus }</td>
															<td>${myres.createDate }</td>
															<c:if test="${myres.calStatus == '승인완료'}">
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
																		<a class="dropdown-item updateBtn" href="${path}/schedule/updateReservation?resourceNo=${myres.resource.resourceNo}&calNo=${myres.calNo}">수정</a>
																		<span class="dropdown-item reminderBtn">메시지알림요청</span>
																	</div>
																</div>
																</div>
															</td>
														</c:if>
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
					</div>
				</div>
			</div>
			<!-- /Page Body -->
		</div>
		<!-- /Main Content -->	
<script>
const empPhone = '${loginEmp.emp_cellphone}'; //수정필요
const empNo = ${loginEmp.emp_no}; //수정 필요
var loginAut = '${loginEmp.aut_code}';

var contextPath = "<c:out value='${path}'/>";

//페이지 새로고침
$(document).ready(function() {
    $("#refreshButton").click(function(e) {
        e.preventDefault(); // 기본 클릭 이벤트를 방지함
        location.reload(); // 페이지를 새로고침함
    });
});

//타입별로 조회
$(document).ready(function() {
	$('#searchButton').on('click',function(e) {
		e.preventDefault();

		var type = $('#searchType').val();
	    var keyword = $('#searchKeyword').val();

		$.ajax({
			url : contextPath+'/schedule/reserveBykeyword',
			type : 'POST',
			data : {
				type : type,
				keyword : keyword,
				empNo: empNo
			},
			dataType : 'json',
			success : function(response) {
				// 기존 테이블 내용 초기화
		        $('#datable_1 tbody').empty();

		        // 응답 데이터를 이용하여 새로운 행 추가
		        response.forEach(function(item) {
		        	  // 테이블 내용을 비웁니다.
	                $('#datable_1 tbody').empty();

	                // response 배열을 반복하면서 HTML 테이블 행을 만듭니다.
	                response.forEach(function(item) {
	                	 var row = $('<tr></tr>');
	                     var checkBoxTd = $('<td></td>');
	                     var checkBox = $('<input>').attr({
	                         type: 'checkbox', 
	                         class: 'form-check-input check-select', 
	                         id: 'customCheck' + item.calNo // 고유한 ID를 가지도록 합니다.
	                     });
	                     var label = $('<label>').addClass('form-check-label').attr('for', 'customCheck' + item.calNo);
	                     checkBoxTd.append($('<span></span>').addClass('form-check').append(checkBox).append(label));
	                    row.append(checkBoxTd);
	                    row.append($('<td></td>').text(item.calNo));
	                    row.append($('<td></td>').addClass('mw-250p text-truncate text-high-em').append($('<span></span>').text(item.resource.resourceName)));
	                    row.append($('<td></td>').append($('<div></div>').addClass('media align-items-center').append($('<div></div>').addClass('media-body').append($('<span></span>').addClass('d-block').text(item.myEmpName)))));
	                    row.append($('<td></td>').text(item.resource.resourceType));
	                    row.append($('<td></td>').text(item.calStartDate + ' ~ ' + item.calEndDate));
	                    row.append($('<td></td>').text(item.calStatus));
	                    row.append($('<td></td>').text(item.createDate));

	                    var actions = $('<td></td>').addClass('d-flex align-items-center');
	                    var dropdown = $('<div></div>').addClass('dropdown');
	                    var button = $('<button></button>').addClass('btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret')
	                        .attr('aria-expanded', 'false')
	                        .attr('data-bs-toggle', 'dropdown')
	                        .append($('<span></span>').addClass('icon').append($('<span></span>').addClass('feather-icon').append($('<i></i>').attr('data-feather', 'more-vertical'))));

	                    var menu = $('<div></div>').addClass('dropdown-menu dropdown-menu-end')
	                        .append($('<a></a>').addClass('dropdown-item updateBtn').attr('href',contextPath+'/schedule/updateReservation?resourceNo=' + item.resource.resourceNo + '&calNo=' + item.calNo).text('수정'))
	                        .append($('<span></span>').addClass('dropdown-item reminderBtn').text('메시지 알림 요청'));
						
	                    dropdown.append(button);
	                    dropdown.append(menu);
	                    actions.append(dropdown);
	                    if(item.calStatus == '승인완료'){
	                    row.append(actions);
						}
						
	                    $('#datable_1 tbody').append(row);
	                });

	                // Feather Icons 초기화
	                feather.replace();
		        });
				
				
			},
			error : function(request, status, error) {
				// 요청 실패 시 처리할 코드
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

    $("#delReserveBtn").click(function() {
        var checkedList = [];
        var selectedDataList = [];

        // 체크된 체크박스를 찾아 예약 번호를 checkedList에 추가
        $(".check-select:checked").each(function() {
        	
        	
            var reserveNo = $(this).closest("tr").find("td:eq(1)").text();
            var resourceName = $(this).closest('tr').find('td:nth-child(3)').text().trim();
            const calStartDateRaw = $(this).closest('tr').find('td:nth-child(6)').text().split('~')[0];
            const calStartDate = calStartDateRaw.trim(); // 앞뒤 공백을 제거합니다.

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
            
            var $selectedRows = $(".check-select:checked").not(".form-check-input.check-select-all").closest("tr");

            if (confirmed) {
                $.ajax({
                    url: contextPath+"/schedule/deleteReservation", // 삭제 요청을 처리할 서버 URL
                    type: "POST",
                    data: JSON.stringify(checkedList), // JSON 데이터로 변환
                    contentType: "application/json",
                    success: function(response) {
                        // 요청 성공 시 처리할 코드
                        alert("취소 성공");
                        // 성공적으로 삭제되면 체크된 체크박스를 가진 행을 삭제
                        $selectedRows.each(function() {
			                $(this).find("td:eq(6)").text('취소');
			                $(this).find("td:eq(8)").remove();
			            });
                        
                        $.ajax({
                            url: contextPath+"/sendCancelMessage",
                            type: "POST",
                            data: JSON.stringify(selectedDataList),
                            contentType: "application/json", 
                            success: function(response) {
                            },
                            error: function(request, status, error) {
                            }
                        });
                    },
                    error: function(request, status, error) {
                        // 요청 실패 시 처리할 코드
                        alert("취소 실패");
                    }
                });
            }
        } else {
            alert("취소할 예약을 선택해주세요.");
        }
    });

    
    $('#datable_1 tbody').on('click', '.reminderBtn', function(event) {
    	event.preventDefault();

        const resourceName = $(this).closest('tr').find('td:nth-child(3)').text().trim();
        const calStartDateString = $(this).closest('tr').find('td:nth-child(6)').text().split('~')[0].trim();
       	const calStartDateRaw = $(this).closest('tr').find('td:nth-child(6)').text().split('~')[0];
        const calStartDate = calStartDateRaw.trim(); // 앞뒤 공백을 제거합니다.
        const calNo = $(this).closest('tr').find('td:nth-child(2)').text().trim();

        var confirmed = confirm("알림 메시지를 요청하시겠습니까?");

        if (confirmed) {
            $.ajax({
                url: contextPath+"/sendMessage",
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
                }
            });
        }
    });
    
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>