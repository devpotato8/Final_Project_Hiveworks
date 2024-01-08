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
<link href="vendors/dropify/dist/css/dropify.min.css" rel="stylesheet" type="text/css"/>
<div class="hk-pg-wrapper">
    <div class="container-xxl" style="margin-left: 0px;">
        <h2>등록</h2>
    </div>
    <div id="board-container">
        <form name="boardFrm" action="${path }/board/insertBoard" method="post" enctype="multipart/form-data">
            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" required>
            <div class="input-group mb-3" style="padding:0px;">
  				<div class="input-group-prepend" style="padding:0px;">
                    <button type="button" onclick="fn_addFileForm();">추가</button>
                    <button type="button" onclick="fn_deleteFileForm();">삭제</button>
                </div>
            </div>
            <div class="row">
												
													<div class="upload-logo">
														<input type="file" class="dropify-2" name="upFile"/>
													</div>
												</div>	
												
            <textarea class="form-control" id="editor" name="boardContent" placeholder="내용" required style="resize:none;">
            ${data.editor }</textarea>
            <span id="messagebyte">0</span><span>/ 2000 Byte</span>
            <br />
            <input type="submit" name="name" id="submit" class="btn btn-outline-success" value="저장" >
        </form>
    </div>

<script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
	<script>
      ClassicEditor.create( document.querySelector( '#editor' ) );
    </script>
<style>
    .ck-editor__editable {
        height: 400px;
    }
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input{margin-bottom:15px;}
</style>
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
    <script>
    var limitByte = 2000;
    var totalByte = 0;

    function fn_chk_byte(obj) {
        totalByte = 0;
        var message = $(obj).val();

        for (var i = 0; i < message.length; i++) {
            var currentByte = message.charCodeAt(i);
            if (currentByte > 128) {
                totalByte += 2;
            } else {
                totalByte++;
            }
        }

        $("#messagebyte").text(totalByte);

        // 총 바이트 수가 제한을 초과하는지 확인
        if (totalByte > limitByte) {
            alert(limitByte + "Byte 까지 전송 가능합니다.");
            // 필요에 따라 여기에 추가 작업을 추가할 수 있습니다.
        }
    }

    function sms_send() {
        if (totalByte > limitByte) {
            alert(limitByte + "Byte 까지 전송 가능합니다.");
            return;
        }
    }

</script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<!-- Simplebar JS -->
	<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>
	
	<!-- Repeater JS -->
	<script src="${path}/resources/vendors/jquery.repeater/jquery.repeater.min.js"></script>

	<!-- Daterangepicker JS -->
    <script src="${path}/resources/vendors/moment/min/moment.min.js"></script>
    <script src="${path}/resources/vendors/daterangepicker/daterangepicker.js"></script>
    <script src="${path}/resources/js/daterangepicker-data.js"></script>
	
	<!-- Bootstrap Colorpicker JS -->
	<script src="${path}/resources/js/color-picker-data.js"></script>
	
	<!-- Tinymce JS -->
    <script src="${path}/resources/vendors/tinymce/tinymce.min.js"></script>
	
	<!-- Dropify JS -->
	<script src="${path}/resources/vendors/dropify/dist/js/dropify.min.js"></script>
	<script src="${path}/resources/js/dropify-data.js"></script>

	<!-- Init JS -->
	<script src="${path}/resources/js/create-invoice-data.js"></script>
	

<script>
$(function() {	
	$('.dropify-2').dropify({
		  messages: {
			'default': '파일 업로드',
		},
		tpl: {
			message:'<div class="dropify-message"><span class="file-icon"></span> <p>{{ default }}</p></div>',
		}
	});
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
