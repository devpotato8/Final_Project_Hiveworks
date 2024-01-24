<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
.menu-content-wrap {
	padding : 1.5rem;
	position : relative;
}
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
    left: 25px;
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
.fmapp-wrap .fmapp-content {
    padding-left: 200px;
}
</style>
<nav class="fmapp-sidebar" style="width:200px">
	<div data-simplebar class="nicescroll-bar">
		<div class="menu-content-wrap">
			<button type="button" class="btn btn-warning btn-rounded btn-block mb-4" id="btn-write">
				기안하기
			</button>
			<div class="separator separator-light">문서 관리</div>
			<div class="menu-group">
				<ul class="nav nav-light navbar-nav flex-column">
					<li class="nav-item
						<c:if test="${currentPage eq 'lists' }">active</c:if> 
					 ">
						<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#edoc_pending">
							<span class="nav-icon-wrap">
								<span class="svg-icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square">
										<polyline points="9 11 12 14 22 4"></polyline>
										<path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
									</svg>
								</span>
							</span>
							<span class="nav-link-text">진행중인 문서</span>
							
						</a>
						<ul id="edoc_pending" class="nav flex-column collapse nav-children">
							<li class="nav-item">
								<a class="nav-link" href="${path }/edoc/lists/all"><span class="nav-link-text">전체
									<c:if test="${param.countAll > 0 }">
										<span class="badge badge-sm badge-warning badge-pill">${param.countAll }</span>
									</c:if>
									</span>
								</a>
								<a class="nav-link" href="${path }/edoc/lists/wait"><span class="nav-link-text">대기
									<c:if test="${param.countWait > 0 }">
										<span class="badge badge-sm badge-warning badge-pill">${param.countWait }</span>
									</c:if>
									</span>
								</a>
								<a class="nav-link" href="${path }/edoc/lists/check"><span class="nav-link-text">확인
									<c:if test="${param.countCheck > 0 }">
										<span class="badge badge-sm badge-warning badge-pill">${param.countCheck }</span>
									</c:if>
									</span>
								</a>
								<a class="nav-link" href="${path }/edoc/lists/expect"><span class="nav-link-text">예정
									<c:if test="${param.countExpect > 0 }">
										<span class="badge badge-sm badge-warning badge-pill">${param.countExpect }</span>
									</c:if>
									</span>
								</a>
								<a class="nav-link" href="${path }/edoc/lists/process"><span class="nav-link-text">진행
									<c:if test="${param.countProcess > 0 }">
										<span class="badge badge-sm badge-warning badge-pill">${param.countProcess }</span>
									</c:if>
									</span>
								</a>
							</li>	
						</ul>
					</li>
					<li class="nav-item
						<c:if test="${currentPage eq 'box' }">active</c:if> 
					 ">
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
								<a class="nav-link" href="${path }/edoc/box/all"><span class="nav-link-text">전체</span></a>
								<a class="nav-link" href="${path }/edoc/box/writer"><span class="nav-link-text">기안</span></a>
								<a class="nav-link" href="${path }/edoc/box/approval"><span class="nav-link-text">결재</span></a>
								<!--<a class="nav-link" href="${path }/edoc/box/refer"><span class="nav-link-text">수신</span></a>-->
								<a class="nav-link" href="${path }/edoc/box/read"><span class="nav-link-text">회람/참조</span></a>
								<a class="nav-link" href="${path }/edoc/box/return"><span class="nav-link-text">반려</span></a>
							</li>	
						</ul>
					</li>
				</ul>
			</div>
			<c:if  test="${loginEmp.aut_code.equals('AUT001')||loginEmp.aut_code.equals('AUT004')}">
				<div class="separator separator-light">관리자메뉴</div>
				<div class="menu-group">
					<ul class="nav nav-light navbar-nav flex-column">
						<li class="nav-item
							<c:if test="${currentPage eq 'format' }">active</c:if> 
						">
							<a class="nav-link" href="${path }/edoc/format/lists">
								<span class="nav-icon-wrap">
									<i class="icon" data-icon="p"></i>
								</span>
								<span class="nav-link-text">문서양식 설정</span>
							</a>
						</li>
						<li class="nav-item
							<c:if test="${currentPage eq 'format' }">active</c:if> 
						">
							<a class="nav-link" href="javascript:void(0);">
								<span class="nav-icon-wrap">
									<span class="feather-icon"><i data-feather="settings"></i></span>
								</span>
								<span class="nav-link-text">관리자 설정</span>
								
							</a>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
	<!--Sidebar Fixnav-->
	<div class="fmapp-fixednav">
		<div class="hk-toolbar">
			<ul class="nav nav-light">
				<li class="nav-item nav-link">
					<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Settings" href="${path }/edoc/personalSetting">
						<span class="icon"><span class="feather-icon"><i data-feather="settings"></i></span></span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!--/ Sidebar Fixnav-->
</nav>
<script>
document.querySelector("#btn-write").addEventListener("click",(e)=>{
	location.href="${path}/edoc/write";
});
</script>