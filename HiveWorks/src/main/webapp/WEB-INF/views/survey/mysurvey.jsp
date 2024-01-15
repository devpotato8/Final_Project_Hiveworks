<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<!--나의 설문페이지 여기서는 자신이 설문을 작성한 설문,등록한 설문 목록을 띄워주고 작성한 절문 이면 수정,삭제가 가능하게   -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>