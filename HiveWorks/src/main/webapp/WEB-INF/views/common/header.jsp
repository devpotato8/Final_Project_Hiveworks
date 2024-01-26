<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HiveWorks ERP</title>


<!-- Favicon -->
<link rel="shortcut icon" href="${path}/resources/img/logo-bage.png">
<link rel="icon" href="${path}/resources/img/logo-bage.png"
	type="image/x-icon">

<!-- Daterangepicker CSS -->
<link
	href="${path}/resources/vendors/daterangepicker/daterangepicker.css"
	rel="stylesheet" type="text/css" />

<!-- Data Table CSS -->
<link
	href="${path}/resources/vendors/datatables.net-bs5/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${path}/resources/vendors/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css"
	rel="stylesheet" type="text/css" />

<!-- CSS -->
<link href="${path}/resources/css/style.css" rel="stylesheet"
	type="text/css">

<!-- jQuery -->
<script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

<style>
#msgStack{
	width: 280px;
	right: 10px;
	bottom: 10px;
	position: fixed;
	z-index: 9999;
}

.toast{
	cursor: pointer;
}
</style>

</head>

<body>
	<!-- Wrapper 상단 검색바 포함 header라인-->
	<div class="hk-wrapper" data-layout="vertical"
		data-layout-style="${param.style}" data-menu="light"
		data-footer="simple" ${param.hover}>
		
		
		
		
		<!-- Top Navbar -->
		<nav class="hk-navbar navbar navbar-expand-xl navbar-light fixed-top">
			<div class="container-fluid">
				<!-- Start Nav -->
				<div class="nav-start-wrap">
					<button
						class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover navbar-toggle d-xl-none">
						<span class="icon"><span class="feather-icon"><i
								data-feather="align-left"></i></span></span>
					</button>

					<!-- Search -->

					 <form class="dropdown navbar-search">
						<div class="dropdown-toggle no-caret" data-bs-toggle="dropdown"
							data-dropdown-animation data-bs-auto-close="outside">
							<a href="#"
								class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover  d-xl-none"><span
								class="icon"><span class="feather-icon"><i
										data-feather="search"></i></span></span></a>
							<div class="input-group d-xl-flex d-none">
								<span class="input-affix-wrapper input-search affix-border">
									<input id="searchInput" type="text"
									class="form-control  bg-transparent"
									data-navbar-search-close="false" placeholder="통합검색: 검색어를 입력하세요"
									aria-label="Search"> <span class="input-suffix"><span><img
											src="${path}/resources/img/search.svg"></span> <span
										class="btn-input-clear"><i class="bi bi-x-circle-fill"></i></span>
										<span
										class="spinner-border spinner-border-sm input-loader"
										role="status"> <span class="sr-only">Loading...</span>
									</span> </span>
								</span>
							</div>
						</div>
						<div class="dropdown-menu p-0">
							<div class="dropdown-item d-xl-none bg-transparent">
								<div class="input-group mobile-search">
									<span class="input-affix-wrapper input-search"> <input
										type="text" class="form-control" placeholder="Search..."
										aria-label="Search"> <span class="input-suffix">
											<span class="btn-input-clear"><i
												class="bi bi-x-circle-fill"></i></span> <span
											class="spinner-border spinner-border-sm input-loader text-primary"
											role="status"> <span class="sr-only">Loading...</span>
										</span>
									</span>
									</span>
								</div>
							</div>

							<div class="dropdown-footer d-xl-flex d-none">
								<div id="searchBox" style="font-size: 16px">검색하세요 (예)근태, 캘린더, 인사</div>
							</div>
						</div>
					</form>
					<!-- 통합검색 -->
					<script>
						const searchInput = document.getElementById('searchInput');
						const searchBox = document.getElementById('searchBox');
						
						searchInput.addEventListener('keyup', function(event) {
							event.stopPropagation();
						    const keyword = searchInput.value.trim();
							fetch('${path}/mypage/integratedsearch?keyword='+keyword)
							.then(res => res.json())
							.then(data => {
								searchBox.innerHTML = "";
								if (keyword === "" || /^\s+$/.test(keyword)) { // 입력값이 공백 또는 띄어쓰기만 있는 경우
									searchBox.textContent = "검색하세요 (예)근태, 캘린더, 인사";
								} else {
									data.forEach( items =>{
										const span = document.createElement('span');
										const link = document.createElement('a');
										link.href = "${path}"+ items.searchAddress;
										link.textContent = items.searchKeyword;
										
										span.appendChild(link);
										searchBox.appendChild(span);
									});
								}
								// 요소들이 세로로 나타나도록 스타일 수정
								searchBox.style.display = "flex";
								searchBox.style.flexDirection = "column";
							})
							.catch(error => {
							      console.error(`요청 실패: ${error}`);
						    });
					 	});
					</script>
					<!-- /Search -->
				</div>
				<!-- /Start Nav -->


				<!-- End Nav -->
				<div class="nav-end-wrap">
					<ul class="navbar-nav flex-row">
						<!-- email아이콘 -->
						<!-- 
					<li class="nav-item">
						<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover">
							<span class="icon">
								<span class=" position-relative">
								<span class="feather-icon">
									<i data-feather="mail"></i>
								</span>
								<span class="badge badge-sm badge-soft-primary badge-sm badge-pill position-top-end-overflow-1">4</span>
								</span>
							</span>
						</a>
					</li>
					-->
						<!-- /email아이콘 -->

						<!-- 쪽지 아이콘 -->
						<li class="nav-item"><a href="${path}/messageview"
							class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover">
								<span class="icon"> <span class=" position-relative">
										<span class="nav-icon-wrap"> <span class="svg-icon">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-send">
													<line x1="22" y1="2" x2="11" y2="13"></line>
													<polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
											</svg>
										</span>
									</span> <span
										class="badge badge-sm badge-soft-primary badge-sm badge-pill position-top-end-overflow-1">${msgUnreadCount }</span>
								</span>

							</span>
						</a>
						
									
						</li>
						<!-- /쪽지 아이콘 -->

						<!-- 알림 아이콘 -->
						<!--  -->
						<!-- <li class="nav-item">
						<div class="dropdown dropdown-notifications">
							<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover dropdown-toggle no-caret" data-bs-toggle="dropdown" data-dropdown-animation role="button" aria-haspopup="true" aria-expanded="false">
							<span class="icon">
								<span class="position-relative">
									<span class="feather-icon">
										<i data-feather="bell"></i>
									</span>
									<span class="badge badge-success badge-indicator position-top-end-overflow-1"></span>
								</span>
							</span>
							</a>
							<div class="dropdown-menu dropdown-menu-end p-0">
								<h6 class="dropdown-header px-4 fs-6">알림
									<a href="#" class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover"><span class="icon"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
								</h6>
								<div data-simplebar class="dropdown-body  p-2">
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-rounded avatar-sm">
													<img src="resources/img/avatar2.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">Morgan Freeman accepted your invitation to join the team</div>
													<div class="notifications-info">
														<span class="badge badge-soft-success">Collaboration</span>
														<div class="notifications-time">Today, 10:14 PM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar  avatar-icon avatar-sm avatar-success avatar-rounded">
													<span class="initial-wrap">
														<span class="feather-icon"><i data-feather="inbox"></i></span>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">New message received from Alan Rickman</div>
													<div class="notifications-info">
														<div class="notifications-time">Today, 7:51 AM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar  avatar-icon avatar-sm avatar-pink avatar-rounded">
													<span class="initial-wrap">
														<span class="feather-icon"><i data-feather="clock"></i></span>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">You have a follow up with Jampack Head on Friday, Dec 19 at 9:30 am</div>
													<div class="notifications-info">
														<div class="notifications-time">Yesterday, 9:25 PM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-rounded">
													<img src="resources/img/avatar3.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">Application of Sarah Williams is waiting for your approval</div>
													<div class="notifications-info">
														<div class="notifications-time">Today 10:14 PM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-rounded">
													<img src="resources/img/avatar10.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<div>	
													<div class="notifications-text">Winston Churchil shared a document with you</div>
													<div class="notifications-info">
														<span class="badge badge-soft-violet">File Manager</span>
														<div class="notifications-time">2 Oct, 2021</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar  avatar-icon avatar-sm avatar-danger avatar-rounded">
													<span class="initial-wrap">
														<span class="feather-icon"><i data-feather="calendar"></i></span>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div>	
													<div class="notifications-text">Last 2 days left for the project to be completed</div>
													<div class="notifications-info">
														<span class="badge badge-soft-orange">Updates</span>
														<div class="notifications-time">14 Sep, 2021</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-footer"><a href="#"><u>View all notifications</u></a></div>
							</div>
						</div>
					</li>-->
						<!-- /알림 아이콘 -->

						<!-- 프로필 아이콘 -->
						<li class="nav-item">
							<div class="dropdown ps-2">
								<a class=" dropdown-toggle no-caret" href="#" role="button"
									data-bs-display="static" data-bs-toggle="dropdown"
									data-dropdown-animation data-bs-auto-close="outside"
									aria-expanded="false">
									<div class="avatar avatar-rounded avatar-xs">
										<c:choose>
											<c:when test="${loginEmp.emp_profile_re_name ne null }">
												<img
													src="${path }/resources/upload/profile/${loginEmp.emp_profile_re_name }"
													alt="user" class="avatar-img">
											</c:when>
											<c:otherwise>
												<img src="${path }/resources/img/avatar12.jpg" alt="user"
													class="avatar-img">
											</c:otherwise>
										</c:choose>
									</div>
								</a>
								<div class="dropdown-menu dropdown-menu-end">
									<div class="p-2">
										<div class="media">
											<div class="media-head me-2">
												<div class="avatar avatar-rounded avatar-xs">
													<c:choose>
														<c:when test="${loginEmp.emp_profile_re_name ne null }">
														<a href="${path }/mypage/myprofile">
															<img
																src="${path }/resources/upload/profile/${loginEmp.emp_profile_re_name }"
																alt="user" class="avatar-img">
														</a>
														</c:when>
														<c:otherwise>
															<img src="${path }/resources/img/avatar12.jpg" alt="user"
																class="avatar-img">
														</c:otherwise>
													</c:choose>
												</div>
											</div>

										</div>
										<div class="media-body">
											<c:choose>
												<c:when test="${not empty loginEmp}">
												<a href="${path }/mypage/myprofile">
													<span class="d-block fw-medium" style="font-size:0.9rem">${loginEmp.emp_name}님 반가워요!</span>
												</a>
													<div class="fs-7">${loginEmp.emp_email }</div>		
													<a href="${path}/logout" class="d-block fs-8 link-secondary"><u><b>로그아웃</b></u></a>
												</c:when>
												<c:when test="${empty loginEmp}">
													<span class="d-block fw-medium">로그인 하세요!</span>
													<a href="${path}/MyLoginPage" class="d-block fs-8 link-secondary"><u><b>로그인하러 가기</b></u></a>
												</c:when>
											</c:choose>
											
												<!-- <div class="dropdown">
											<span class="d-block fw-medium">${loginEmp.emp_name} 님</span>
											<!-- <div class="dropdown">
												<a href="#" class="d-block dropdown-toggle link-dark fw-medium"  data-bs-toggle="dropdown" data-dropdown-animation data-bs-auto-close="inside"></a>
												<div class="dropdown-menu dropdown-menu-end">
													<div class="p-2">
														<div class="media align-items-center active-user mb-3">
															<div class="media-head me-2">
																<div class="avatar avatar-primary avatar-xs avatar-rounded">
																	<span class="initial-wrap">Hk</span>
																</div>
															</div>
															<div class="media-body">
																<a href="#" class="d-flex align-items-center link-dark">${loginEmp.emp_name}<i class="ri-checkbox-circle-fill fs-7 text-primary ms-1"></i></a>
																<a href="#" class="d-block fs-8 link-secondary"><u>Manage your account</u></a>
															</div>
														</div>
														<div class="media align-items-center mb-3">
															<div class="media-head me-2">
																<div class="avatar avatar-xs avatar-rounded">
																	<img src="resources/img/avatar12.jpg" alt="user" class="avatar-img">
																</div>
															</div>
															<div class="media-body">
																<a href="#" class="d-block link-dark">Jampack Team</a>
																<a href="#" class="d-block fs-8 link-secondary">contact@hencework.com</a>
															</div>
														</div>
														<button class="btn btn-block btn-outline-light btn-sm">
															<span><span class="icon"><span class="feather-icon"><i data-feather="plus"></i></span></span>
															<span>Add Account</span></span>
														</button>
													</div>
												</div>
											</div>-->


										</div>
									</div>
									<!-- 
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="profile.html">Profile</a>
								<a class="dropdown-item" href="#"><span class="me-2">Offers</span><span class="badge badge-sm badge-soft-pink">2</span></a><div class="dropdown-divider"></div>
								<h6 class="dropdown-header">Manage Account</h6>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="credit-card"></i></span><span>Payment methods</span></a>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="check-square"></i></span><span>Subscriptions</span></a>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="settings"></i></span><span>Settings</span></a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="tag"></i></span><span>Raise a ticket</span></a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Terms & Conditions</a>
								<a class="dropdown-item" href="#">Help & Support</a>
								-->
								</div>
							</div>
						</li>
						<!-- /프로필 아이콘 -->
					</ul>
				</div>
				<!-- /End Nav -->
			</div>
		</nav>
		<div id="msgStack"></div>
		<!-- /Top Navbar -->
		
		<!-- WebSocket연결 -->

<!--sockJs 라이브러리-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<!--stomp.js 라이브러리-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>

var socket = new SockJS('/ws/msg');  //WebSocketConfig에서 지정한 endpoint와 연결
var stompClient = Stomp.over(socket); //STOMP 클라이언트 생성
stompClient.debug = function(str){
	console.log(str);
};
var userId = '${loginEmp.emp_id}';
console.log(userId);
//연결 함수
stompClient.connect({userId:userId},onConnected,onError);

	function onConnected(){
	    console.log('연결함수실행');
	    //쪽지가 도착하면 콜백 함수 실행
	    stompClient.subscribe('/topic/messages',onMessageReceived);	    
	}
 
	//메시지 수신
    function onMessageReceived(payload){
	
	   	console.log(payload.body);
	   	console.log('콜백함수실행');
	   	
	    var data = JSON.parse(payload.body);
	    var title = data.title;
	    var sender = data.senderName;
	    
	    console.log(data,"공습경보!!!");
	}
    function onError(){
    	console.log('통신에러');
    }
</script>