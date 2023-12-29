<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.menu-content-wrap .menu-group .navbar-nav > .nav-item > ul {
    position: relative;
    padding: 0.5rem 0;
}
.menu-content-wrap .menu-group .navbar-nav > .nav-item > ul:after {
    background: #d8d8d8;
}
.menu-content-wrap .menu-group .navbar-nav > .nav-item > ul:after {
    content: "";
    width: 1px;
    background: #d8d8d8;
    height: calc(100% - 20px);
    position: absolute;
    left: 10px;
    top: 0;
    bottom: 0;
    margin: auto;
}
.menu-content-wrap .menu-group .navbar-nav .nav-item .nav-link[data-bs-toggle=collapse]::after {
    color: rgba(38, 42, 46, 0.3);
}
.menu-content-wrap .menu-group .navbar-nav .nav-item .nav-link[data-bs-toggle=collapse][aria-expanded=true]::after {
    -webkit-transform: rotate(-180deg);
    -moz-transform: rotate(-180deg);
    -ms-transform: rotate(-180deg);
    -o-transform: rotate(-180deg);
    transform: rotate(-180deg);
}
.menu-content-wrap .menu-group .navbar-nav .nav-item .nav-link[data-bs-toggle=collapse]::after {
    position: absolute;
    right: 1rem;
    z-index: -1;
    content: "\f2f9";
    color: rgba(38, 42, 46, 0.3);
    font: normal normal normal 1.125rem/1 "Material-Design-Iconic-Font";
    text-rendering: auto;
    margin-left: auto;
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
}
.menu-content-wrap .menu-group .navbar-nav > .nav-item.active > .nav-link {
    background: rgba(0, 125, 136, 0.15);
    color: #007D88 !important;
    border-radius: 0.5rem;
}
 .menu-content-wrap .menu-group .navbar-nav .nav-item .nav-link {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    color: #262a2e;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    white-space: nowrap;
}
.menu-content-wrap .menu-group .nav-children .nav-item .nav-link {
    font-size: 0.875rem;
    padding: 0.15rem 0 0.15rem 1.4rem;
    margin: 0 0 0 1rem;
    -moz-transition: all 0.25s ease;
    -o-transition: all 0.25s ease;
    -webkit-transition: all 0.25s ease;
    transition: all 0.25s ease;
}
</style>
<nav class="fmapp-sidebar">
	<div data-simplebar class="nicescroll-bar">
		<div class="menu-content-wrap">
			<button type="button" class="btn btn-warning btn-rounded btn-block mb-4">
				기안하기
			</button>
			
			<div class="menu-group">
				<ul class="nav nav-light navbar-nav flex-column">
					<li class="nav-item">
						<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#edoc_pending">
							<span class="nav-icon-wrap">
								<span class="svg-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square">
										<polyline points="9 11 12 14 22 4"></polyline>
										<path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
									</svg>
								</span>
							</span>
							<span class="nav-link-text">진행중</span>
							
						</a>
						<ul id="edoc_pending" class="nav flex-column collapse nav-children">
							<li class="nav-item">
								<a class="nav-link" href="#"><span class="nav-link-text">전체</span></a>
								<a class="nav-link" href="#"><span class="nav-link-text">대기</span></a>
								<a class="nav-link" href="#"><span class="nav-link-text">확인</span></a>
								<a class="nav-link" href="#"><span class="nav-link-text">예정</span></a>
								<a class="nav-link" href="#"><span class="nav-link-text">진행</span></a>
							</li>	
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#edoc_box">
							<span class="nav-icon-wrap">
								<span class="svg-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-archive">
										<polyline points="21 8 21 21 3 21 3 8"></polyline>
										<rect x="1" y="3" width="22" height="5"></rect>
										<line x1="10" y1="12" x2="14" y2="12"></line>
									</svg>
								</span>
							</span>
							<span class="nav-link-text">보관함</span>
							
						</a>
						<ul id="edoc_box" class="nav flex-column collapse  nav-children">
							<li class="nav-item">
								<ul class="nav flex-column">
									<li class="nav-item">
										<a class="nav-link" href="#"><span class="nav-link-text">전체</span></a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#"><span class="nav-link-text">대기</span></a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#"><span class="nav-link-text">확인</span></a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#"><span class="nav-link-text">예정</span></a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#"><span class="nav-link-text">진행</span></a>
									</li>
								</ul>	
							</li>	
						</ul>
					</li>
				</ul>
			</div>
			<div class="separator separator-light"></div>
			
		</div>
	</div>
	<div class="fmapp-storage">

	</div>
	<!--Sidebar Fixnav-->
	<div class="fmapp-fixednav">
		<div class="hk-toolbar">
			<ul class="nav nav-light">
				<li class="nav-item nav-link">
					<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Settings" href="#"><span class="icon"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
				</li>
			</ul>
		</div>
	</div>
	<!--/ Sidebar Fixnav-->
</nav>