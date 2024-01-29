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
							<h1 class="pg-title">프로필 수정</h1>
						</div>
					</div>
				</div>
			</div>
				<!-- /Page Header -->
			<section>
				<div class="selectBtn d-flex justify-content-center">
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
	            <div class="updateProfile">
	                <form action="${path }/mypage/updateProfile" method="post" id="login_form">
	                    <%-- <input
	                    class="form-control"
	                        name="emp_pw"
	                        id="password1"
	                        type="password"
	                        value="${employee.emp_pw}"
	                        placeholder="비밀번호"
	                        maxlength="20"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='비밀번호'"
	                    />
	                    <input
	                        class="form-control"
	                        name="emp_pwChk"
	                        id="password2"
	                        type="password"
	                        placeholder="비밀번호확인"
	                        maxlength="20"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='비밀번호확인'"
	                    >
	                    <span class="text-center" id="passwordMatchMessage">비밀번호 일치여부</span> --%>
	                    <input
	                     class="form-control"
	                        name="emp_email"
	                        type="email"
	                        value="${employee.emp_email}"
	                        placeholder="이메일"
	                        maxlength="20"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='이메일'"
	                        required="required"
	                    />
	                    <input
	                        class="form-control"
	                        name="emp_cellphone"
	                        type="text"
	                        value="${employee.emp_cellphone }"
	                        placeholder="휴대폰번호"
	                        maxlength="13"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='휴대폰번호'"
	                        	required="required"
	                    />
	                    <input
	                        class="form-control"
	                        name="emp_address"
	                        type="text"
	                        value="${employee.emp_address }"
	                        placeholder="주소"
	                        maxlength="13"
	                        onfocus="this.placeholder=''"
	                        onblur="this.placeholder='주소'"
	                        	required="required"
	                    />
	                    <input id="submitModify" class="form-control" type="submit" value="수정하기" />
	                </form>
	            </div>
	        </div>
			</section>
				
			    
	    </div>
    </div>
<script>
	let passwordInput1 = document.getElementById("password1");
	let passwordInput2 = document.getElementById("password2");
	let passwordMatchMessage = document.getElementById("passwordMatchMessage");
	let submitModify = document.getElementById("submitModify");
	passwordInput1.addEventListener("keyup", checkPasswordMatch);
	passwordInput2.addEventListener("keyup", checkPasswordMatch);

  function checkPasswordMatch() {
    let password1 = passwordInput1.value;
    let password2 = passwordInput2.value;

    if (password1 === password2) {
      passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
      submitModify.disabled = false;
    } else {
      passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
      submitModify.disabled = true;
    }
  }
</script>
    
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
        .updateProfile{
        	width: 400px;
        }
        #login_form {
            width: 100%;
            display: flex;
            flex-direction: column;
            margin: 0px 30px;
            border-radius:10px;
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