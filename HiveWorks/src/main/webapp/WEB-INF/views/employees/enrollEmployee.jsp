<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%-- 	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/> --%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<div class="container-xxl">
				<!-- Page Header -->
				<div class="hk-pg-header pt-7 pb-4">
					<h1 class="pg-title">직원 등록</h1>
					<p></p>
				</div>
				<!-- /Page Header -->

				<!-- Page Body -->
				<div class="hk-pg-body">
					<div class="row edit-profile-wrap">
						<div class="col-lg-2 col-sm-3 col-4">
							
						</div>
						<div class="col-lg-10 col-sm-9 col-8">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="tab_block_1">
									<form action="${path }/employees/enrollEmployeeEnd.do" method="post">
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<div class="media align-items-center">
														<div class="media-head me-5">
															<div class="avatar avatar-rounded avatar-xxl">
																<img src="dist/img/avatar3.jpg" alt="user" class="avatar-img">
															</div>
														</div>
														<div class="media-body">
															<div class="btn btn-soft-primary btn-file mb-1">
																사진 등록
																<input type="file" class="upload">
															</div>
															<div class="form-text text-muted">
																 이미지 크기 450px x 450px. 최대 5mb.
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>개인 정보</span></div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">성함</label>
													<input class="form-control" type="text" id="emp_name" name="emp_name" value=""/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">부서명</label>
													<select id="dept_code">
														<c:forEach var="p" items="${data.deptList}">
														<option value="${p.DEPTCODE }"><c:out value="${p.DEPTNAME }"/></option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<script>
										$("#searchId").keyup(e=>{
											const value=e.target.value;
											$.ajax({
												url:"${path}/searchDeptName",
												data:{"keyword":value},
												success:data=>{
													const emp_ids=data.split(",");
													$("#data").html("");
													emp_ids.forEach(e=>{
														const $op=$("<option>").attr("value",e).text(e);
														$("#data").append($op);
													});
												}
											})
										});
										</script>
										
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">사내전화</label>
													<input class="form-control" type="text" id="emp_phone" name="emp_phone" value=""/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">핸드폰번호</label>
													<input class="form-control" type="text" id="emp_cellphone" name="emp_cellphone" value=""/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">이메일</label>
													<input class="form-control" type="hidden" id="emp_email" name="emp_email" value=""/>
													<input class="form-control" type="text" id="email_id" name="email_id" value=""/>@
													<input class="form-control" type="text" id="domain-txt" name="email_form" value=""/>
													<select id="domain-list">
														<option value="none">직접 입력</option>
														<option value="naver.com">naver.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="daum.net">daum.net</option>
														<option value="nate.com">nate.com</option>
														<option value="kakao.com">kakao.com</option>
													</select>
												</div>
											</div>
										</div>
										<script>
										// 도메인 직접 입력 or domain option 선택
										const domainListEl = document.querySelector('#domain-list')
										const domainInputEl = document.querySelector('#domain-txt')
										// select 옵션 변경 시
										domainListEl.addEventListener('change', (event) => {
										  // option에 있는 도메인 선택 시
										  if(event.target.value !== "none") {
										    // 선택한 도메인을 input에 입력하고 disabled
										    domainInputEl.value = event.target.value
										    domainInputEl.disabled = true
										  } else { 
											// 직접 입력 시
										    // input 내용 초기화 & 입력 가능하도록 변경
										    domainInputEl.value = ""
										    domainInputEl.disabled = false
										  }
										});
										
										let $email = document.getElementById('#emp_email');
										let $emailId = document.getElementById('#email_id');
										
										$email.addEventListener('submit',(event)=>{
											
											event.target.value = $emailId + domainInputEl;
										});
										
										let $address = document.getElementById('#emp_address');
										
										
										$address.addEventListener('submit',(event)=>{
											
											event.target.value = $emailId + domainInputEl;
										});
										
										

										</script>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">직위</label>
													<select id="position_code">
														<c:forEach var="p" items="${data.positionList}">
														<option value="${p.POSITIONCODE }"><c:out value="${p.POSITIONNAME }"/></option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">직급</label>
													<select id="job_code">
														<c:forEach var="p" items="${data.jobList}">
														<option value="${p.JOBCODE }"><c:out value="${p.JOBNAME }"/></option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">근로상태</label>
													<select id="work_status">
														<c:forEach var="p" items="${data.workStatusList}">
														<option value="${p.WORKSTATUSCODE }"><c:out value="${p.WORKSTATUSNAME }"/></option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">근로형태</label>
													<select id="work_pattern">
														<c:forEach var="p" items="${data.workPatternList}">
														<option value="${p.WORKPATTERNCODE }"><c:out value="${p.WORKPATTERNNAME }"/></option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<label class="form-label">주소</label><br>
													<input type="hidden" id="emp_address" name="emp_address"/>
													<input type="text" id="sample6_postcode" placeholder="우편번호">
													<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
													<input type="text" id="sample6_address" placeholder="주소">
													<input type="text" id="sample6_detailAddress" placeholder="상세주소">
													<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
												
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">생년월일</label>
													<input class="form-control" type="text" value=""/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">주민번호</label>
													<input class="form-control" type="number" id="emp_resident_no" name="emp_resident_no" value=""/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<div class="form-label-group">
														<label class="form-label">기타메모</label>
														<small class="text-muted">1200</small>
													</div>
													<textarea class="form-control" rows="8" placeholder="Write an internal note"></textarea>
													<small class="form-text text-muted">
														Brief bio about yourself. This will be displayed on your profile page.
													</small>
												</div>
											</div>
										</div>
										<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>계좌정보</span></div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">은행</label>
													<input class="form-control" type="text" value=""/>
												</div>
												<div class="form-group">
													<label class="form-label">소유주</label>
													<input class="form-control" type="text" value=""/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">계좌번호</label>
													<input class="form-control" type="text" value=""/>
												</div>
											</div>
										</div>
										<button class="btn btn-primary mt-5" >저장</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Page Body -->		
			</div>
			
	<!-- jQuery -->
    <script src="${path }/resources/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="${path }/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="${path }/resources/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="${path }/resources/js/dropdown-bootstrap-extended.js"></script>

	<!-- Simplebar JS -->
	<script src="${path }/resources/vendors/simplebar/dist/simplebar.min.js"></script>

	<!-- Select2 JS -->
    <script src="${path }/resources/vendors/select2/dist/js/select2.full.min.js"></script>
    <script src="${path }/resources/js/select2-data.js"></script>
	
	<!-- Dropify JS -->
	<script src="${path }/resources/vendors/dropify/dist/js/dropify.min.js"></script>
	<script src="${path }/resources/js/dropify-data.js"></script>
	
	<!-- Init JS -->
	<script src="${path }/resources/js/init.js"></script>
	<script src="${path }/resources/js/contact-data.js"></script>
	<script src="${path }/resources/js/chips-init.js"></script>
	<!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
	
	
			
<%@ include file="/WEB-INF/views/common/footer.jsp"%>