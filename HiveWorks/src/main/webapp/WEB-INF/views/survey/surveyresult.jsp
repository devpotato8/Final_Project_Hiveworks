<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<div class="hk-wrapper" data-layout="vertical" data-layout-style="collapsed" data-menu="light" data-footer="simple" data-hover="active" style="height: 600px;">
    <div class="integrations-options-wrap">
        <div class="hk-sidebar-togglable"></div>
    </div>
    <div class="integrations-body">
        <div data-simplebar class="nicescroll-bar" style="margin-top:200px;">
            <div class="container mt-md-7 mt-3">
                <div class="d-flex flex-md-nowrap flex-wrap align-items-center justify-content-between mb-5">
                    <div>
                        <h5>설문결과</h5>
                    </div>
                </div>
                <div class="row">
                    <h6>Checkbox 값:</h6>
                    <c:forEach var="value" items="${paramValues.checkboxValues}">
                        ${value}<br/>
                    </c:forEach>
                </div>
                <div class="row">
                    <h6>라디오 값:</h6>
                    <c:forEach var="value" items="${paramValues.radioValues}">
                        ${value}<br/>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

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
