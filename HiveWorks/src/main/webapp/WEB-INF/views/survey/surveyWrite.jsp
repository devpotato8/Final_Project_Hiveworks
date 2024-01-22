<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<div class="hk-pg-wrapper">
    <div class="container-xxl">
        <!-- Page Header -->
        <div class="hk-pg-header pt-7 pb-4">
            <h1 class="pg-title">설문지 생성하기</h1>
        </div>
        <div class="hk-pg-body">
            <div class="row edit-profile-wrap">
                <div class="col-lg-10 col-sm-9 col-8">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab_block_1">
                            <!-- 기존 설문 양식 요소들 -->

                         <form id="surveyForm" name="surveyFrm" action="${path}/survey/insertSurvey" method="post"
                         onsubmit="return createSurvey();">
                            <div class="row gx-3">
								    <div class="col-sm-6">
								        <div class="form-group">
								            <label class="form-label">설문 시작일</label>
								            <input id="surveyStart" name="surveyStart" class="form-control" type="date" />
								        </div>
								    </div>
								    <div class="col-sm-6">
								        <div class="form-group">
								            <label class="form-label">설문 종료일</label>
								            <input id="surveyEnd" name="surveyEnd" class="form-control" type="date" />
								        </div>
								    </div>
								</div>
                            <div class="row gx-3">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="form-label">제목</label>
                                        <input id="surveyTitle" name="surveyTitle" class="form-control" type="text" />
                                    </div>
                                </div>
                            </div>
                            <div class="row gx-3">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="form-label">작성자</label>
                                        <input id="surveyAuthor" class="form-control" type="text" />
                                    </div>
                                </div>
                            </div>
						
                            <!-- 숨겨진 섹션 추가 버튼들 -->
                            <button type="button" onclick="addHiddenSection('A')">기타의견 추가</button>
                            <button type="button" onclick="addHiddenSection('B')">다중선택 추가</button>
                            <button type="button" onclick="addHiddenSection('C')">단일선택 추가</button>

                            <!-- 숨겨진 섹션 템플릿 및 컨테이너 -->
                            <div id="hiddenSectionTemplate" hidden>
                                <!-- 기존 템플릿 내용 -->
                            </div>
                            <div id="hiddenSectionContainer"></div>

                            <input type="submit" name="name" id="submit" class="btn btn-primary mt-5" value="등록하기">
                        </form>
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>


    function addHiddenSection(type) {
        var hiddenSection = document.getElementById('hiddenSectionTemplate').cloneNode(true);
        hiddenSection.removeAttribute('id');
        hiddenSection.removeAttribute('hidden');

        var newId = 'hiddenSection_' + new Date().getTime();
        hiddenSection.setAttribute('id', newId);
        hiddenSection.setAttribute('data-type', type);
        console.log(hiddenSection.classList);//.add("surveyData");
        // 실제 추가되는 HTML
        if (type === 'A') {
            hiddenSection.innerHTML = '<div class="row gx-3" id="surveyData" name="surveyData"><div class="col-sm-12"><div class="form-group"><div class="form-label-group"><input class="form-control" id="surveyQuestion" name="surveyQuestion" type="text" placeholder="질문제목" /></div><textarea class="form-control" rows="8" placeholder="자유롭게 기재해주세요" style="resize: none; width: 523px;"></textarea><button type="button" class="deleteBtn" onclick="removeHiddenSection(this)">삭제</button></div></div></div>';
        } else if (type === 'B') {
            hiddenSection.innerHTML = '<div class="row gx-3" id="surveyData" name="surveyData"><div class="col-sm-6"><br><div class="form-group"><input class="form-control" id="surveyQuestion" name="surveyQuestion" type="text" placeholder="질문제목" /><div class="col-sm-6" style="width:530px;"><br><div style="display: flex;" id="checkbox_' + newId + '"><input class="" type="checkbox" value="" /> <input class="form-control" type="text" style="margin-left: 10px;" /><button type="button" class="deleteBtn" onclick="removeHiddenSection(this)">삭제</button><button type="button" class="addBtn" onclick="addCheckboxItem(\'' + newId + '\')">추가</button></div></div></div></div><br>';
        } else if (type === 'C') {
            hiddenSection.innerHTML = '<div class="row gx-3" id="surveyData" name="surveyData"><div class="col-sm-6"><br><div class="form-group"><input class="form-control" id="surveyQuestion" name="surveyQuestion" type="text" placeholder="질문제목" /><div class="col-sm-6" style="width:530px;"><br><div style="display: flex;" id="radio_' + newId + '"><input class="" type="radio" value="" /> <input class="form-control" type="text" style="margin-left: 10px;" /><button type="button" class="deleteBtn" onclick="removeHiddenSection(this)">삭제</button><button type="button" class="addBtn" onclick="addRadioItem(\'' + newId + '\')">추가</button></div></div></div></div><br>';
        }

        document.getElementById('hiddenSectionContainer').appendChild(hiddenSection);
        
        
        
    }

    function removeHiddenSection(button) {
        var hiddenSection = button.parentNode;
        hiddenSection.parentNode.removeChild(hiddenSection);
    }

    function addCheckboxItem(parentId) {
        var checkboxContainer = document.getElementById('checkbox_' + parentId);
        var newCheckboxItem = document.createElement('div');
        newCheckboxItem.className = 'row gx-3';

        // <div>로 둘러싸지 않고 내용만 설정
        newCheckboxItem.innerHTML = '<div class="col-sm-6"><br><div style="display: flex;"><input class="" type="checkbox" value="" /> <input class="form-control" type="text" style="margin-left: 10px;" /><button type="button" class="deleteBtn" onclick="removeHiddenSection(this)">삭제</button><button type="button" class="addBtn" onclick="addCheckboxItem(\'' + parentId + '\')">추가</button></div></div>';

        document.getElementById(parentId).appendChild(newCheckboxItem);
    }



    function addRadioItem(parentId) {
        var radioContainer = document.getElementById('radio_' + parentId);
        var newRadioItem = document.createElement('div');
        newRadioItem.className = 'row gx-3';
        newRadioItem.innerHTML = '<div class="col-sm-6"><br><div style="display: flex;"><input class="" type="radio" value="" /> <input class="form-control" type="text" style="margin-left: 10px;" /><button type="button" class="deleteBtn" onclick="removeHiddenSection(this)">삭제</button><button type="button" class="addBtn" onclick="addRadioItem(\'' + parentId + '\')">추가</button></div></div>';
        
        // newRadioItem을 hiddenSection에 추가
        document.getElementById(parentId).appendChild(newRadioItem);
    }
    
    
    function createSurvey(){
    	let surveyData=[];
    	const container=document.querySelectorAll("#hiddenSectionContainer>div");
    	container.forEach(e=>{
    		let survey={};
    		switch($(e).attr("data-type")){
    			case "A" : surveyData.push(makeTypeASurvey($(e),survey));break;
    			default : surveyData.push(makeTypeChoice($(e),survey));break;
    		}
    	});

    	const surveyDataInput=$("<input>").attr({
    		"type":"hidden",
    		"name":"surveyData",
    	}).val(JSON.stringify(surveyData));
    	$("#surveyForm").append(surveyDataInput);
    	//return false;
    	return true;
    }

    function makeTypeASurvey(target){
    	const quiz=target.find("input").val();
    	return {"type":target.attr("data-type"),"title":quiz,choices:[]};
    }
    
    function makeTypeChoice(target){
    	const title=target.find("input#surveyQuestion").val();
    	const inputs=target.find("input[type=text]:not(input#surveyQuestion)");
    	let choices=[];
   		console.log(inputs);
   		inputs.each((i,e)=>{
   			choices.push(e.value)
   		});
     	return {"type":target.attr("data-type"),"title":title,"choices":choices};
//     	console.log(selectBox);
    }
    
    
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>
