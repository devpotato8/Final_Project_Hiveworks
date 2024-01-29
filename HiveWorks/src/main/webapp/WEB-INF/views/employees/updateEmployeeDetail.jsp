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
  background-color: #007D88;
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
  background-color: #007D88;
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
									<form action="${path }/employees/updateEmployeeEnd.do" method="post" enctype="multipart/form-data">
										<input type="hidden" id="modifier" name="modifier" value="${loginEmp.emp_no }"/>
										<input type="hidden" id="emp_no" name="emp_no" value="${employee.emp_no }" />
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<div class="media align-items-center">
														<div class="media-head me-5">
															<div class="avatar avatar-rounded avatar-xxl" id="imgContainer">
																<c:choose>
																	<c:when test="${employee.emp_profile_re_name eq null }">
																		<img src="${path }/resources/img/avatar12.jpg" alt="user" class="avatar-img">
																	</c:when>
																	<c:otherwise>
																		<img src="${path}/resources/upload/profile/${employee.emp_profile_re_name}" alt="user" class="avatar-img">
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
														<div class="media-body">
															<div class="btn btn-soft-primary btn-file mb-1">
																사진 등록
																<input type="file" class="upload" id="emp_profile_ori_name" name="upFile" onchange="fn_change_file();" value="${employee.emp_profile_re_name}" accept="image/*">
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
													<label class="form-label">*성함</label>
													<input class="form-control" type="text" id="emp_name" name="emp_name" value="${employee.emp_name}" required="required"/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">*입사일</label>
													<input class="form-control" type="date" id="emp_hired_date" name="emp_hired_date" value="${employee.emp_hired_date }" required="required"/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">*주민번호</label>
													<input class="form-control" type="text" id="emp_resident_no" name="emp_resident_no" 
													onkeyup="fn_auto_hypen_resident(event);fn_auto_birthdate(event,birth);" value="${employee.emp_resident_no }" placeholder="123456-1234567" maxlength="14" required="required"/>
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
													<input class="form-control" type="text" id="emp_phone" onkeyup="fn_auto_hypen_phone(event);" name="emp_phone" value="${employee.emp_phone }" maxlength="13"/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">*핸드폰번호</label>
													<input class="form-control" type="text" id="emp_cellphone" name="emp_cellphone" onkeyup="fn_auto_hypen_cellPhone(event);" value="${employee.emp_cellphone }" required="required"/>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">이메일</label><br>
													<input class="form-control" type="text" id="email_id" name="email_id" value="${emailId}" style="width:200px; display:inline-block;"/>@
													<input class="form-control" type="text" id="domain-txt" name="email_form" value="${emailDomain}" style="width:200px; display:inline-block;"/>
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
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">부서명</label>
														<select id="dept_code" name="dept_code">
															<option value="null">선택</option>
															<c:forEach var="p" items="${data.deptList}">
																<option value="${p.DEPTCODE }" ${p.DEPTCODE eq employee.dept_code?"selected":""}>
																	<c:out value="${p.DEPTNAME }"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>	
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">*직위</label>
														<select id="position_code" name="position_code" required="required">
															<option value="null">선택</option>
															<c:forEach var="p" items="${data.positionList}">
																<option value="${p.POSITIONCODE }" ${p.POSITIONCODE eq employee.position_code?"selected":""}>
																	<c:out value="${p.POSITIONNAME }"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">*직무</label><br>
														<select id="job_code" name="job_code" required="required">
															<option value="null">선택</option>
															<c:forEach var="p" items="${data.jobList}">
															<option value="${p.JOBCODE }" ${p.JOBCODE eq employee.job_code?"selected":""} >
															<c:out value="${p.JOBNAME }"/>
															</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">*근로상태</label>
														<select id="work_status" name="work_status" required="required">
															<option value="null">선택</option>
															<c:forEach var="p" items="${data.workStatusList}">
																<option value="${p.WORKSTATUSCODE }" ${p.WORKSTATUSCODE eq employee.work_status?"selected":""}>
																	<c:out value="${p.WORKSTATUSNAME }"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">*근로형태</label>
														<select id="work_pattern" name="work_pattern" required="required">
															<option value="null">선택</option>
															<c:forEach var="p" items="${data.workPatternList}">
																<option value="${p.WORKPATTERNCODE }" ${p.WORKPATTERNCODE eq employee.work_pattern?"selected":""} >
																	<c:out value="${p.WORKPATTERNNAME }"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">*근무유형</label>
														<select id="work_type_code" name="work_type_code" required="required">
															<option value="null">선택</option>
															<c:forEach var="p" items="${data.workTypeList}">
															<option value="${p.WORKTYPECODE }" ${p.WORKTYPECODE eq employee.work_type_code?"selected":""}>
																<c:out value="${p.WORKTYPENAME }"/>
															</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-12">
												<div class="form-group">
													<label class="form-label">주소</label><br>
													<input class="form-control" type="text" id="sample6_postcode" name="emp_postcode" value="${employee.emp_postcode}" placeholder="우편번호" style="width:200px; display: inline-block;">
													<input class="btn btn-soft-primary btn-file mb-1" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
													<input class="form-control" type="text" id="sample6_address" name="emp_address" value="${employee.emp_address}" placeholder="주소" style="width:500px;">
													<input class="form-control" type="text" id="sample6_detailAddress" name="emp_address_detail" value="${employee.emp_address_detail}" placeholder="상세주소" style="width:500px;">
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
													<textarea class="form-control" id="emp_memo" name="emp_memo" rows="8" placeholder="특이사항이 있다면 입력해 주세요." style="resize:none;"><c:out value="${employee.emp_memo }"/></textarea>
												</div>
											</div>
										</div>
										<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>계좌정보</span></div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="custom-select" style="width:200px;">
														<label class="form-label">은행</label>
														<select id="ac_bank" name="ac_bank">
															<option value="신한은행" ${account.ac_bank eq '신한은행'?"selected":""} >신한은행</option>
															<option value="농협은행" ${account.ac_bank eq '농협은행'?"selected":""}>농협은행</option>
															<option value="KB국민은행" ${account.ac_bank eq 'KB국민은행'?"selected":""}>KB국민은행</option>
															<option value="하나은행" ${account.ac_bank eq '하나은행'?"selected":""}>하나은행</option>
															<option value="우리은행" ${account.ac_bank eq '우리은행'?"selected":""}>우리은행</option>
															<option value="기업은행" ${account.ac_bank eq '기업은행'?"selected":""}>기업은행</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="form-label">계좌번호</label>
													<input class="form-control" type="number" id="ac_no" name="ac_no"  value="${account.ac_no}"/>
												</div>
												<div class="form-group">
													<label class="form-label">소유주</label>
													<input class="form-control" type="text" id="ac_name" name="ac_name" value="${account.ac_name}"/>
												</div>
											</div>
										</div>
										<button class="btn btn-primary mt-5">수정</button>
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
				}
				
				reader.readAsDataURL(file);
			}
			let $value = document.getElementById('emp_profile_ori_name');
			console.log($value.value);
		}
	</script>
