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
<style>
/*the container must be positioned relative:*/
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element:*/
}

.select-selected {
  background-color: MediumSeaGreen;
}

/*style the arrow inside the select element:*/
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}

/*style items (options):*/
.select-items {
  position: absolute;
  background-color: MediumSeaGreen;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/*hide the items when the select box is closed:*/
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}

/* input number의 스핀버튼 제거 */
input[type=number] {
  -moz-appearance: textfield;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}

</style>


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
									<form action="#" method="post" enctype="multipart/form-data">
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<div class="media align-items-center">
														<div class="media-head me-5">
															<div class="avatar avatar-rounded avatar-xxl" id="imgContainer">
																<img src="${path }/resources/upload/profile/${employee.emp_profile_re_name}" alt="user" class="avatar-img">
															</div>
														</div>
														<div class="media-body">
														</div>	
													</div>
												</div>
											</div>
										</div>
										<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>개인 정보</span></div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">아이디</label>
													<input class="form-control" type="text" id="emp_id" name="emp_id" value="${employee.emp_id}" readonly="readonly"/>
													<div id="idMessage"></div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">사원번호</label>
													<input class="form-control" type="text" id="emp_no" name="emp_no" value="${employee.emp_no}" readonly="readonly"/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">성함</label>
													<input class="form-control" type="text" id="emp_name" name="emp_name" value="${employee.emp_name}" readonly="readonly"/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">입사일</label>
													<input class="form-control" type="date" id="emp_hired_date" name="emp_hired_date" value="${employee.emp_hired_date}" readonly="readonly"/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">주민번호</label>
													<input class="form-control" type="text" id="emp_resident_no" name="emp_resident_no" value="${employee.emp_resident_no }" readonly="readonly"/>
												</div>
											</div>
										</div>
										
 										<!-- <div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">생년월일</label>
													<input class="form-control" type="text" value=""/>
												</div>
											</div>
										</div> -->
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">사내전화</label>
													<input class="form-control" type="text" id="emp_phone" name="emp_phone" value="${employee.emp_phone}" readonly="readonly"/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">핸드폰번호</label>
													<input class="form-control" type="text" id="emp_cellphone" name="emp_cellphone" value="${employee.emp_cellphone}" readonly="readonly"/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">이메일</label><br>
													<input class="form-control" type="text" id="email_id" name="email_id" value="${employee.emp_email}" readonly="readonly" style="width:200px; display:inline-block;"/>
												</div>
											</div>
										</div>			
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">부서명</label>
														<input class="form-control" type="text" value="${employee.dept_name }" readonly="readonly"/>				
													</div>
												</div>
											</div>
										</div>	
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">직위</label>
														<input class="form-control" type="text" id="position_code" name="position_code" value="${employee.position_name }" readonly="readonly"/>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">직무</label><br>
														<input class="form-control" type="text" id="job_code" name="job_code" value="${employee.job_name }" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">근로상태</label>
														<input class="form-control" type="text" id="work_status" name="work_status" value="${employee.work_status_name }" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">근로형태</label>
														<input class="form-control" type="text" id="work_pattern" name="work_pattern" value="${employee.work_pattern_name }" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">근무유형</label>
														<input class="form-control" type="text" id="work_type_code" name="work_type_code" value="${employee.work_type_name }" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<label class="form-label">주소</label><br>
													<input class="form-control" type="text" id="sample6_postcode" name="emp_postcode" value="${employee.emp_postcode }" readonly="readonly" placeholder="우편번호" style="width:200px; display: inline-block;">
													<input class="form-control" type="text" id="sample6_address" name="emp_address" value="${employee.emp_address }" readonly="readonly" placeholder="주소" style="width:500px;">
													<input class="form-control" type="text" id="sample6_detailAddress" name="emp_address_detail" value="${employee.emp_address_detail }" readonly="readonly" placeholder="상세주소" style="width:500px;">
													<input class="form-control" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
												
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
													<textarea class="form-control" id="emp_memo" name="emp_memo" rows="8" readonly="readonly" placeholder="특이사항이 있다면 입력해 주세요." style="resize:none;"><c:out value="${employee.emp_memo }"/></textarea>
												</div>
											</div>
										</div>
										<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>계좌정보</span></div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">은행</label>
														<input class="form-control" type="text" id="ac_bank" name="ac_bank" value="${account.ac_bank }" readonly="readonly"/>
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">계좌번호</label>
													<input class="form-control" type="number" id="ac_no" name="ac_no"  value="${account.ac_no }" readonly="readonly"/>
												</div>
												<div class="form-group">
													<label class="form-label">예금주</label>
													<input class="form-control" type="text" id="ac_name" name="ac_name" value="${account.ac_name }" readonly="readonly"/>
												</div>
											</div>
										</div>
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
	//프로필 사진 보이게 하기
		fn_change_file=()=>{
			let $profile =document.getElementById('emp_profile_ori_name');
			let file = $profile.files[0];
			
			if(file){
				let reader = new FileReader();
				reader.onload = function(e){
					let imageContainer = document.getElementById('imgContainer');
					let img = document.createElement('img');
					img.src = e.target.result;
					img.alt = '프로필 사진';
					img.style.maxWidth = '150px';
					//img.name = 'upFile';
					
					imageContainer.innerHTML = '';
					imageContainer.appendChild(img);
					
					console.log(img);
				}
				
				reader.readAsDataURL(file);
			}
		}
	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>