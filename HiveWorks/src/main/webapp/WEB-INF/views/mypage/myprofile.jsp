<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>	
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<script src="https://kit.fontawesome.com/8f05e1d322.js" crossorigin="anonymous"></script>

	<div class="hk-pg-wrapper">
		<div class="container">
			<!-- Page Header -->
			<div class="hk-pg-header pg-header-wth-tab pt-7">
				<div class="d-flex">
					<div class="d-flex flex-wrap justify-content-between flex-1">
						<div class="mb-lg-0 mb-2 me-8">
							<h1 class="pg-title">마이페이지 - 프로필보기</h1>
						</div>
					</div>
				</div>
			</div>
				<!-- /Page Header -->
			<section>
				<div class="selectBtn">
		            <div><button class="btn" onclick="location.assign('${path}/mypage/myprofile')"><i class="fa-regular fa-id-card fa-lg"></i>&nbsp; 프로필</button></div>
		            <div><button class="btn" onclick="location.assign('${path}/mypage/editmyprofile')"><i class="fa-solid fa-brush fa-lg"></i>&nbsp; 수정</button></div>
	        	</div>
	
	        <div class="showView">
	            <div class="profile">
	                <div>
	                		<img src="${path }/resources/img/logo_bee.png" alt="user"
									class="brand-img img-fluid " width="200px" height="200px">
					</div>
	            </div>
	            <div class="changeProfile">
	                <form action="" method="post" id="login_form">
	                    <input
	                        class="form-control"
	                        type="text"
	                        value="아이디 : ${employee.emp_id}"
	                        readonly="readonly"
	                    />
	                    <input
	                        class="form-control"
	                        type="text"
	                        value="입사일 : ${employee.emp_hired_date}"
	                        readonly="readonly"
	                    />
	                    <c:set var="residentNo" value="${fn:substring(employee.emp_resident_no, 0, 8)}" />
	                    <input
	                        class="form-control"
	                        type="text"
	                        value="생년월일 : ${residentNo}******"
                        	readonly="readonly"
	                    />
	                    <input
	                     class="form-control"
	                     	type="text"
	                        value="이메일 : ${employee.emp_email}"
                        	readonly="readonly"
	                    />
	                    <input
	                        class="form-control"
	                        type="text"
	                        value="전화번호 : ${employee.emp_cellphone}"
                        	readonly="readonly"
	                    />
	                    <input
	                        class="form-control"
	                        type="text"
	                        value="주소 : ${employee.emp_address}"
                        	readonly="readonly"
	                    />
	                </form>
	            </div>
	        </div>
			</section>
				
			    
	    </div>
    </div>
<style>
        :root {
            --navy: rgba(14, 25, 90, 0.8);
        }
        * {
            box-sizing: border-box;
        }
        body{
            height: 100%;
        }
        section{
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .selectBtn>button{
            background-color: var(--navy);
            color: white;
        }
        .selectBtn{
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
        .selectBtn>div{
            width: 120px;
            height: 50px;
            text-align: center;
        }
        
        #login_form {
            width: 90%;
            display: flex;
            flex-direction: column;
            margin: 0px 30px;
            border-radius:10px;
        }
        #login_form input {
            padding: 15px 30px;
            margin-bottom: 10px;
            font-size: 1rem;
            border-radius: 10px;
            border: none;
            text-align: left;
            background-color: var(--navy);
            color: white;
        }
        
        #login_form a {
            text-align: center;
            text-decoration: none;
            color: inherit;
            font-size: 1rem;
            margin-bottom: 10px;
            color: rgba(255, 255, 255, 0.2);
        }
        .showView{
        	margin-top:50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
            width: 800px;
        }
        .changeProfile{
            width: 50%;
        }
        .profile{
        	display: flex;
        	flex-direction:column;
        	justify-content: center;
        	align-items:center;
        	border-radius:10px;
            width: 400px;
            height: 80%;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }
    </style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>