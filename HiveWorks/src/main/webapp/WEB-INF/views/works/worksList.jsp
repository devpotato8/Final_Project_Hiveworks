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
	<div class="hk-pg-wrapper">
		<div class="container-xxl">
			<!-- Page Header -->
			<div class="hk-pg-header pg-header-wth-tab pt-7">
				<div class="d-flex">
					<div class="d-flex flex-wrap justify-content-between flex-1">
						<div class="mb-lg-0 mb-2 me-8">
							<h1 class="pg-title">근무페이지</h1>
						</div>
					</div>
				</div>
			</div>
				<!-- /Page Header -->
			<section>
		        <div class="container">
		            <div class="top-bar">
		                <div class="first-line">
		                    <div>근무관리</div>
		                    <div>휴가관리</div>
		                </div>
		                <div class="second-line">
		                    <div>
		                        <div>근무현황</div>
		                        <div>세부근무현황</div>
		                    </div>
		                    <div>
		                        <button>근무내역다운로드</button>
		                    </div>
		                </div>
		                <div class="thrid-line">
		                    <div class="day-filter"><button>일</button><button>주</button><button>월</button><button>년</button><button>주기</button><button>< 2023.12.18~12.24 > </button></div>
		                    <div class="filter-right-part"><button>새로고침</button><div>2023.12.26(화) 오전 08:00</div><button>다운버튼</button></div>
		                </div>
		            </div>
		            <div class="main-container">
		                <p>근무시간</p>
		                <div class="first-container common-container">
		                    <div></div>
		                    <div></div>
		                    <div></div>
		                </div>
		                <p></p>
		                <div class="second-container common-container">
		                    <div></div>
		                    <div></div>
		                    <div></div>
		                </div>
		                <p></p>
		                <div class="third-container common-container">
		                    <div></div>
		                    <div></div>
		                    <div></div>
		                </div>
		            </div>
		        </div>
		    </section>
				
			    
	    </div>
    </div>
<style>
        .container{
            width: 100%;
            height: 100%;
            width: 90%;
            margin: auto;
        }
        
        .top-bar>div{
            display: flex;
            margin-bottom: 10px;
        }
        .first-line{
            font-size: 28px;
        }
        .first-line>div{
            margin-right: 20px;
        }
        .second-line{
            font-size: 18px;
            display: flex;
            justify-content: space-between;
        }
        .second-line>div{
            display: flex;
        }
        .second-line>div>div{
            margin-right: 10px;
        }
        .thrid-line{
            display: flex;
            justify-content: space-between;
        }
        .thrid-line>div{
            display: flex;
        }
        .day-filter>button{
            margin-right: 5px;
        }
        .filter-right-part>button{
            margin: 0 10px;
        }
        .main-container{
            display: flex;
            flex-direction: column;
        }
        .common-container{
            height: 200px;
            display: flex;
            justify-content: space-between;
        }
        .common-container>div{
            box-shadow: rgba(3, 22, 187, 0.16) 0px 1px 4px;
            border-radius: 5px;
            height: 100%;
            width: 30%;
        }
        .main-container>p{
            font-size: 28px;
        }
    </style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>