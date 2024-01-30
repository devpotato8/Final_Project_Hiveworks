<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>

 <div id="pie_chart_1"></div>
<div class="hk-wrapper" data-layout="vertical" data-layout-style="collapsed" data-menu="light" data-footer="simple" data-hover="active" style="height: 600px;">
    <div class="integrations-options-wrap">
        <div class="hk-sidebar-togglable"></div>
    </div>
    <div class="integrations-body">
        <div data-simplebar class="nicescroll-bar" style="margin-top:200px;">
            <div class="container mt-md-7 mt-3">
                <div class="d-flex flex-md-nowrap flex-wrap align-items-center justify-content-between mb-5">
                    <div>
                      <h5>
                      
					    <c:forEach var="a" items="${surveyList}">
					    	<c:out value="${a.surveyQuestion }"/>
					    </c:forEach>
					   </h5>
					      
					   <p>체크:
					        <c:forEach var="checkboxValue" items="${sessionScope.response.checkboxValues}">
					            ${checkboxValue}
					        </c:forEach>
					   </p>
					    <p>라디오:
					        <c:forEach var="radioValue" items="${sessionScope.response.radioValues}">
					            ${radioValue}
					        </c:forEach>
					    </p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$.ajax({ 
    type:"post", 
    url:"${path}/survey/insertQuestion", //값을 가져올 경로
    dataType:"json",
    success: function(data){   
    },
    error:function(){		 
    }
});
</script>

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