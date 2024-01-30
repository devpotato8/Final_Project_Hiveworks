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
<style>
	.deptTable{
		text-align:center;
	}
	.title-container{
		display:flex; 
		align-items:center;
		justify-content: space-between;
	}
	#searchWrapper {
	    position: relative; /* 부모 요소 위치 설정 */
	}
	.autocomplete-dropdown {
		background-color: lightgray;
	    position: absolute; /* 절대 위치 설정 */
	    top: 100%; /* 부모 요소의 맨 아래에 위치 */
	    left: 0; /* 부모 요소의 왼쪽 경계에 위치 */
	    z-index: 100; /* 다른 요소 위에 위치 */
	}
	.autocomplete-dropdown li:hover {
    	background-color: #f2f2f2;
    	cursor: pointer;
    	width:auto;
    	max-width:200px;
	}
	.autocomplete-dropdown-item.selected {
	    background-color: #f2f2f2;
	}
	
	
</style>

	<!-- jQuery -->
    <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />


<!-- Main Content -->
<div class="hk-pg-wrapper" style="margin-left:300px;">
	<div class="container-xxl">
		
	<!-- Page Header -->
	<div class="hk-pg-header pg-header-wth-tab pt-7">
		<div class="d-flex">
			<div class="flex-1">
				<h1 class="pg-title">부서 관리</h1>
				<br>
				<p class="p-lg col-lg-8">조직도로 부서들을 관리하거나, 구성원들을 관리할 수 있습니다</p>
			</div>
		</div>
		<ul class="nav nav-line nav-light nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-bs-toggle="tab" href="#tab_block_1">
					<span class="nav-link-text">조직도 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-bs-toggle="tab" href="#tab_block_2">
					<span class="nav-link-text">구성원 관리</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- /Page Header -->

	<!-- Page Body -->
	<div class="hk-pg-body">
		<div class="tab-content">
			<!-- 조직도관리 -->
			<div class="tab-pane fade show active" id="tab_block_1">
				<div class="row">
					<div class="col-xl-8">
						
						<h4><b>조직도</b></h4>
						<p class="mt-3">조직도를 통해 부서를 쉽게 관리할 수 있습니다</p>
						<p class="mt-3">드래그&드롭으로 부서를 이동시키거나, 우클릭메뉴를 이용해 부서 생성, 수정, 삭제도 가능합니다</p>
						<p>*부서 추가,수정,삭제 등 변경사항은 즉시 적용됩니다. 작성에 주의하세요</p>
						<div class="text-first mt-3">
							<input type="text" id="schName" value="" class="mb-4">
	    					<button class="btn btn-primary btn-sm" onclick="deptsearch()">부서검색</button>
							
	    				</div>

			<div id="jstree"></div>
		
						
						<div class="text-end mt-5">
							<button class="btn btn-primary btn-sm insertDeptList">부서 일괄 등록</button>
						</div>
						
					
					</div>
				</div>	
			
			</div>
			<!-- /조직도 관리 -->
			
			<!-- 구성원 관리 -->
			<div class="tab-pane fade" id="tab_block_2">
				<div class="row">
						<h4><b>구성원 관리</b></h4>
						<p class="mt-3">조직도에서 부서명을 클릭하면, 해당 부서의 구성원을 관리할 수 있습니다.</p>
						<br><br><br>
					
					<div class="text-first mt-3">
						<input type="text" id="schDept" value="" class="mb-4" autocomplete='off'>
    					<button class="btn btn-primary btn-sm" onclick="dsearch()">부서검색</button>	
	    			</div>
	    			
	    			<p><b>조직도</b></p>
					<div class="col-xl-3" id="deptTree"> </div>
					
					<div class="col-xl-9">
						<div class="mb-3 title-container">	
							<div>
								<h5 class="deptName"></h5>
							</div>							
							<!-- 직원 검색창 -->
							<div>	
							    <div id="searchWrapper" class="mb-2">
							        <input type="text" id="searchEmp" autocomplete='off'>
								    <button class="btn btn-primary btn-sm addEmpDeptBtn">소속추가</button>
							    </div>
								<span>직원을 검색해서 부서에 추가할 수 있습니다</span>
							</div>		
						</div>
						<table class="table table-hover deptTable">
							<thead>
								<tr>
									<th><input type="checkbox" name="" id="chkRowAll"></th>
									<th>사원ID</th>
									<th>사원명</th>
									<th>직위</th>
									<th>직무</th>
									<th id="currentDeptCode" style="display:none;"></th>
								</tr>
							</thead>
							<tbody>
								<!-- 조직도에서 선택된 node값에 따라서 사원 테이블을 여기에 표시 -->
							</tbody>
						</table>
						<div class="text-end mt-5">
							<button class="btn btn-primary btn-sm deptMove">부서이동</button>&nbsp
							<button class="btn btn-primary btn-sm setLeaderBtn">조직장 설정</button>&nbsp
							<button class="btn btn-primary btn-sm removeLeaderBtn">조직장 해제</button>&nbsp
							<button class="btn btn-primary btn-sm deptOutBtn">소속제외</button>
							<br>
						</div>
						<br>
						<br>
						<div class="mt-7">
						<table>		
							<tr><td>부서이동 :</td><td>구성원을 다른 부서로 이동시킵니다</td></tr>
							<tr><td>조직장 설정 :</td><td>구성원을 조직장으로 설정합니다, 이 경우 현재 설정되어 있는 조직장이 자동으로 해제됩니다.</td></tr>
							<tr><td>조직장 해제 :</td><td>조직장인 구성원을 해제합니다</td></tr>
							<tr><td>소속 제외 :</td><td> 구성원을 부서에서 제외하고 무소속 상태로 변경합니다</td></tr>
						</table>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 부서이동 Modal -->
			<div class="modal fade" id="changeDept" tabindex="-1" aria-labelledby="changeDeptLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="changeDeptLabel">이동시킬 부서를 선택해주세요</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form class="form-inline">
				      <div class="modal-body">
				      	<p class="deptNow"></p>
				      		<label for="deptSelect">이동시킬 부서 ▶</label>
				      		<select id="deptSelect">
				      			<option selected>부서 선택</option>
				      		</select>
				      		<span>으로 이동시킵니다.</span>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary deptChangeSaveBtn">변경사항 저장</button>
				      </div>
			      </form>
			    </div>
			  </div>
			</div>
			
			<!-- 조직장 설정 Modal -->
			<div class="modal fade" id="leaderOn" tabindex="-1" aria-labelledby="leaderonLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="leaderonLabel">조직장 설정</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form class="form-inline">
			      <div class="modal-body"></div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary deptLeaderOn">확인</button>
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			
			<!-- 조직장 해제 Modal -->
			<div class="modal fade" id="leaderOff" tabindex="-1" aria-labelledby="leaderoffLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="leaderoffLabel">조직장 해제</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form class="form-inline">
			      <div class="modal-body"></div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary deptLeaderOff">확인</button>
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			
			<!-- 소속 제외 Modal -->
			<div class="modal fade" id="deptOut" tabindex="-1" aria-labelledby="deptOutLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="deptOutLabel">소속 제외</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form class="form-inline">
			      <div class="modal-body"></div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary confirmBtn">확인</button>
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			
	<!-- /Page Body -->		
			</div>
		</div>
	</div>
