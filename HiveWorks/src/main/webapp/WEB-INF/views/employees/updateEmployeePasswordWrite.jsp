<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="str" value="${employee.emp_email}" />
<c:set var="index" value="${fn:indexOf(str,'@')}" />
<c:set var="len" value="${fn:length(str)}" />
<c:set var="emailId" value="${fn:substring(str,0,index)}"/>
<c:set var="emailDomain" value="${fn:substring(str,index+1,len)}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%-- 	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/> --%>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
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
					<h1 class="pg-title">직원 수정</h1>
					<p></p>
				</div>
				<!-- /Page Header -->

				<!-- Page Body -->
				<div class="hk-pg-body">
					<div class="row edit-profile-wrap">
						<div class="col-lg-2 col-sm-3 col-4">
							<div class="nav-profile mt-4">
								<div class="nav-header">
									<span>HiveWorks 정보 내역</span>
								</div>
								<ul class="nav nav-light nav-vertical nav-tabs">
									<li class="nav-item">
										<input type="hidden" id="path" value="${path }"/>
										<a href="#" onclick="fn_updateEmployeeDetail(${employee.emp_no});">
											기본정보 수정
										</a>
									</li>
									<li class="nav-item">
										<a href="#" onclick="fn_updateEmployeePasswordCheck(${employee.emp_no});">
											비밀번호 수정
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-10 col-sm-9 col-8">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="tab_block_1">
									<form action="#" method="post">
										<input type="hidden" id="modifier" name="modifier" value="${loginEmp.emp_no!=null?loginEmp.emp_no:0 }"/>
										<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>개인 정보</span></div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">아이디</label>
													<input class="form-control" type="text" id="emp_id" name="emp_id" value="${employee.emp_id }" readonly="readonly"/>
													<div id="idMessage"></div>
													<!-- <button type="button" onclick="fn_idDuplicate();" class="btn btn-soft-primary btn-file mb-1" >중복확인</button> -->
												</div>
											</div>
										</div>

										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">새 비밀번호</label>
													<input class="form-control" type="password" id="emp_pw_new" name="emp_pw_new" value="" min="8" maxlength="25" required="required" />
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">새 비밀번호 확인</label>
													<input class="form-control" type="password" id="emp_pw_newCheck" name="emp_pw_newCheck" onkeyup="fn_check_password();"  value="" min="8" maxlength="25" required="required"/>
													<div id="pwMessage"></div>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-primary mt-5" id="submitBtn">수정</button>
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
//비밀번호 정규표현식
//영문 숫자 조합 8자리 이상
let reg_ver1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
//영문 숫자 특수기호 조합 8자리 이상
let reg_ver2 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

let pw_first = document.getElementById('emp_pw_new');
let pw_second = document.getElementById('emp_pw_newCheck');
let pw_message = document.getElementById('pwMessage');
let msg = "";
let count=0;

fn_check_password=()=>{
	if(!reg_ver1.test(pw_first.value)){
		msg = "숫자와 영문자 조합으로 8~25자리를 사용해야 합니다.";
		pw_message.innerHTML = msg;
		count=1;
	}else{
		if(pw_first.value!==pw_second.value){
			msg = "비밀번호가 서로 다릅니다!";
			pw_message.innerHTML = msg;
			count=1;
		}else{
			msg = "비밀번호가 일치합니다!";
			pw_message.innerHTML = msg;
			count=0;
		}
	}
}

let submitBtn = document.getElementById("submitBtn");
let emp_id = document.getElementById("emp_id");
let modifier = document.getElementById("modifier");

submitBtn.addEventListener('click',(event)=>{
	fn_check_password();
	
 	if(count===1){
		alert("새 비밀번호를 확인해 주세요.")
		return;
	}
 	if(count!==1){
		$.ajax({
			method:"POST",
			url:"${path}/employees/updatePassword",
			data:{
				empId:emp_id.value,
				empPassword:pw_first.value,
				modifier:modifier.value
				},
			success:data=>{
				if(data>0){
					alert("비밀번호 변경 성공!");
					location.assign("${path}/employees/employeeList");
				}
				else{
					alert("비밀번호가 조건에 맞지 않습니다!")
				}
			}
		})
	}
});

</script>
<script>
//updateEmployeeDetail로 a태그를 post방식으로 보내기(update)
fn_updateEmployeeDetail=(event)=>{
	let $form = document.createElement('form');
	
	let $path = document.getElementById('path');
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','emp_no');
	obj.setAttribute('value',event);
	
	$form.appendChild(obj);
	$form.setAttribute('method','post');
	$form.setAttribute('action',$path.value+'/employees/updateEmployeeDetail');
	document.body.appendChild($form);
	
	$form.submit();
	
};

//updateEmployeeDetail로 a태그를 post방식으로 보내기(update)
fn_updateEmployeePasswordCheck=(event)=>{
	let $form = document.createElement('form');
	
	let $path = document.getElementById('path');
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','emp_no');
	obj.setAttribute('value',event);
	
	$form.appendChild(obj);
	$form.setAttribute('method','post');
	$form.setAttribute('action',$path.value+'/employees/updateEmployeePasswordCheck');
	document.body.appendChild($form);
	
	$form.submit();
	
};


</script>		
<%@ include file="/WEB-INF/views/common/footer.jsp"%>