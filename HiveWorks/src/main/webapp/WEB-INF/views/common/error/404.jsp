<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
										<img src="${path}resources/img/macaroni-fatal-error.png"  class="img-fluid w-sm-80 w-50" alt="login"/>
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
											<h1 class="display-4 fw-bold mb-2">Error</h1>
											<p class="p-lg">404: 요청을 찾을 수 없어요 ㅠㅠ</p>
											<a href="${path}/" class="btn btn-primary mt-4">메인페이지로</a>
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


<%@ include file="/WEB-INF/views/common/footer.jsp"%>