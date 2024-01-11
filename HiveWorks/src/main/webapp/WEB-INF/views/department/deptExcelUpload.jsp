<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
</jsp:include>

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

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
	<div class="hk-pg-header pt-7">
		<div class="d-flex">
			<div class="flex-1">
				<h2 class="pg-title">부서 일괄등록</h2>
				<br>
				<p class="p-lg col-lg-8">Excel파일을 업로드해 부서들을 일괄등록 할 수 있습니다</p>
				<p class="p-m col-lg-8 mt-3">등록양식을 다운로드 받아, 부서를 일괄 등록 해보세요 ▶ <b><a href="/sampleDownlaod">등록양식 sample 다운로드</a></b></p>
			</div>
		</div>
	</div>
	<!-- /Page Header -->

	<!-- Page Body -->
	<div class="hk-pg-body">
		<div class="tab-content">
			<!-- 조직도관리 -->
			<div class="tab-pane fade show active" id="tab_block_1">
				<div class="row">
					<div class="col-xl-8">
						
						<h5><b>부서등록 파일 작성방법</b></h5>
						<br>
						<p class="mt-2">1. 부서명은 (공백이 없는 경우) 한글 50자, 영문 100자까지 입력할 수 있습니다.</p>
						<p class="mt-2">2. 5레벨까지 부서를 생성할 수 있으며, 1레벨(대표실 혹은 회사명) 정보는 입력하지 않습니다.</p>
						<p class="mt-2">3. 기존 부서명과 중복되는 경우, 해당 행은 등록되지 않습니다.</p>
						<p class="mt-2">4. 기존 부서명은 그대로 보존되며, 중복되지 않은 조직정보만 업데이트됩니다.</p>
						<p class="mt-2">5. 상위 부서가 있는 경우, 상위 부서 정보도 모두 입력해야 합니다.</p>
						<p class="mt-2">6. 부서명에 특수기호 | 는 사용할 수 없습니다.</p>
						<p class="mt-2">7. 양식 샘플파일을 다운받아 내용을 입력하시고 업로드 하세요.</p>
						<p class="mb-5"></p>
					</div>
					<br>
					<form method="POST" action="/deptExcelUpload" enctype="multipart/form-data">
						<div class="col-md-5">
							<div class="input-group">
								<input 
									type="file" 
									class="form-control" 
									id="excleUpload" 
									name="file"
									aria-describedby="excleUploadBtn" aria-label="Upload" 
									accept=".csv, 
										application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, 
										application/vnd.ms-excel">
								<button class="btn btn-primary" type="submit" id="excleUploadBtn">업로드</button>
							</div>
						</div>
					</form>
				</div>	
			
			</div>
	
	
	<!-- /Page Body -->		
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	 $('form').on('submit', function(event) {
        if ($('#excleUpload').get(0).files.length === 0) {
            alert('파일이 선택되지 않았습니다 \n파일 선택 후 다시 시도하세요');
            event.preventDefault();
        }
	})
})

var message = "${message}";

if(message!=null && message!=''){
	alert(message);
};
</script>
