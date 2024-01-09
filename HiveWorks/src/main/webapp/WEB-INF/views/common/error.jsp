<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${errorCode >= 400 && errorCode <= 429}">

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<div id="hk_menu_backdrop" class="hk-menu-backdrop"></div>
<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<div class="container-xxl">
				<!-- Page Body -->
				<div class="hk-pg-body">
					<div class="row">
						<div class="col-xl-7 col-lg-6 d-lg-block d-none">
							<div class="auth-content py-md-0 py-8">
								<div class="row">
									<div class="col-xl-12 text-center">
									<br><br>
										
										<img src="${path}/resources/img/macaroni-fatal-error.png"  class="img-fluid w-sm-80 w-50" alt="errorpage"/>
										
										<p class="p-xs mt-5 text-light">Illustrations powered by <a href="https://icons8.com/ouch/" target="_blank" class="text-light"><u>Icons8</u></a></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-5 col-lg-6 col-md-7 col-sm-10">
							<div class="auth-content py-md-0 py-8">
								<div class="w-100">
									<div class="row">
										<div class="col-xxl-9 col-xl-8 col-lg-11">
											<Br><br><br>
											<h1 class="display-4 fw-bold mb-2">Error!</h1>
											<br>
											<p class="p-sm"><c:out value="${errorCode}"/>, <c:out value="${errorMsg}"/></p>
											<Br>	
											<c:if test="${errorCode == 400}">
											<p class="p-lg"><b>잘못된 요청이에요</b></p>
											</c:if>
											<c:if test="${errorCode == 403}">
											<p class="p-lg"><b>접근권한이 없습니다</b></p>
											</c:if>
											<c:if test="${errorCode == 404}">
											<p class="p-lg"><b>존재하지 않는 페이지에요</b></p>
											</c:if>
											<c:if test="${errorCode == 429}">
											<p class="p-lg"><b>너무 많은 요청을 보내고 있어요</b></p>
											</c:if>
											<Br>
											<p class="p-sm">계속되면 관리자에게 문의해주세요</p>
																					
											<a href="${path}/" class="btn btn-primary mt-4">메인페이지로</a>
											<Br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Page Body -->		
			</div>
		</div>
</c:if>

<!---------------- 이하 500번대 에러 ------------------->

<c:if test="${errorCode >= 500 && errorCode <= 503}">

	<!-- Favicon -->
    <link rel="shortcut icon" href="${path}/resources/img/logo-bage.png">
    <link rel="icon" href="${path}/resources/img/logo-bage.png" type="image/x-icon">
	
	<!-- Daterangepicker CSS -->
    <link href="${path}/resources/vendors/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />

	<!-- Data Table CSS -->
    <link href="${path}/resources/vendors/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/vendors/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />

	<!-- CSS -->
    <link href="${path}/resources/css/style.css" rel="stylesheet" type="text/css">
	
	<!-- jQuery -->
    <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>
	
	
	
   	<!-- Wrapper -->
	<div class="hk-wrapper hk-pg-auth" data-footer="simple">
		<!-- Top Navbar -->
		<nav class="hk-navbar navbar navbar-expand-xl navbar-light fixed-top">
			<div class="container-xxl">
				<!-- Start Nav -->
				<div class="nav-start-wrap">
					<a class="navbar-brand" href="${path}/">
						<img class="brand-img img-fluid" src="${path}/resources/img/logo_bee.png" alt="brand" width="30px" height="35px"/>
						<img class="brand-img img-fluid" src="${path}/resources/img/logo-title.png" alt="brand" width="150px" height="35px"/>
					</a>
				</div>
				<!-- /Start Nav -->

				<!-- End Nav -->
				<div class="nav-end-wrap">
					<ul class="navbar-nav flex-row">
						<li class="nav-item nav-link py-0">
						<button class="btn btn-sm btn-outline-light"><span><span class="icon"><span class="feather-icon"><i data-feather="help-circle"></i></span></span><span>Get Help</span></span></button>
						</li>
					</ul>	
				</div>
				<!-- /End Nav -->
			</div>
		
		</nav>
		<!-- /Top Navbar -->

		<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<!-- Page Body -->
			<div class="hk-pg-body">
				<!-- Container -->
				<div class="container-xxl">
					<!-- Row -->
					<div class="row">
						<div class="col-xl-7 col-lg-6 d-lg-block d-none">
							<div class="auth-content py-md-0 py-8">
								<div class="row">
									<div class="col-xl-12 text-center">
										<img src="${path}/resources/img/macaroni-delete-confirmaton.png"  class="img-fluid w-sm-70 w-50" alt="login"/>
										<p class="p-xs mt-5 text-light">Illustrations powered by <a href="https://icons8.com/ouch/" target="_blank" class="text-light"><u>Icons8</u></a></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-5 col-lg-6 col-md-7 col-sm-10">
							<div class="auth-content py-md-0 py-8">
								<div class="w-100">
									<div class="row">
										<div class="col-xxl-9 col-xl-8 col-lg-11">
											<h1 class="display-4 fw-bold mb-2">Error!</h1>
											<p><c:out value="${errorCode}"/>, <c:out value="${errorMsg}"/></p>
											<c:if test="${errorCode == 500}">
												<p class="p-lg"><b>서버에 오류가 있어요ㅠ</b></p>
											</c:if>
											<c:if test="${errorCode == 503}">
												<p class="p-lg"><b>일시적으로 요청을 처리할 수 없어요</b></p>
											</c:if>
											<Br>
											<p class="p-sm">계속되면 관리자에게 문의해주세요</p>
																					
											<a href="${path}/" class="btn btn-primary mt-4">메인페이지로</a>
											<Br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Row -->
				</div>
				<!-- /Container -->
			</div>
			<!-- /Page Body -->
</c:if>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
