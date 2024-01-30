<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
</jsp:include>

<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
		<!-- Main Content -->
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="invoiceapp-wrap">
					<div class="invoiceapp-content" style="padding-left: 0;">
						<div class="invoiceapp-detail-wrap">
							<header class="invoice-header">
								<div class="d-flex align-items-center">
									<span class="invoiceapp-title link-dark">
										<h1>시간 외 근로수당</h1>
									</span>
								</div>
							</header>
							<button class="btn btn-primary btn-sm" onclick="fn_apply_overtimepay();" style="width:100px">신청하기</button>
							<div class="invoice-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="invoice-list-view">
										<table data-order='[[ 1, "desc" ]]' id="datable_1" class="table nowrap w-100 mb-5">
											<thead>
												<tr>
													<th><span class="form-check mb-0">
														<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
														<label class="form-check-label" for="customCheck1"></label>
													</span></th>
													<th>근무날짜</th>
													<th>이름</th>
													<th>부서명</th>
													<th>근무시작시간</th>
													<th>근무마감시간</th>
													<th>초과시간</th>
													<th>총금액</th>
													<th>신청상태</th>
													<!-- <th>신청하기</th> -->
												</tr>
											</thead>
											<input type="hidden" id="emp_no" value="${workList.get(0).emp_no }"/>
											<tbody>
												<c:forEach var="op" items="${workList}">
												<c:forEach var="s" items="${op.employees }">
												<c:forEach var="w" items="${s.work }">
												<tr>
													<td></td>
													<td>
														<input type="hidden" value="${w.workNo }"/>
														<c:out value="${w.workDay }" />
													</td>
													<td>
														<div class="text-dark"><c:out value="${s.emp_name }" /></div>
													</td>
													<td><c:out value="${s.dept_name }" /></td>
													<td>
														<c:set var="workEndTime" value="${w.workEndTime }" />
														<c:set var="workOvertimeEnd">
															<fmt:formatDate value="${workEndTime }" pattern="HH:mm"/>
														</c:set>
														<c:set var="workOvertimeEndToTime">
															<fmt:parseDate value="${workOvertimeEnd }" pattern="HH:mm"/>
														</c:set>
														<fmt:parseDate var="targetTime" value="18:00" pattern="HH:mm"/>
														<c:choose>
															<c:when test="${workOvertimeEndToTime gt targetTime}">
																<c:out value="18:00"/>
															</c:when>
															<c:otherwise>
																조기퇴근
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<fmt:formatDate value="${workEndTime }" pattern="HH:mm"/>
													</td>
													<td>
														<c:set var="overtimeBy" value="${w.overtimeBy }"/>
														<c:choose>
															<c:when test="${overtimeBy>=1 && overtimeBy<=3 }">
																<c:out value="${overtimeBy }"/> 시간
															</c:when>
															<c:when test="${overtimeBy>3 }">
																<c:out value="${overtimeBy }"/> 시간
																(3시간)
															</c:when>
															<c:otherwise>
																<c:out value="${overtimeBy }"/> 시간
															</c:otherwise>
														</c:choose>
													
													</td>
													<td>
													<c:choose>
														<c:when test="${w.overtimeBy>=1 && w.overtimeBy<=3 }">
															<c:set var="ot_pay" value="${w.overtimeBy*10000 }"/>
															<fmt:formatNumber value="${ot_pay }" type="number"/>원
														</c:when>
														<c:when test="${w.overtimeBy>3}">
															30,000원
														</c:when>
														<c:otherwise>
															 -
														</c:otherwise>
													</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${w.overtimeBy>=1 }">
																<c:out value="${op.ot_pay_no==0?'미신청':'신청완료' }"/>
															</c:when>
															<c:otherwise>
																신청불가
															</c:otherwise>
														</c:choose>
													</td>
													<!-- <td>
														<div class="d-flex">
															<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Edit" href="#"><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
															<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Delete" onclick='fn_delete_confirm();' ><span class="btn-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span></a>
														</div>
													</td> -->
												</tr>
												</c:forEach>
												</c:forEach>
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
	
	let workNo = "";
	let empNo = document.getElementById('emp_no').value;
	$(document).ready(function() {
	    $('input[type="checkbox"]').change(function() {
	        if(this.checked) {
	            var row = $(this).closest('tr');
				
	            var secondInputWorkNo = row.find('input:eq(1)').val();
	            //var firstCell = row.find('td:eq(0)').text(); // 첫 번째 셀 값
	            //var secondCell = row.find('td:eq(1)').text(); // 두 번째 셀 값
	            //var thirdCell = row.find('td:eq(2)').text();
	            var overtime = row.find('td:eq(6)').text();
	            
	            if(overtime>=1 && overtime<=3){
		            if(workNo==""){
		            	workNo = secondInputWorkNo;
		            }else{
		            	workNo += ","+secondInputWorkNo;
		            }	            	
	            }
	        }
	    });
	});

	fn_apply_overtimepay=()=>{
		fetch('${path}/overtimepay/applyOvertimePay',{
			method:'POST',
			headers:{
				'Content-Type' : 'application/json',
			},
			body: JSON.stringify({
				empNo:empNo,
				workNo:workNo
			}),
		})
		.then(response=>{
			if(!response.ok){
			}
			return console.log(response);
		});
	

		
	
	}

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>