<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.dna.hiveworks.model.code.*" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp"%> --%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<!-- Main Content -->
<div class="hk-pg-wrapper pb-0">
	<!-- Page Body -->
	<div class="hk-pg-body py-0">
		<div class="fmapp-wrap fmapp-sidebar-toggle">
			<!-- PageSideBar -->
			<jsp:include page="/WEB-INF/views/edoc/common/edocSideBar.jsp">
			 	<jsp:param value="${currentPage }" name="currentPage"/>
			</jsp:include>
			<div class="fmapp-content">
				<div class="fmapp-detail-wrap">
					<header class="fm-header">
						<div class="d-flex align-items-center flex-grow-1">
							<h1 class="fmapp-title">기안하기</h1>
						</div>
						<div class="fm-options-wrap">	
							<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
								<span class="icon">
									<span class="feather-icon"><i data-feather="chevron-up"></i></span>
									<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
								</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable active"></div>
					</header>
					<div class="fm-body">
						<div data-simplebar class="nicescroll-bar">
							<div class="file-list-view">
								<!-- 탭 메뉴 -->
								<ul class="nav nav-tabs nav-line nav-icon nav-light">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="tab" href="#write_doc">
											<span class="nav-link-text">문서작성</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#approval_set">
											<span class="nav-link-text">결재선설정</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="tab" href="#attach_file">
											<span class="nav-link-text">파일첨부</span>
										</a>
									</li>
								</ul>
								<!-- 탭 내용 -->
								<div class="tab-content">
									<!-- 문서 작성 탭 -->
									<div class="tab-pane fade show active" id="write_doc">
										<div class="table-responsive col-sm-8">
											<table class="table">
												<tbody>
													<tr>
														<th scope="row">문서종류</th>
														<td>
															<div class="input-group mb-3">
																<select class="form-select" name="edocDotCode" id="edocType">
																	<option disabled="disabled" selected="selected">문서종류</option>
																	<c:forEach items="${dotcode }" var="t">
																		<option value="${t }">${DotCode.valueOf(t).code }</option>
																	</c:forEach>
																</select>
																<select class="form-select" id="edocFormat">
																	<option disabled="disabled" selected="selected">종류를 선택해주세요</option>
																</select>
															</div>
														</td>
														<th scope="row">작성자</th>
														<td>
															<c:out value="${emp.DEPTNAME }"/> <c:out value="${emp.JOBNAME }"/> <c:out value="${emp.EMPNAME }"/>
															<input type="hidden" name="edocCreater" value="${emp.EMPNO }" id="edocCreter">
														</td>
													</tr>
													<tr>
														<th scope="row">보존연한</th>
														<td>
															<select class="form-select" name="period" id="period">
																<optgroup label="보존연한">
																	<option value="1">1년</option>
																	<option value="3" selected="selected">3년</option>
																	<option value="5">5년</option>
																	<option value="10">10년</option>
																</optgroup>
															</select>
														</td>
														<th scope="row">보안등급</th>
														<td>
															<select class="form-select" name="edocDsgCode" id="edocDsgCode">
																<optgroup label="보안등급">
																	<c:forEach items="${dsgcode }" var="s">
																		<option value="${s}"
																			<c:if test="${s eq 'DSG003' }">selected</c:if>
																		>${DsgCode.valueOf(s).code }</option>
																	</c:forEach>
																</optgroup>
															</select>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="submitButton">기안하기</button>
										</div>
										<div class="edoc-detail-container">
											<div class="mb-3">
												<span class="form-label">제목 : </span>
												<input type="text" class="form-control" name="edocTitle" id="edocTitle"/>
											</div>
										</div>
										<span class="form-label">본문 : </span>
										<div class="editor">
											<div class="editor-toolbar-container">
											</div>
											<div class="editor-editable-container">
												<div class="editor-editable"  id="content">
												</div>
											</div>
										</div>
									</div>
									<!-- 결재선 설정 탭 -->
									<div class="tab-pane fade show active" id="approval_set">
										<div class="row">
											<div class="text-first mt-3">
												<input type="text" id="schDept" value="" class="mb-4">
						    					<button class="btn btn-primary btn-sm" onclick="dsearch()">부서검색</button>	
							    			</div>
							    			<p><b>조직도</b></p>
											<div class="col-xl-3" id="deptTree"> </div>
											
											<div class="col-xl-9">
												<label for="employee-list-container">소속사원</label>
												<div id="employee-list-containter">
													
												</div>
											</div>
										</div>
									</div>
									<!-- 파일 첨부 탭 -->
									<div class="tab-pane fade show active" id="attach_file">
										<div id="">
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
	const path = "${path}";
