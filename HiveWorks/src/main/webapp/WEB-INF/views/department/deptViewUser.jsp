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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />


<!-- Main Content -->
<div class="hk-pg-wrapper" style="margin-left:300px;">
	<div class="container-xxl">
		


	<!-- Page Body -->
	<div class="hk-pg-body">
		<div class="tab-content">
		
			
			<!-- 구성원 관리 -->
			<div class="tab-pane fade show active" id="tab_block_1">
				<div class="row">
						<h4><b>조직도 검색</b></h4>
						<p class="mt-3">조직도에서 부서명을 클릭하면, 해당 부서의 구성원을 확인할 수 있습니다.</p>
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
							
						</div>
						<table class="table table-hover deptTable">
							<thead>
								<tr>
									<th>사원ID</th>
									<th>사원명</th>
									<th>직위</th>
									<th>직무</th>
									<th id="currentDeptCode" style="display:none;">현재부서</th>
								</tr>
							</thead>
							<tbody>
								<!-- 조직도에서 선택된 node값에 따라서 사원 테이블을 여기에 표시 -->
							</tbody>
						</table>
						
						<br>
						<br>
						
					</div>
				</div>
			</div>
			
	<!-- /Page Body -->		
			</div>
		</div>
	</div>
</div>


<!-- 구성원관리 조직도, 구성원 List 출력 JS -->
<script>
const path = '${path}';

$(document).ready(function() {
	getDeptList();
});

function dsearch() {
    $('#deptTree').jstree(true).search($("#schDept").val());
}
var nodeId;
$.jstree.defaults.core.themes.variant = "large";
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





	