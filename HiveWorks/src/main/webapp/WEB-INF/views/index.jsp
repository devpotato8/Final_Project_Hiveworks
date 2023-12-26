<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<style>
        .container{
        	margin-top: 20px;
            width: 100%;
            height: 100%;
            display: flex;
        }
        .left-container{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 25%;
            height: 500px;
        }
        .left-container>div{
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            height: 30%;
            border-radius: 5px;
        }
        .right-container{
            margin-left: 15px;
            width: 70%;
            height: 500px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        .right-container>div{
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            border-radius: 5px;
        }
</style>
<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<div class="container-xxl">
				<!-- Page Header -->
				<div class="hk-pg-header pg-header-wth-tab pt-7">
					<div class="d-flex">
						<div class="d-flex flex-wrap justify-content-between flex-1">
							<div class="mb-lg-0 mb-2 me-8">
								<h1 class="pg-title">안녕하세요 OO님</h1>
							</div>
						</div>
					</div>
				</div>
				<!-- /Page Header -->

				<!-- Page Body -->
				<section>
			        <div class="container">
			            <div class="left-container">
			                <div></div>
			                <div></div>
			                <div></div>
			            </div>
			            <div class="right-container">
			                <div></div>
			                <div></div>
			                <div></div>
			                <div></div>
			            </div>
			        </div>
			    </section>
				<!-- <div class="hk-pg-body">
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab_block_1">
							<div class="row">
								
							
							</div>	
							<div class="row">
								<div class="col-md-12 mb-md-4 mb-3">
								
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 mb-md-4 mb-3">
									
							</div>	
						</div>
					</div>
				</div>
				/Page Body		
				</div> -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>