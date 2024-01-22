<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<!-- 이 페이지에서는 해당 설문이 완료되면 해당 설문 데이터를 표시합니다. -->
<div class="was-validated">
    <h1>설문 결과</h1>
    
    <div>
        <h2>TypeB (다중 선택)</h2>
        <!-- TypeB (다중 선택)에서 선택된 값을 표시합니다. -->
        <c:out value="${param.checkboxValues}" />
    </div>
    
    <div>
        <h2>TypeC (단일 선택)</h2>
        <!-- TypeC (단일 선택)에서 선택된 값을 표시합니다. -->
        <c:out value="${param.radioValue}" />
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
