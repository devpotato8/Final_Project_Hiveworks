<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<!-- Main Content -->
<div class="hk-pg-wrapper">
    <div class="container-xxl">
        <!-- EDoc SideBar -->
        <!-- /EDoc SideBar -->
        <!-- Page Header -->
        <div class="hk-pg-header pg-header-wth-tab pt-7">
            <div class="d-flex">
                <div class="d-flex flex-wrap justify-content-between flex-1">
                    <div class="mb-lg-0 mb-2 me-8">
                        <h1 class="pg-title">전자문서</h1>
                        <h3>Status : <c:out value="${status }"/></h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Page Header -->
        <!-- Page Body -->
        <div>
            <div class="container">
                
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>