</div>

<!-- 체크박스 JS -->
<script src="${path}/resources/js/checkbox.js"></script>

<!-- 조직도관리 JS -->
<script src="${path}/resources/js/deptTree.js"></script>

<!-- 구성원관리 조직도, 구성원 List 출력 JS -->
<script>
const path = '${path}';

$('.nav-link').on('click', function() {
	getDeptList();
});

function dsearch() {
    $('#deptTree').jstree(true).search($("#schDept").val());
}
var nodeId;
function getDeptList(){
	
	$.ajax({
		type:'GET',
		url: path+'/deptlist',
		dataType:'JSON',
		success: function(data){
			var deptlist = new Array();
			$.each(data, function(idx, item){
				deptlist[idx]={id:item.deptCode, parent:item.deptUpstair, text:item.deptName};
			});
			
			// 기존 jstree 인스턴스 삭제
            $('#deptTree').jstree('destroy');
			
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
    $.ajax({
        type: 'GET',
        url: path+'/deptemplist',
        data: { deptCode : nodeId },
        dataType: 'JSON',
        success: function(response) {
            // 테이블의 기존 내용을 비우기
            $('.deptTable tbody').empty();
            $('.deptName').empty();
            $('#currentDeptCode').empty();
           
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
                $('#currentDeptCode').append(nodeId);
            }else{
            	$.ajax({
                    type: 'GET',
                    url: path+'/searchDeptName',
                    data: { deptCode : nodeId },
                    dataType: 'text',
                    success: function(response) {
                    	
                    	var thisDeptName = response + ' 구성원 목록';
                        $('.deptName').append(thisDeptName);
                        $('#currentDeptCode').append(nodeId);
                    }
            	});
            }
        },
        error: function() {
            alert("구성원 정보 로딩 실패. 관리자에게 문의하세요");
        }
    });
}

//부서일괄업로드 btn
$(document).ready(function(){
	$('.insertDeptList').on('click',function(){
        window.location = path+"/insertDeptList";
    });
});

//부서일괄업로드가 성공하면 조직도가 뜨면서 성공했다는 alert뜨도록
var message = "${message}";

if(message!=null && message!=''){
	alert(message);
};

</script>

<!-- 구성원관리 버튼이벤트, 검색창이벤트 JS -->
<script src="${path}/resources/js/deptTreeEmpBtns.js"></script>




	