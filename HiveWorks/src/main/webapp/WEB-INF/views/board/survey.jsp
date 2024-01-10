<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<div class="hk-wrapper" data-layout="vertical" data-layout-style="collapsed" data-menu="light" data-footer="simple" data-hover="active">
								<div class="integrations-options-wrap">	
									<select class="form-select">
										<option selected="">진행중</option>
										<option value="1">완료</option>
									</select>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0 d-sm-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
										<span class="icon">
											<span class="feather-icon"><i data-feather="chevron-up"></i></span>
											<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
										</span>
									</a>
								</div>
								<div class="hk-sidebar-togglable"></div>
							</header>
							<div class="integrations-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="container mt-md-7 mt-3">
										<div class="d-flex flex-md-nowrap flex-wrap align-items-center justify-content-between mb-5">
											<div>
												<h5>Recommended for you</h5>
												<p>Because you installed Jampack template these are your recommendations.</p>
											</div>
											<a href="#" class="fs-7 flex-shrink-0"><u>View All</u></a>
										</div>
										<div class="row">
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span>
																
															</span>
														</div>
														<div class="app-name">Intercom</div>
														<div class="app-cat">Chat Application</div>
														<p class="p-sm multine-ellipsis">Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Tortor pretium viverra suspendisse potenti nullam ac tortor vitae.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm mb-3">
															<img src="dist/img/logo-avatar-2.png" alt="user" class="avatar-img">
														</div>
														<div class="app-name">Swiggy</div>
														<div class="app-cat">Food Delivery</div>
														<p class="p-sm multine-ellipsis">Facilisi nullam vehicula ipsum a arcu cursus vitae congue. Dictum fusce ut placerat orci. Semper viverra nam libero justo laoreet sit amet.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm mb-3">
															<img src="dist/img/logo-avatar-10.png" alt="user" class="avatar-img">
														</div>
														<div class="app-name">Medium</div>
														<div class="app-cat">Blog</div>
														<p class="p-sm multine-ellipsis">Purus viverra accumsan in nisl nisi scelerisque. Quam vulputate dignissim suspendisse in est ante. Est ultricies integer quis auctor elit sed.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap bg-dark">
																<img src="dist/img/symbol-avatar-12.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Figma</div>
														<div class="app-cat">Design Tool</div>
														<p class="p-sm multine-ellipsis">Viverra nam libero justo laoreet sit amet cursus sit amet. Faucibus vitae aliquet nec ullamcorper.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
										</div>
										<div class="d-flex align-items-center justify-content-between mt-6 mb-5">
											<div>
												<h5>Popular Apps</h5>
												<p>Used by millions of people around the globe and liked them.</p>
											</div>
											<a href="#" class="fs-7 flex-shrink-0"><u>View All</u></a>
										</div>
										<div class="row">
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-violet mb-3">
															<span class="initial-wrap">H</span>
														</div>
														<div class="app-name">Hencework</div>
														<div class="app-cat">Design Agency</div>
														<p class="p-sm multine-ellipsis">Id diam maecenas ultricies mi eget mauris. At consectetur lorem donec massa sapien faucibus et.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>70.2K Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-4.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Jampack</div>
														<div class="app-cat">Dashboard Template</div>
														<p class="p-sm multine-ellipsis">Ac ut consequat semper viverra nam libero justo laoreet sit. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>4,537 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-1.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Tinder</div>
														<div class="app-cat">Dating App</div>
														<p class="p-sm multine-ellipsis">Laoreet suspendisse interdum consectetur libero id faucibus. Egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris. </p>
													
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-16.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Github</div>
														<div class="app-cat">Developer Geek</div>
														<p class="p-sm multine-ellipsis">Tellus in hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Elit at imperdiet dui accumsan sit. Condimentum lacinia.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>24.8M Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-5.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Dribbble</div>
														<div class="app-cat">Inspiration</div>
														<p class="p-sm multine-ellipsis">Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Tortor pretium viverra suspendisse potenti nullam ac tortor vitae.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm mb-3">
															<img src="dist/img/logo-avatar-1.png" class="avatar-img" alt="logo">
														</div>
														<div class="app-name">Phone Pay</div>
														<div class="app-cat">Payment</div>
														<p class="p-sm multine-ellipsis">Facilisi nullam vehicula ipsum a arcu cursus vitae congue. Dictum fusce ut placerat orci. Semper viverra nam libero justo laoreet sit amet. </p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>234 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm mb-3">
															<img src="dist/img/logo-avatar-3.png" class="avatar-img" alt="logo">
														</div>
														<div class="app-name">Coursera</div>
														<div class="app-cat">Online Courses</div>
														<p class="p-sm multine-ellipsis">Purus viverra accumsan in nisl nisi scelerisque. Quam vulputate dignissim suspendisse in est ante. Est ultricies integer quis auctor elit sed. </p>
													
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>8,769 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-15.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Kickstarter</div>
														<div class="app-cat">Fundraiser</div>
														<p class="p-sm multine-ellipsis">Viverra nam libero justo laoreet sit amet cursus sit amet. Faucibus vitae aliquet nec ullamcorper. </p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>9K Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
										</div>
										<div class="d-flex align-items-center justify-content-between mt-6 mb-5">
											<div>
												<h5>Developer Tools</h5>
												<p>For developer geek in you don't care for others are doing.</p>
											</div>
											<a href="#" class="fs-7 flex-shrink-0"><u>View All</u></a>
										</div>
										<div class="row">
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-9.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Propswala</div>
														<div class="app-cat">Toys & Tents</div>
														<p class="p-sm multine-ellipsis">Ac ut consequat semper viverra nam libero justo laoreet sit. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>754 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-7.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Icons8</div>
														<div class="app-cat">Icons</div>
														<p class="p-sm multine-ellipsis">Laoreet suspendisse interdum consectetur libero id faucibus. Egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris. </p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>842 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-6.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Behance</div>
														<div class="app-cat">Collaboration</div>
														<p class="p-sm multine-ellipsis">Tellus in hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Elit at imperdiet dui accumsan sit. Condimentum lacinia.</p>
													
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>10.6K Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap bg-green-light-5">
																<img src="dist/img/symbol-avatar-10.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Medium</div>
														<div class="app-cat">Publication</div>
														<p class="p-sm multine-ellipsis">Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Tortor pretium viverra suspendisse potenti nullam ac tortor vitae.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,245 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-11.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Node Js</div>
														<div class="app-cat">javascript</div>
														<p class="p-sm multine-ellipsis">Facilisi nullam vehicula ipsum a arcu cursus vitae congue. Dictum fusce ut placerat orci. Semper viverra nam libero justo laoreet sit amet. </p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>9K Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm mb-3">
															<img src="dist/img/logo-avatar-8.png" class="avatar-img" alt="logo">
														</div>
														<div class="app-name">Indian Type Factory</div>
														<div class="app-cat">Fonts</div>
														<p class="p-sm multine-ellipsis">Purus viverra accumsan in nisl nisi scelerisque. Quam vulputate dignissim suspendisse in est ante. Est ultricies integer quis auctor elit sed. </p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>8,768 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm mb-3">
															<img src="dist/img/logo-avatar-5.png" class="avatar-img" alt="logo">
														</div>
														<div class="app-name">City Deals</div>
														<div class="app-cat">Deals</div>
														<p class="p-sm multine-ellipsis">Viverra nam libero justo laoreet sit amet cursus sit amet. Faucibus vitae aliquet nec ullamcorper. </p>
													
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>1,478 Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
											<div class="col-xxl-3 col-xl-4 col-md-6">
												<div class="card card-border card-int mb-4">
													<div class="card-body">
														<div class="avatar avatar-sm avatar-logo mb-3">
															<span class="initial-wrap">
																<img src="dist/img/symbol-avatar-13.png" alt="logo">
															</span>
														</div>
														<div class="app-name">Sketch</div>
														<div class="app-cat">Design Tool</div>
															<p class="p-sm multine-ellipsis">Id diam maecenas ultricies mi eget mauris. At consectetur lorem donec massa sapien faucibus et.</p>
													</div>
													<div class="card-footer justify-content-between border-0">
														<span class="d-flex align-items-center fs-8"><i class="ri-download-cloud-2-line fs-7 me-2"></i>5.4M Downloads</span>
														<a href="#" class="btn btn-sm btn-outline-secondary">Connect</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Page Body -->
		</div>
		<!-- /Main Content -->
	</div>
    <!-- /Wrapper -->
<style>
.form-select{
    margin-top: 100px;
    width: 350px;
    margin-left: 300px;
	
}


</style>
	<!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="dist/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="dist/js/dropdown-bootstrap-extended.js"></script>

	<!-- Simplebar JS -->
	<script src="vendors/simplebar/dist/simplebar.min.js"></script>
	
	<!-- Init JS -->
	<script src="dist/js/init.js"></script>
	<script src="dist/js/chips-init.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>