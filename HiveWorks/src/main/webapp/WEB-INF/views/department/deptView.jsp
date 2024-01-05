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
	#deptTree{
		/* box-shadow:2px 3px 5px 0px; */
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
				<h1 class="pg-title">조직 관리</h1>
				<br>
				<p class="p-lg col-lg-8">조직도로 부서관리를 하거나, 구성원들을 관리할 수 있습니다</p>
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
						<p class="mt-3">조직도에서 부서를 클릭하면 소속되어있는 구성원을 관리할 수 있습니다.</p>
						<br><br><br>
					
					<div class="text-first mt-3">
						<input type="text" id="schDept" value="" class="mb-4">
    					<button class="btn btn-primary btn-sm" onclick="dsearch()">검색</button>	
	    			</div>
	    			
	    			<p><b>조직도</b></p>
					<div class="col-xl-3" id="deptTree"> </div>
					
					<div class="col-xl-7">
						
						<table class="table table-hover">
							<thead>
								<tr>
									<th><input type="checkbox" id="chkRowAll"></th>
									<th>사원명</th>
									<th>직위</th>
									<th>ID</th>
									<th>설정</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" id="chkRow"></td>
									<td>김멍청</td>
									<td>바보</td>
									<td>babo</td>
									<td>
										<button class="btn btn-primary btn-sm">부서이동</button>&nbsp
										<button class="btn btn-primary btn-sm">부서장</button>&nbsp
										<button class="btn btn-primary btn-sm">소속제외</button>
									</td>
								</tr>
							</tbody>
						
						</table>
						
					</div>
				</div>
			</div>
	<!-- /Page Body -->		
			</div>
		</div>
	</div>
</div>

<!-- 구성원관리 js code -->
<script>
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
				//id, parent, text는 jstree에서 지정된 키값으로 그대로 쓴다.
				deptlist[idx]={id:item.deptCode, parent:item.deptUpstair, text:item.deptName};
			});
			
			$('#deptTree').jstree({
				//js트리에서 사용할 plugin들 넣어주기
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
			})
			
		},error:function(data){
			alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요");
		}
	})
}

$(document).ready(function(){
	getDeptList();
});
</script>

<!-- 조직도관리 JS -->
<script src="${path}/resources/js/deptTree.js"></script>


	