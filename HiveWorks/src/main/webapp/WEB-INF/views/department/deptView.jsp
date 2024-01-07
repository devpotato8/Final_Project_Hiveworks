<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
</jsp:include>

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<style>
	.deptTable{
		text-align:center;
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
	    					<button class="btn btn-primary btn-sm" onclick="deptsearch()">검색</button>
							
	    				</div>

			<div id="jstree"></div>
		
						
						<div class="text-end mt-5">
							<button class="btn btn-primary btn-sm">부서 일괄 등록</button>
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
						<input type="text" id="schDept" value="" class="mb-4">
    					<button class="btn btn-primary btn-sm" onclick="dsearch()">검색</button>	
	    			</div>
	    			
	    			<p><b>조직도</b></p>
					<div class="col-xl-3" id="deptTree"> </div>
					
					<div class="col-xl-9">
						<h5 class="deptName"></h5>
						
						<table class="table table-hover deptTable">
							<thead>
								<tr>
									<th><input type="checkbox" name="" id="chkRowAll"></th>
									<th>사원ID</th>
									<th>사원명</th>
									<th>직위</th>
									<th>직무</th>
								</tr>
							</thead>
							<tbody>
								<!-- 조직도에서 선택된 node값에 따라서 사원 테이블을 여기에 표시 -->
							</tbody>
						</table>
						<div class="text-end mt-5">
							<button class="btn btn-primary btn-sm deptMove">부서이동</button>&nbsp
							<button class="btn btn-primary btn-sm deptLeaderOn">조직장 설정</button>&nbsp
							<button class="btn btn-primary btn-sm deptLeaderOff">조직장 해제</button>&nbsp
							<button class="btn btn-primary btn-sm deptOut">소속제외</button>
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

	<!-- /Page Body -->		
			</div>
		</div>
	</div>
</div>

<!-- 체크박스 JS -->
<script src="${path}/resources/js/checkbox.js"></script>

<script>
<!-- 구성원관리 list up, js code -->
$(document).ready(function(){
	getDeptList();
});

function dsearch() {
    $('#deptTree').jstree(true).search($("#schDept").val());
}

function getDeptList(){
	
	$.ajax({
		type:'GET',
		url:'/deptlist',
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
				var nodeId = data.node.id;
				// 선택한 노드의 id값을 서버에 보내, 해당 값을 가진 데이터를 가져오는 AJAX 요청
				$.ajax({
					type: 'GET',
					url: '/deptemplist',
					data: { deptCode : nodeId },
					dataType: 'JSON',
					success: function(response) {
						// 테이블의 기존 내용을 비우기
						$('.deptTable tbody').empty();
						$('.deptName').empty();
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
							'</tr>';
							$('.deptTable tbody').append(row);
							
						});
						if (response.length > 0) {
				            var deptName = response[0].deptName + ' 구성원 목록'
				            $('.deptName').append(deptName);
				        }
					},
					error: function() {
						alert("구성원 정보 로딩 실패. 관리자에게 문의하세요");
					}
				});
			});
			
		},error:function(data){
			alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요");
		}
	})
}
</script>

<!-- 부서이동 버튼 클릭시 -->
<script>
$('.btn.deptMove').off('click').on('click', function() {
    var selectedIds = [];
    var selectedNames = [];
    var isLeader = false;
	
    // 체크박스가 선택된 row의 id를 가져옴
    $('input[name="chkRow"]:checked').each(function() {
        var id = $(this).closest('tr').find('td:nth-child(2)').text();
        var name = $(this).closest('tr').find('td:nth-child(3)').text();
        var leader = $(this).closest('tr').find('img').length > 0; // leader 정보 확인
        if (leader) {
            isLeader = true;
            return false; // each 함수 종료
        }
        selectedIds.push(id);
        selectedNames.push(name);
    });

    // leader인 경우
    if (isLeader) {
        alert("조직장은 이동시킬 수 없습니다. 조직장 설정을 먼저 변경하세요.");
    }
    // 선택된 row가 없는 경우
    else if (selectedIds.length === 0) {
        alert("선택된 구성원이 없습니다.");
    } 
    // 그 외 경우, 모달창 띄우기
    else {
    	
    	$.ajax({
    		type:'GET',
    		url:'/deptlist',
    		dataType:'JSON',
    		success: function(response){
    			 // 가져온 부서 목록으로 select 요소의 option들 생성
    		    var options = response.map(function(dept) {
    		      return '<option value="' + dept.deptCode + '">' + dept.deptName + '</option>'; // deptCode와 deptName는 실제 필드명으로 변경해야 합니다.
    		    });

    		    // select 요소에 option들 추가
    		    $('#deptSelect').html(options.join(''));
    		  },
    		  error: function(err) {
    		    console.error(err);
    		  }
   		});
    	
    	
    	// 현재 소속 부서 이름 가져오기
        var deptName = $('.deptName').text(); // h5 태그의 텍스트 가져오기
        var currentDept = deptName.replace(" 구성원 목록", ""); // " 구성원 목록" 문자열 제거
     	
        // 모달창에 현재 소속 부서 표시
        $('#changeDept .modal-header .modal-title').text('선택된 구성원 ▶' + selectedNames.join(', '));
        $('.deptNow').text('현재 부서 ▶ '+ currentDept);
		
        // 모달창 표시
        $('#changeDept').modal('show');
    }
});

//변경사항 저장 버튼 클릭 이벤트
$('#changeDept').on('shown.bs.modal', function () {
	$('.deptChangeSaveBtn').off('click').on('click', function() {
	    var deptCode = $('#deptSelect').val(); // 선택된 부서 코드
	    var selectedIds = []; // 선택된 구성원 id 배열
	
	    // 체크박스가 선택된 row의 id를 가져옴
	    $('input[name="chkRow"]:checked').each(function() {
	        var id = $(this).closest('tr').find('td:nth-child(2)').text();
	        selectedIds.push(id);
	    });
	
	    // 서버로 전송
	    $.ajax({
	        type: 'POST',
	        url: '/changeEmpDept', // 실제 처리를 담당할 서버 주소로 변경해야 합니다.
	        data: {
	            deptCode: deptCode,
	            empId: selectedIds
	        },
	        success: function(response){
	            alert('부서 이동이 성공적으로 처리되었습니다.');
	            // 필요에 따라 추가 처리를 여기에 작성하실 수 있습니다.
	        },
	        error: function(err) {
	            console.error(err);
	        }
	    });
	});
});
</script>

<!-- 조직도 관리 JS -->
<script src="${path}/resources/js/deptTree.js"></script>


	