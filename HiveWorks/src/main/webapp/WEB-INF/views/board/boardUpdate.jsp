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
        <form id="userForm" name="boardUpdate" action="${path}/board/boardUpdate" method="post" enctype="multipart/form-data">
            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
            <input type="hidden" name="boardNo" value="${board.boardNo}"/>
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
            <span id="messagebyte">0</span><span>/ 2000 Byte</span>
            <br />
            <input type="submit" name="name" id="submit" class="btn btn-outline-success" value="저장" >
        	<input type="button" onclick="resetForm()" id="resetButton" value="초기화"/>
        </form>
    </div>

<style>
	.ck-editor__editable { 
	height: 800px; 
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
    
</style>
<script>
	function resetForm() {
		document.getElementById("userForm").reset();
		ckeditor.data.set('');
}
</script>
<script></script>
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
<!-- 에디터 -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>

<script type="text/javascript">
class ElectronicDocumentImageUploadAdapter{
	constructor(loader){
		this.loader = loader;
	}
	// Starts the upload process.
    upload() {
        return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
                this._initRequest();
                this._initListeners( resolve, reject, file );
                this._sendRequest( file );
            } ) );
    }

    // Aborts the upload process.
    abort() {
        if ( this.xhr ) {
            this.xhr.abort();
        }
    }

    // Initializes the XMLHttpRequest object using the URL passed to the constructor.
    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();

        // Note that your request may look different. It is up to you and your editor
        // integration to choose the right communication channel. This example uses
        // a POST request with JSON as a data structure but your configuration
        // could be different.
        xhr.open( 'POST', '${path}/board/imgupload', true );
        xhr.responseType = 'json';
    }

    // Initializes XMLHttpRequest listeners.
    _initListeners( resolve, reject, file ) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = `파일 업로드에 실패했습니다.:${ file.name }`;

        xhr.addEventListener( 'error', () => reject( genericErrorText ) );
        xhr.addEventListener( 'abort', () => reject() );
        xhr.addEventListener( 'load', () => {
            const response = xhr.response;

            // This example assumes the XHR server's "response" object will come with
            // an "error" which has its own "message" that can be passed to reject()
            // in the upload promise.
            //
            // Your integration may handle upload errors in a different way so make sure
            // it is done properly. The reject() function must be called when the upload fails.
            if ( !response || response.error ) {
                return reject( response && response.error ? response.error.message : genericErrorText );
            }

            // If the upload is successful, resolve the upload promise with an object containing
            // at least the "default" URL, pointing to the image on the server.
            // This URL will be used to display the image in the content. Learn more in the
            // UploadAdapter#upload documentation.
            resolve( {
                default: response.url
            } );
        } );

        // Upload progress when it is supported. The file loader has the #uploadTotal and #uploaded
        // properties which are used e.g. to display the upload progress bar in the editor
        // user interface.
        if ( xhr.upload ) {
            xhr.upload.addEventListener( 'progress', evt => {
                if ( evt.lengthComputable ) {
                    loader.uploadTotal = evt.total;
                    loader.uploaded = evt.loaded;
                }
            } );
        }
    }

    // Prepares the data and sends the request.
    _sendRequest( file ) {
        // Prepare the form data.
        const data = new FormData();

        data.append( 'upload', file );

        // Important note: This is the right place to implement security mechanisms
        // like authentication and CSRF protection. For instance, you can use
        // XMLHttpRequest.setRequestHeader() to set the request headers containing
        // the CSRF token generated earlier by your application.

        // Send the request.
        this.xhr.send( data );
    }
}

function ElectronicDocumentImageUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        // Configure the URL to the upload script in your back-end here!
        return new ElectronicDocumentImageUploadAdapter( loader );
    };
}
</script>

<script>
	let ckeditor;
    ClassicEditor.create(document.querySelector('#editor'),{
    	extraPlugins :[ElectronicDocumentImageUploadAdapterPlugin]
    })
    .then(editor => {  
        editor.model.document.on('change:data', () => {
            const content = editor.getData(); // 에디터 내용 가져오기
            const byteCount = new Blob([content], { type: 'text/plain' }).size; // 바이트 수 계산
            document.getElementById('messagebyte').textContent = byteCount; // 바이트 수 업데이트
        });
        ckeditor = editor;
    });
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
