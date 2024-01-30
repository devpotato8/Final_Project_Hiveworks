<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.dna.hiveworks.model.code.PosCode" %>

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
							<h1>관리자설정</h1>&emsp;<button type="button" class="btn btn-primary" id="saveBtn">저장하기</button>
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
										<a class="nav-link active" data-bs-toggle="tab" href="#managerSettings">
											<span class="nav-link-text">관리자설정</span>
										</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="managerSettings">
										<h4>보안 등급별 열람 설정</h4>
										<figure>
											<table class="table">
												<tbody>
													<tr>
														<th>S등급</th>
														<td>기안 상에 설정된 관련자들만 문서 열람</td>
													</tr>
													<tr>
														<th>A등급</th>
														<td>결재 완료 후 직위
															<select name="${accessGrantSetting[1].DSG_CODE}">
																<c:forEach items="${posCodeList}" var="posCode">
																	<option value="${posCode }" 
																		<c:if test="${posCode eq accessGrantSetting[1].POS_CODE }">selected</c:if>
																	>${PosCode.valueOf(posCode).getCode() }</option>
																</c:forEach>
															</select>
															이상 기본 열람
														</td>
													</tr>
													<tr>
														<th>B등급</th>
														<td>결재 완료 후 직위
															<select name="${accessGrantSetting[2].DSG_CODE}">
																<c:forEach items="${posCodeList}" var="posCode">
																	<option value="${posCode }" 
																		<c:if test="${posCode eq accessGrantSetting[2].POS_CODE }">selected</c:if>
																	>${PosCode.valueOf(posCode).getCode() }</option>
																</c:forEach>
															</select>
															이상 기본 열람
														</td>
													</tr>
													<tr>
														<th>C등급</th>
														<td>모든 임직원이 문서 열람</td>
													</tr>
												</tbody>
											</table>
											<figcaption>
												※ S등급과 C등급은 설정할 수 없습니다.
											</figcaption>
										</figure>
										<br>
										<h4>문서 번호 설정</h4>
										<h5>회사 코드 설정</h5>
										<div class="form-group">
											<label for="edocPrefix" class="form-label">문서번호에 사용할 회사 코드를 정하세요.</label>
											<input type="text" name="edocPrefix" id="edocPrefix" class="form-control" value="${settings.edocPrefix}">
										</div>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<td>문서 등록 시점</td>
														<td>일련번호</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<input type="radio" name="edocDateFormat" id="dateformat1" value="YYYYMMDD" <c:if test='${settings.edocDateFormat eq "YYYYMMDD"}'>checked</c:if>><label for="dateformat1">연,월,일 8자(YYYYMMDD)</label><br>
															<input type="radio" name="edocDateFormat" id="dateformat2" value="YYMMDD" <c:if test='${settings.edocDateFormat eq "YYMMDD"}'>checked</c:if>><label for="dateformat2">연,월,일 6자(YYMMDD)</label><br>
															<input type="radio" name="edocDateFormat" id="dateformat3" value="YYYYMM" <c:if test='${settings.edocDateFormat eq "YYYYMM"}'>checked</c:if>><label for="dateformat3">연,월 6자(YYYYMM)</label><br>
															<input type="radio" name="edocDateFormat" id="dateformat4" value="YYMM" <c:if test='${settings.edocDateFormat eq "YYMM"}'>checked</c:if>><label for="dateformat4">연,월 4자(YYMM)</label><br>
															<input type="radio" name="edocDateFormat" id="dateformat5" value="YYYY" <c:if test='${settings.edocDateFormat eq "YYYY"}'>checked</c:if>><label for="dateformat5">연 4자(YYYY)</label><br>
															<input type="radio" name="edocDateFormat" id="dateformat6" value="YY" <c:if test='${settings.edocDateFormat eq "YY"}'>checked</c:if>><label for="dateformat6">연 2자(YY)</label>
														</td>
														<td>
															<input type="radio" name="edocNumFormat" id="numformat1" value="2" <c:if test='${settings.edocNumFormat eq 2}'>checked</c:if>><label for="numformat1">2자리 (ex.01)</label><br>
															<input type="radio" name="edocNumFormat" id="numformat2" value="3" <c:if test='${settings.edocNumFormat eq 3}'>checked</c:if>><label for="numformat2">3자리 (ex.001)</label><br>
															<input type="radio" name="edocNumFormat" id="numformat3" value="4" <c:if test='${settings.edocNumFormat eq 4}'>checked</c:if>><label for="numformat3">4자리 (ex.0001)</label>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="form-group">
											<label for="edocResult" class="form-label">결과</label>
											<input type="text" name="edocResult" id="edocResult" class="form-control" value="" disabled>
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
	const contextPath = '${path}';
</script>

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

<script src="${path}/resources/js/edoc/edoc-msetting.js"></script>

</div>
</body>
</html>