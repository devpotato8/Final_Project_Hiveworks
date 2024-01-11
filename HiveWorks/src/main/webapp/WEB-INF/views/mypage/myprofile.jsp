<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>	
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<script src="https://kit.fontawesome.com/8f05e1d322.js" crossorigin="anonymous"></script>

	<div class="hk-pg-wrapper">
		<div class="container">
			<!-- Page Header -->
			<div class="hk-pg-header pg-header-wth-tab pt-7">
				<div class="d-flex">
					<div class="d-flex flex-wrap justify-content-between flex-1">
						<div class="mb-lg-0 mb-2 me-8">
							<h1 class="pg-title">마이페이지</h1>
						</div>
					</div>
				</div>
			</div>
				<!-- /Page Header -->
			<section>
				<div class="selectBtn">
		            <div><button class="btn"><i class="fa-regular fa-id-card fa-lg"></i>&nbsp; 프로필</button></div>
		            <div><button class="btn"><i class="fa-solid fa-plane fa-lg"></i>&nbsp; 내휴가</button></div>
		            <div><button class="btn"><i class="fa-solid fa-brush fa-lg"></i>&nbsp; 변경</button></div>
	        	</div>
	
	        <div class="showView">
	            <div class="profile">
	                <div></div>
	                <div></div>
	            </div>
	            <div class="changeProfile">
	                <form action="" method="post" id="login_form">
	                    <input
	                        class="form-control"
	                        name="userId"
	                        type="text"
	                        value=""
	                        readonly="readonly"
	                        placeholder="아이디"
	                    />
	                    <!-- <span id="result" style="font-size: 1.5rem">비밀번호 일치여부</span> -->
	                    <input
	                     class="form-control"
	                        name="email"
	                        type="email"
	                        value=""
	                        placeholder="이메일"
	                        maxlength="20"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='이메일'"
	                    />
	                    <input
	                        class="form-control"
	                        name="phone"
	                        type="text"
	                        value=""
	                        placeholder="휴대폰번호"
	                        maxlength="13"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='휴대폰번호'"
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
            grid-template-columns: 1fr 1fr 1fr;
        }
        .selectBtn>div{
            width: 120px;
            height: 50px;
            text-align: center;
        }
        
        #login_form {
            width: 100%;
            display: flex;
            flex-direction: column;
            margin: 0px 30px;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            border-radius: 5px;
        }
        #login_form input {
            padding: 15px 0px;
            margin-bottom: 10px;
            font-size: 1rem;
            border-radius: 10px;
            border: none;
            text-align: center;
        }
        
        #login_form input::placeholder {
            color: rgba(0, 0, 0, 0.4);
            text-align: center;
        }
        
        #login_form input[type="submit"] {
            background-color: var(--navy);
            color: white;
            cursor: pointer;
            padding: 15px 0px;
            border-radius: 5px;
        }
        #login_form input[type="submit"]:hover {
            scale: 1.005;
        }
        
        #login_form a {
            text-align: center;
            text-decoration: none;
            color: inherit;
            font-size: 1rem;
            margin-bottom: 10px;
            color: rgba(255, 255, 255, 0.2);
        }
        .success{
            color: cornflowerblue;
        }
        .fail{
            color: tomato;
        }
        
        .showView{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
            width: 50%;
        }
        .changeProfile{
            width: 50%;
        }
        .profile{
            width: 50%;
            height: 100%;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

    </style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>