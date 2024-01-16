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
    <div class="hk-pg-wrapper">
    <div class="container-xxl">
        <!-- Page Header -->
        <div class="hk-pg-header pt-7 pb-4">
            <h1 class="pg-title">설문하기</h1>
        </div>
        <div class="hk-pg-body">
            <div class="row edit-profile-wrap">
                <div class="col-lg-10 col-sm-9 col-8">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab_block_1">
                            <!-- 기존 설문 양식 요소들 -->

                         <%-- <form id="surveyForm" name="surveyFrm" action="${path }/survey/insertSurvey" method="post"> --%>
                          <c:forEach var="s" items="${surveyList }">
                            <div class="row gx-3">
								    <div class="col-sm-6">
								        <div class="form-group">
								            <label class="form-label">설문 시작일</label>
								            <input id="surveyStart" value="${s.surveyStart }" name="surveyStart" class="form-control" type="date" readonly="readonly"/>
								        </div>
								    </div>
								    <div class="col-sm-6">
								        <div class="form-group">
								            <label class="form-label">설문 종료일</label>
								            <input id="surveyEnd" value="${s.surveyEnd }" name="surveyEnd" class="form-control" type="date" readonly="readonly"/>
								        </div>
								    </div>
								</div>
                            <div class="row gx-3">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="form-label">제목</label>
                                        <input id="surveyTitle" value="${s.surveyTitle }" name="surveyTitle" class="form-control" type="text" readonly="readonly"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row gx-3">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="form-label">작성자</label>
                                        <input id="surveyAuthor" class="form-control" type="text" readonly="readonly"/>
                                    </div>
                                </div>
                            </div>

                            <!-- 숨겨진 섹션 추가 버튼들 -->
                        

                            <!-- 숨겨진 섹션 템플릿 및 컨테이너 -->
                            
							   <div class="row gx-3"><div class="col-sm-6"><br><div class="form-group"><input class="form-control" type="text" placeholder="질문제목" readonly="readonly"/><div class="col-sm-6" style="width:530px;"><br><div style="display: flex;" id="checkbox_' + newId + '"><input class="" type="checkbox" value="${s.surveyType }" /> <input class="form-control" type="text" style="margin-left: 10px;" readonly="readonly"/></div></div></div></div><br>
							   <div class="row gx-3"><div class="col-sm-6"><br><div class="form-group"><input class="form-control" type="text" placeholder="질문제목" readonly="readonly"/><div class="col-sm-6" style="width:530px;"><br><div style="display: flex;" id="radio_' + newId + '"><input class="" type="radio" value="${s.surveyType }" /> <input class="form-control" type="text" style="margin-left: 10px;" readonly="readonly"/></div></div></div></div><br>							
                               <div class="row gx-3"><div class="col-sm-12"><div class="form-group"><div class="form-label-group"><label class="form-label">기타의견</label></div><textarea class="form-control" rows="8" placeholder="자유롭게 기재해주세요" style="resize: none; width: 523px;" value="${s.surveyType }"></textarea></div></div></div>
                          
                            <div id="hiddenSectionContainer"></div>

                        	</c:forEach>
                        <!-- </form> -->
                            <input type="submit" name="name" id="submit"  onclick="btn()" class="btn btn-primary mt-5" value="설문완료">
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        location.href = "${path}/survey/survey";
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