<script>
//아이디 중복 검사 기능
	fn_idDuplicate=()=>{
		let value=document.getElementById('emp_id').value;
		let $message = document.getElementById('idMessage');
		
		$.ajax({
			url:"${path}/employees/searchEmployeeId",
			data:{emp_id:value},
			success:data=>{
				$message.innerHTML = data;
			}
		})
	}
</script>
	<script>
	let fn_auto_hypen_resident=(e)=>{
		e.target.value = e.target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2')
		.replace(/-{1,2}$/g, '');	
	};
	
	let fn_auto_hypen_phone=(e)=>{
		
		let checkPhone =e.target.value
		.replace(/[^0-9]/g, '');
		
		if(checkPhone.startsWith('02')){
			e.target.value=e.target.value
			.replace(/[^0-9]/g, '')
			.replace(/^(\d{2})(\d{3,4})(\d{4})$/g, '$1-$2-$3')
			.replace(/-{1,2}$/g, '');				
		}else{
			e.target.value=e.target.value
			.replace(/[^0-9]/g, '')
			.replace(/^(\d{3})(\d{3,4})(\d{4})$/g, '$1-$2-$3')
			.replace(/-{1,2}$/g, '');
		}
	}
	
	let fn_auto_hypen_cellPhone=(e)=>{
		e.target.value=e.target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{3})(\d{4})(\d{4})$/g, '$1-$2-$3')
		.replace(/-{1,2}$/g, '');
	}
	
	</script>
	
	
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
	<script>
var x, i, j, l, ll, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
l = x.length;
for (i = 0; i < l; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  ll = selElmnt.length;
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < ll; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h, sl, yl;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        sl = s.length;
        h = this.parentNode.previousSibling;
        for (i = 0; i < sl; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            yl = y.length;
            for (k = 0; k < yl; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, xl, yl, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  xl = x.length;
  yl = y.length;
  for (i = 0; i < yl; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < xl; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>
<script>
// 이메일 도메인 자동부여
// 도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain-list')
	const domainInputEl = document.querySelector('#domain-txt')
	// select 옵션 변경 시
	domainListEl.addEventListener('change', (event) => {
	  // option에 있는 도메인 선택 시
	  if(event.target.value !== "none") {
	    // 선택한 도메인을 input에 입력하고 readOnly
	    domainInputEl.value = event.target.value
	    domainInputEl.readOnly = true
	  } else { 
		// 직접 입력 시
	    // input 내용 초기화 & 입력 가능하도록 변경
	    domainInputEl.value = ""
	    domainInputEl.readOnly = false
	  }
	});
</script>
<script>
//비밀번호 정규표현식
//영문 숫자 조합 8자리 이상
let reg_ver1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
//영문 숫자 특수기호 조합 8자리 이상
let reg_ver2 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

let pw_first = document.getElementById('emp_pw');
let pw_second = document.getElementById('emp_pw_check');
let pw_message = document.getElementById('pwMessage');
let msg = "";

fn_check_password=()=>{
	if(!reg_ver1.test(pw_first.value)){
		msg = "숫자와 영문자 조합으로 8~25자리를 사용해야 합니다.";
		pw_message.innerHTML = msg;
	}else{
		if(pw_first.value!==pw_second.value){
			msg = "비밀번호가 서로 달라요!";
			pw_message.innerHTML = msg;
		}else{
			msg = "비밀번호가 일치합니다!";
			pw_message.innerHTML = msg;
		}
	}
}
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