<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- Meta Tags -->
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | HiveWorks</title>
    
	<!-- Favicon -->
    <link rel="shortcut icon" href="${path}/resources/img/logo-bage.png">
    <link rel="icon" href="${path}/resources/img/logo-bage.png" type="image/x-icon">
	
	<!-- CSS -->
    <link href="${path}/resources/css/style.css" rel="stylesheet" type="text/css">

	<!-- Font적용 -->    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">	

	<style>
		h2,h4{
			font-family: 'Do Hyeon', sans-serif;
		}
		label{
			font-family: 'Do Hyeon', sans-serif;
			font-size: 1.2rem;
		}
	</style>

	
</head>
<body>
   	  	<!-- Wrapper -->
	<div class="hk-wrapper hk-pg-auth" data-footer="simple">
		<!-- Main Content -->
		<div class="hk-pg-wrapper py-0">
			<div class="hk-pg-body py-0">
				<!-- Container -->
				<div class="container-fluid">
					<!-- Row -->
					<div class="row auth-split">
						<div class="col-xl-5 col-lg-6 col-md-7 position-relative mx-auto">
							<div class="auth-content flex-column pt-8 pb-md-8 pb-13">
								<div class="text-center mb-7">
									
										<img class="brand-img d-inline-block" src="${path}/resources/img/hiveworks.png" width="350px" height="75px" alt="brand">
									
								</div>
								<form class="w-100" action="${path}/loginend" method="post">
									<div class="row">
										<div class="col-xl-7 col-sm-10 mx-auto">
											<div class="text-center mb-4">
												<h4>로그인 해주세요!</h4>
												<p></p>
											</div>
											<div class="row gx-3">
												<div class="form-group col-lg-12">
													<div class="form-label-group">
														<label>User ID</label>
													</div>
													<input class="form-control" placeholder="Enter your userID" value="" type="text" name="emp_Id">
												</div>
												<div class="form-group col-lg-12">
													<div class="form-label-group">
														<label>Password</label>
														<!-- <a href="#" class="fs-8 fw-medium">비밀번호를 잊으셨나요?</a> -->
													</div>
													<div class="input-group password-check">
														<span class="input-affix-wrapper affix-wth-text">
															<input class="form-control" placeholder="Enter your password" value="" type="password" name="emp_Pw">
															<a href="#" class="input-suffix text-primary text-uppercase fs-8 fw-medium">
																<span>
																	<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye">
																		<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
																		<circle cx="12" cy="12" r="3"></circle>
																	</svg>
																</span>
																<span class="d-none">
																	<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye-off">
																		<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
																		<line x1="1" y1="1" x2="23" y2="23"></line>
																	</svg>
																</span>
															</a>
														</span>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-center">
												<div class="form-check form-check-sm mb-3">
													<input type="checkbox" class="form-check-input" id="logged_in" name="remember-me" checked>
													<label class="form-check-label text-muted fs-7" for="logged_in">로그인 상태 유지</label>
												</div>
											</div>
											<button class="btn btn-primary btn-uppercase btn-block">Login</button>
											<!-- <p class="p-xs mt-2 text-center">New to Jampack? <a href="#"><u>Create new account</u></a></p>
											<a href="#" class="d-block extr-link text-center mt-4"><span class="feather-icon"><i data-feather="external-link"></i></span><u class="text-muted">Send feedback to our help forum</u></a> -->
											<hr>
											<p class="p-xs mt-2 text-center"> 신규가입/비밀번호 문의는 인사관리자에게 문의해주세요 </p>
										</div>
									</div>
								</form>
							</div>
							<!-- Page Footer -->
							<div class="hk-footer border-0">
								<footer class="container-xxl footer">
									<div class="row">
										<div class="col-xl-8 text-center">
											<p class="footer-text pb-0">
												<span class="copy-text">DNA HiveWorks © 2023 All rights reserved.</span> 
												<a href="#" class="" target="_blank">Privacy Policy</a>
												<span class="footer-link-sep"> | </span>
												<a href="#" class="" target="_blank">T&C</a>
												<span class="footer-link-sep"> | </span>
												<a href="#" class="" target="_blank">System Status</a>
											</p>
										</div>
									</div>
								</footer>
							</div>
							<!-- / Page Footer -->
						</div>
						<div class="col-xl-7 col-lg-6 col-md-5 col-sm-10 d-md-block d-none position-relative bg-primary-light-5">
							<div class="auth-content flex-column text-center py-8">
								<div class="row">
									<div class="col-xxl-12 col-xl-10 col-lg-11 mx-auto">
										<h2 class="mb-5">HiveWorks ERP System</h2>
										
										<p>지금 HiveWorks에서 업무능력을 최대로 발휘해 보세요!</p>
										<!-- <button class="btn  btn-flush-primary btn-uppercase mt-2">Take Tour</button> -->
									</div>
								</div>
								<img src="${path}/resources/img/macaroni-logged-out.png"  class="img-fluid w-sm-50 mt-7" alt="login"/>
							</div>
							<!-- <p class="p-xs credit-text opacity-55">All illustration are powered by <a href="https://icons8.com/ouch/" target="_blank" class="text-light"><u>Icons8</u></a></p> -->
						</div>
					</div>
					<!-- /Row -->
				</div>
				<!-- /Container -->
			</div>
			<!-- /Page Body -->
		</div>
		<!-- /Main Content -->
	</div>
    <!-- /Wrapper -->

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
	
	<input type="password" id="password" oninput="addStars()" style="letter-spacing: 10px;">

</body>

</html>