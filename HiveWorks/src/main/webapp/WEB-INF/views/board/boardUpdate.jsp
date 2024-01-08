<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="hk-pg-wrapper">
    <div class="container-xxl" style="margin-left: 0px;">
        <h2>수정</h2>
    </div>
    <div id="board-container">
        <form name="boardUpdate" action="${path}/board/boardUpdate" method="post">
    <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
    <input type="hidden" name="boardNo" value="${board.boardNo}"/>
            <div class="input-group mb-3" style="padding:0px;">
            </div>
            <div class="input-group mb-3" style="padding:0px;">
  				<div class="input-group-prepend" style="padding:0px;">
                    <button type="button" onclick="fn_addFileForm();">추가</button>                    
                </div>
            </div>
            <div id="basicFileForm" class="input-group mb-3">
			    <div class="custom-file" style="display: flex; align-items: center;">
			        <input type="file" name="upFile" class="custom-file-input">
			        <button type="button" onclick="fn_deleteFileForm();" id="deleteBtn">삭제</button>
			    </div>
			</div>

            <textarea class="form-control" id="editor" value="${data.editor }" name="boardContent" placeholder="내용을입력해주세요" required style="resize:none;">
            ${board.boardContent}</textarea>
            <br />
              <input type="submit" name="name" id="submit" class="btn btn-outline-success" value="저장">
	</form>
    </div>

<style>
    .ck-editor__editable {
        height: 400px;
    }
    .basicFileForm{
    	padding: 0px;
    }
    .custom-file{
    	display: flex; 
    	align-items: center;
    }
    #deleteBtn{
    	margin-left: 0px;
    	width: 66px;
    	margin-bottom: 15px;
    }
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input{margin-bottom:15px;}
</style>
<script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
	<script>
      ClassicEditor.create( document.querySelector( '#editor' ) );
    </script>
    <script>
     const adddelFunction=(function(){
    		let count=2;
    		const addFile=()=>{
    			if(count<=5){
		    		const fileForm=$("#basicFileForm").clone(true);
		    		fileForm.find("span.input-group-text").text("첨부파일 "+count);
		    		fileForm.find("label.custom-file-label").text("파일을 선택하세요")
		    		.attr("for","upFile"+count);
		    		fileForm.find("input[type=file]").attr("id","upFile"+count).val("");
		    		$("textarea[name=boardContent]").before(fileForm);
		    		count++;
		    	}else{
	    			alert("첨부파일은 5개까지 가능합니다.");
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
