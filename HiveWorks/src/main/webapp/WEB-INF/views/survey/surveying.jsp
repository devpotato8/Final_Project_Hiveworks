<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<div class="was-validated">
    <!-- 이 부분은 설문 등록 페이지에서 입력한 질문들을 불러와서 출력하는 부분입니다. -->
    <form id="surveycreate" action="${path}/survey/insertSurvey" method="post">
    	
    	
    </form>

    <div>
        <a href="${path}/survey/survey" onclick="btn()">제출하기</a>
    </div>
</div>

<style>
    .was-validated {
        width: 1000px;
        height: 1200px;
        margin-left: 400px;
        margin-top: 150px;
    }
</style>
<script>
    function btn() {
        alert('제출 완료하셨습니다 감사합니다.');
        location.href = "${path}/board/survey";
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
