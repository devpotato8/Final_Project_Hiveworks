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
<section>
<h1>달력페이지입니다</h1>
</section>
	    
<%@ include file="/WEB-INF/views/common/footer.jsp"%>