</script>
<!-- Bootstrap Core JS -->
<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FeatherIcons JS -->
<script src="${path}/resources/js/feather.min.js"></script>
<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>
<!-- Simplebar JS -->
<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
<!-- Init JS -->
<script src="${path}/resources/js/init.js"></script>
<script src="${path}/resources/js/chips-init.js"></script>
<!-- jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js" integrity="sha512-ekwRoEshEqHU64D4luhOv/WNmhml94P8X5LnZd9FNOiOfSKgkY12cDFz3ZC6Ws+7wjMPQ4bPf94d+zZ3cOjlig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 체크박스 JS -->
<script src="${path}/resources/js/checkbox.js"></script>

<!-- 조직도관리 JS -->
<script src="${path}/resources/js/deptTree.js"></script>

<!-- 구성원관리 조직도, List 출력 JS -->
<script>

$(document).ready(function(){
	getDeptList();
});
var nodeId;
function getDeptList(){
	
	$.ajax({
		type:'GET',
		url:'${path}/deptlist',
		dataType:'JSON',
		success: function(data){
			var deptlist = new Array();
			$.each(data, function(idx, item){
				deptlist[idx]={id:item.deptCode, parent:item.deptUpstair, text:item.deptName};
			});
			
			$('#deptTree').jstree({
				'plugins':['types','sort','search'],
				'core':{
					'data':deptlist,
					'check_callback': true
				},
				'types':{
					'default':{
						'icon':'fa-solid fa-book-open-reader'
					}
				}
			}).bind("select_node.jstree", function (e, data) {
				nodeId = data.node.id;
				loadDeptEmpList(nodeId)
			});
			
		},error:function(data){
			alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요");
		}
	})
}
//선택된 부서의 구성원 목록을 가져오는 ajax함수
function loadDeptEmpList(nodeId) {
	fetch('${path}/edoc/approvalList?deptCode='+nodeId)
	.then(response=>{
		if(response.status != 200) throw new Error(response.status)
		return response.json();
	})
	.then(data=>{
		const 
	})
  $.ajax({
      type: 'GET',
      url: '${path}/edoc/approvalList',
      data: { deptCode : nodeId },
      dataType: 'JSON',
      success: function(response) {
          // 테이블의 기존 내용을 비우기
          $('.deptTable tbody').empty();
          $('.deptName').empty();
          
          //서버에서 받아온 데이터 정렬
          response.sort(function(a, b) {
              // leader가 붙은 사람을 먼저 나열
              if (a.leader === 'Y' && b.leader !== 'Y') return -1;
              if (a.leader !== 'Y' && b.leader === 'Y') return 1;

              // leader가 동일하면 id로 오름차순 정렬
              if (a.id < b.id) return -1;
              if (a.id > b.id) return 1;

              return 0;
          });
          
          // 서버에서 받아온 데이터로 테이블 만들기
          $.each(response, function(idx, item){

              var name = item.name;
              if(item.leader==='Y'){
                  name += '&nbsp<img src="${path}/resources/img/dept-leader.png" width="50px", height="25px">';
              }
              var row = '<tr>' +
                  '<td><input type="checkbox" name="chkRow" id=""></td>' +
                  '<td>' + item.id + '</td>' +
                  '<td>' + name + '</td>' +
                  '<td>' + item.position + '</td>' +
                  '<td>' + item.job + '</td>' +
                  '<td style="display:none;">' + nodeId + '</td>' +
              '</tr>';
              $('.deptTable tbody').append(row);

          });
          if (response.length > 0) {
              var deptName = response[0].deptName + ' 구성원 목록'
              $('.deptName').append(deptName);
          }else{
          	$.ajax({
                  type: 'GET',
                  url: '${path}/searchDeptName',
                  data: { deptCode : nodeId },
                  dataType: 'text',
                  success: function(response) {
                  	
                  	var thisDeptName = response + ' 구성원 목록';
                      $('.deptName').append(thisDeptName);
                  }
          	});
          }
      },
      error: function() {
          alert("구성원 정보 로딩 실패. 관리자에게 문의하세요");
      }
  });
}
</script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	
<link type="text/css" rel="stylesheet" href="${path }/resources/css/edoc/edocwrite.css">

<script type="text/javascript" src="${path }/resources/ckeditor/build/ckeditor.js"></script>
<script type="module" src="${path }/resources/js/edoc/edoc-write.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>