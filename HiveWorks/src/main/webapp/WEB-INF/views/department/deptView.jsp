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
							<button class="btn btn-primary btn-sm deptMove" >부서이동</button>&nbsp
							<button class="btn btn-primary btn-sm deptLeaderOn">조직장 설정</button>&nbsp
							<button class="btn btn-primary btn-sm deptLeaderOff">조직장 해제</button>&nbsp
							<button class="btn btn-primary btn-sm deptOut">소속제외</button>
						</div>
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

<!-- 버튼 이벤트 JS -->

$(document).ready(function() {
    // 페이지 로딩 시 버튼들 숨기기
    $('.deptMove, .deptLeaderOn, .deptLeaderOff, .deptOut').hide();

    // 체크박스가 변화했을 때 동작
    $(document).on('change', 'input[type="checkbox"]', function(){
        // 체크된 체크박스가 하나 이상 있다면 버튼을 보여주고, 그렇지 않다면 버튼을 숨김.
        if($('input[type="checkbox"]:checked').length > 0){
            $('.deptMove, .deptOut').show();

            // 체크된 체크박스 중 하나라도 'isdeptLeaderOn' 클래스를 가진 행이 있다면 '조직장 해제' 버튼을 보여주고 '조직장 설정' 버튼을 숨김
            if($('input[type="checkbox"]:checked').closest('tr').hasClass('isdeptLeaderOn')){
                $('.deptLeaderOn').hide();
                $('.deptLeaderOff').show();
            } else {
                // 체크된 체크박스 중 'isdeptLeaderOn' 클래스를 가진 행이 없으면 '조직장 설정' 버튼을 보여주고 '조직장 해제' 버튼을 숨김
                $('.deptLeaderOn').show();
                $('.deptLeaderOff').hide();
            }
        } else {
            $('.deptMove, .deptLeaderOn, .deptLeaderOff, .deptOut').hide();
        }
    });
});

// 조직장 설정 버튼 클릭 시
$('.deptLeaderOn').on('click', function(){
    var checkedRows = $('input[type="checkbox"]:checked');
    if(checkedRows.length > 1){
        alert("조직장은 1명만 가능합니다.");
        checkedRows.prop('checked', false); // 모든 체크박스의 체크를 해제
        $('.deptMove, .deptLeaderOn, .deptLeaderOff, .deptOut').hide(); // 모든 버튼을 숨김
    } else {
        checkedRows.each(function(){
            var row = $(this).closest('tr');
            var id = row.children().eq(1).text(); // 행에서 2번째 값을 가져온다.
            
            // 기존에 조직장이 설정된 행이 있으면, 그 행의 조직장 설정을 해제.
            var oldMasterRow = $('tr.isdeptLeaderOn');
            var oldMasterId = '';
            if(oldMasterRow.length > 0){
                oldMasterId = oldMasterRow.children().eq(1).text();
            }

            $.ajax({
                type: 'POST',
                url: '/deptLeaderOn',
                data: { 
                	id: id,
                	oldMasterId: oldMasterId		
                },
                success: function(response) {
                    if(response.success) {
                        // 응답을 받은 후에 화면을 업데이트
                        if(oldMasterRow.length > 0){
                            oldMasterRow.removeClass('isdeptLeaderOn');
                            oldMasterRow.children().eq(2).text(oldMasterRow.children().eq(2).text().replace(' [조직장]', ''));
                        }
                        var nameCell = row.children().eq(2); 
                        nameCell.append(' [조직장]');
                        row.addClass('isdeptLeaderOn'); // 새로 조직장이 된 행에 표시를 추가
                        alert("조직장 설정이 완료되었습니다.");
                    } else {
                        alert("조직장 설정에 실패했습니다. 관리자에게 문의하세요");
                    }
                }
            });
        });
    }
});

//조직장 해제버튼 클릭 시
$('.deptLeaderOff').on('click', function(){
    
    $('input[type="checkbox"]:checked').each(function(){
        var row = $(this).closest('tr');
        var id = row.children().eq(1).text(); 

        // id가 'emp001'인 경우 경고창을 띄우고 체크박스를 해제합니다.
        if(id === 'emp001'){
            alert('최고 레벨 조직장 설정은 변경할 수 없습니다');
            $('input[type="checkbox"]').prop('checked', false);
            return false; 
        }

        $.ajax({
            type: 'POST',
            url: '/deptLeaderOff',
            data: { id: id },
            success: function(response) {
                if(response.success) {
                    var nameCell = row.children().eq(2);
                    nameCell.text(nameCell.text().replace(' [조직장]', ''));
                    alert("조직장 설정이 해제되었습니다.");
                } else {
                    alert("조직장 해제에 실패했습니다. 관리자에게 문의하세요");
                }
            }
        });
    });
});

</script>


<!-- 조직도 관리 JS -->
<script src="${path}/resources/js/deptTree.js"></script>


	