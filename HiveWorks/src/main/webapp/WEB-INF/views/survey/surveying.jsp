<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<div class="row gx-3">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">설문 시작일</label> <input
												id="surveyStart" value="${survey.surveyStart }"
												name="surveyStart" class="form-control" type="date"
												readonly="readonly" />
										</div>
									</div>
									<div class="col-sm-6">
									<form>
										<div class="form-group">
											<label class="form-label">설문 종료일</label> <input
												id="surveyEnd" value="${survey.surveyEnd }" name="surveyEnd"
												class="form-control" type="date" readonly="readonly" />
										</div>
										</form>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">제목</label> <input id="surveyTitle"
												value="${survey.surveyTitle }" name="surveyTitle"
												class="form-control" type="text" readonly="readonly" />
										</div>
									</div>
								</div>
								<div class="row gx-3">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="form-label">작성자</label> <input
												id="surveyAuthor" class="form-control" type="text"
												readonly="readonly" />
										</div>
									</div>
								</div>
								<div id="surveyForm" name="surveyForm" value="${survey.surveyData }">								
								</div>
								<input type="submit" name="name" id="submit" class="btn btn-primary mt-5" onclick="sendData()" value="설문완료">
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
function sendData() {
    var surveyData = {
        checkboxValues: [],
        radioValues: []
    };

    $('input[type="checkbox"]:checked').each(function () {
        surveyData.checkboxValues.push($(this).val());
    });

    $('input[type="radio"]:checked').each(function () {
        surveyData.radioValues.push($(this).val());
    });

    // Ajax를 사용하여 서버에 선택한 값을 보냄
    $.ajax({
        type: "POST",
        url: "${path}survey/surveyresult",
        data: { surveyData: JSON.stringify(surveyData) },  // JSON 문자열로 변환
        contentType: 'application/json',  // 콘텐츠 유형 지정
        success: function () {
            location.href = "${path}/survey/surveyresult";
        },
        error: function (error) {
            console.log("에러:", error);
        }
    });
}

let $check = document.getElementById('checkbox_');
$(document).ready(function() {
    $('input[type="checkbox"]').change(function() {
        if (this.checked) {
            var divContainer = $(this).closest('div'); // checkbox 상위의 div를 찾음
            console.log(divContainer);
            
            // 첫 번째 input[type="text"]의 값을 찾음
            var firstCell = divContainer.find('input[type="text"]').val();
            
            // 두 번째 div의 내용을 찾음
            var secondCell = divContainer.find('div:eq(1)').text();
            
            console.log(firstCell, secondCell);
        }
    });
});
$(document).ready(function() {
    $('input[type="radio"]').change(function() {
        if (this.checked) {
            var divContainer = $(this).closest('div'); // checkbox 상위의 div를 찾음
            console.log(divContainer);
            
            // 첫 번째 input[type="text"]의 값을 찾음
            var firstCell = divContainer.find('input[type="text"]').val();
            
            // 두 번째 div의 내용을 찾음
            var secondCell = divContainer.find('div:eq(1)').text();
            
            console.log(firstCell, secondCell);
        }
    });
});
// 서버에서 받아온 JSON 형식의 설문 데이터
var surveyData = ${survey.surveyData};

// surveyData를 기반으로 동적으로 HTML을 생성하여 추가
for (var i = 0; i < surveyData.length; i++) {
var surveyItem = surveyData[i];

var surveyType = surveyItem.type;

// 각 타입에 따라 적절한 HTML 생성 및 추가

switch (surveyType) {
case 'A':
addTypeASurvey(surveyItem);
break;
case 'B':
case 'C':
addTypeChoiceSurvey(surveyItem);
break;
// 추가 타입이 있을 경우에도 처리 가능
}
}

 // 각 타입에 따라서 동적으로 HTML을 생성하여 #surveyForm에 추가하는 함수들
function addTypeASurvey(item) {
// Type A 설문에 대한 처리
// 예시: item.title을 이용하여 제목을 출력
var html = '<div class="row gx-3">';
html += '<div class="col-sm-12">';
html += '<div class="form-group">';
html += '<div class="form-label-group">';
html += '<input class="form-control" type="text" value="' + item.title + '" readonly="readonly" />';
html += '</div>';
html += '<textarea class="form-control" rows="8" style="resize: none;" placeholder="자유롭게 기재해주세요" ></textarea>';
html += '</div>';
html += '</div>';
html += '</div>';

// #surveyForm에 추가
$("#surveyForm").append(html);
}

function addTypeChoiceSurvey(item) {
// Type B 또는 Type C 설문에 대한 처리
          
var html = '<div class="row gx-3">';
html += '<div class="col-sm-6">';
html += '<div class="form-group">';
html += '<input class="form-control" type="text" value="' + item.title + '" readonly="readonly" /><br>';
                                            
// 선택지 출력
for (var j = 0; j < item.choices.length; j++) {
html += '<div class="col-sm-6" style="width:530px;">';
html += '<div style="display: flex;">';
if (item.type === 'B') {
   html += '<input class="" name="check_" type="checkbox" value=""  />';
   } else if (item.type === 'C') {
   html += '<input class="" type="radio" name="radio_' + item.id + '" value="" />';
    }
html += '<input class="form-control" type="text" style="margin-left: 10px;" value="' + item.choices[j] + '" readonly="readonly" />';
html += '</div>';
html += '</div>';
}
                                            
html += '</div>';
html += '</div>';
html += '</div>';
                                            
// #surveyForm에 추가
$("#surveyForm").append(html);
}
</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>