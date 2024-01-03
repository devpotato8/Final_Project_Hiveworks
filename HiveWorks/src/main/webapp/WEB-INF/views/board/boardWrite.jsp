<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="hk-pg-wrapper">
    <div class="container-xxl" style="margin-left: 0px;">
        <h2>등록</h2>
    </div>
    <div id="board-container">
        <form name="boardFrm" action="${path }/board/insertBoard" method="post" enctype="multipart/form-data">
            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" required>
            <input type="hidden" class="form-control" placeholder="작성자" name="boardWriter" value="${creater}" readonly required>
            <div class="input-group mb-3" style="padding:0px;">
            	<div class="input-group-prepend" style="padding:0px;">
                    <button type="button" onclick="fn_addFileForm();">추가</button>
                    <button type="button" onclick="fn_deleteFileForm();">삭제</button>
                </div>
            </div>
            <div id="basicFileForm" class="input-group mb-3" style="padding:0px;">
                <div class="custom-file">
                     <input type="file" class="custom-file-input" name="upFiles" id="upFile1">
                </div>
            </div>
            <textarea class="form-control" name="boardContent" value="${boardContent }" placeholder="내용" required style="resize:none;"></textarea>
            <br />
            <input type="submit" class="btn btn-outline-success" value="저장" >
        </form>
    </div>

    <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input{margin-bottom:15px;}
    </style>
    <script>
     const adddelFunction=(function(){
    		let count=2;
    		const addFile=()=>{
    			if(count<=3){
		    		const fileForm=$("#basicFileForm").clone(true);
		    		fileForm.find("span.input-group-text").text("첨부파일 "+count);
		    		fileForm.find("label.custom-file-label").text("파일을 선택하세요")
		    		.attr("for","upFile"+count);
		    		fileForm.find("input[type=file]").attr("id","upFile"+count).val("");
		    		$("textarea[name=boardContent]").before(fileForm);
		    		count++;
		    	}else{
	    			alert("첨부파일은 3개까지 가능합니다.");
	    		}
    		};
    		const delFile=()=>{
    			if(count!=2){
	    			$("textarea[name=boardContent]").prev().remove();
	    			count--;
    			}
    		};
    		
    		return [addFile,delFile];
    	})();
    
		const fn_addFileForm=adddelFunction[0];
    	const fn_deleteFileForm=adddelFunction[1]; 
    	
    	$("input[name=upFile]").change(e=>{
    		const fileName=e.target.files[0].name;
    		$(e.target).next(".custom-file-label").text(fileName);
    	});
    </script>

<style>
    .ck-editor__editable {
        height: 400px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    const adddelFunction = (function () {
        let count = 2;
        const addFile = () => {
            if (count <= 5) {
                const fileForm = $("#basicFileForm").clone(true);
                fileForm.find("span.input-group-text").text("첨부파일 " + count);
                fileForm.find("label.custom-file-label").text("파일을 선택하세요")
                    .attr("for", "upFile" + count);
                fileForm.find("input[type=file]").attr("id", "upFile" + count).val("");
                fileForm.find("input[type=file]").on('change', function (e) {
                    const fileName = e.target.files[0].name;
                    $(e.target).next(".custom-file-label").text(fileName);
                });
                $("textarea[name=boardContent]").before(fileForm);
                count++;
            } else {
                alert("첨부파일은 5개까지 가능합니다.");
            }
        };
        const delFile = () => {
            if (count != 2) {
                $("textarea[name=boardContent]").prev().remove();
                count--;
            }
        };

        return [addFile, delFile];
    })();

    const fn_addFileForm = adddelFunction[0];
    const fn_deleteFileForm = adddelFunction[1];

    $("input[name=upFile]").change(e => {
        const fileName = e.target.files[0].name;
        $(e.target).next(".custom-file-label").text(fileName);
    });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
