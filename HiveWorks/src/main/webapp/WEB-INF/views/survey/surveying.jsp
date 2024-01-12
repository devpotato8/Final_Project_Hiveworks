<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<div class="hk-wrapper" data-layout="vertical"
	data-layout-style="collapsed" data-menu="light" data-footer="simple"
	data-hover="active">
<form class="was-validated">
	<div class="mb-3">
	<h2>설문1</h2>																	
	</div>
	<label for="validationTextarea" class="form-label">질문1</label>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문1
		  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문1
		  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문1
		  </label>
	</div>
	<hr />
	<label for="validationTextarea" class="form-label">질문2</label>
	<div class="form-check">
	  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
		  <label class="form-check-label" for="flexRadioDefault1">
		    질문2
	  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
		  <label class="form-check-label" for="flexRadioDefault1">
		    질문2
	  </label>
	</div>
	<hr />
	<label for="validationTextarea" class="form-label">질문3</label>
	<select class="form-select" aria-label="Default select example">
	  <option selected>질문3</option>
	  <option value="1">질문3</option>
	  <option value="2">질문3</option>
	  <option value="3">질문3</option>
	</select>
	<hr />
	<label for="validationTextarea" class="form-label">질문4</label>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문4
		  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문4
		  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문4
		  </label>
	</div>
	<hr />
	<label for="validationTextarea" class="form-label">질문5</label>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문5
		  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문5
		  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    질문5
		  </label>
	</div>
	<hr />
	<label for="validationTextarea" class="form-label">기타의견사항</label>
	<div class="col-md-4 mb-3">
		<textarea class="form-control" rows="3" placeholder="기타의견사항을 기재해주세요" style="width:550px; resize:none"></textarea>
	</div>
	<div>
		<a href="${path}/survey/survey" onclick="btn()">제출하기</a>
	</div>
	
</form>
</div>

<style>
.was-validated{
    width: 1000px;
    height: 1200px;
    margin-left: 400px;
    margin-top: 150px;

}
</style>											
<script>
function btn(){
    alert('제출완료하셨습니다 감사합니다.');
    location.href = "${path}/board/survey";
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>