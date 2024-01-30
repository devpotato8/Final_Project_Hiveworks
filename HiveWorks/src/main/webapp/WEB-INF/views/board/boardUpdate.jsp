<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="hk-pg-wrapper" style=" height: 1685px;">
    <div class="container-xxl" >
        <h2 id="Title">수정</h2>
    </div>
    <div id="board-container">
        <form id="userForm" name="boardFrm" action="${path }/board/boardUpdate" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardType" value="${board.boardType}" /> 
		<div style="margin-left: 40px;">
            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
            <input type="hidden" name="boardNo" value="${board.boardNo}"/>            
            <br>   
        </div>    
            <br>
             <textarea class="form-control" id="editor" value="${data.editor }" name="boardContent" placeholder="내용을입력해주세요" required style="resize:none;">
            ${board.boardContent}</textarea>
          <div class="topicon">
            <div class="input-group mb-3" style="padding:0px;margin-left:40px;">
            	<div class="messagebyte"><span id="messagebyte">0</span><span>/ 2000 Byte</span></div>
  				<div class="input-group mb-3" style="padding:0px;">
				    <div class="input-group-prepend" style="padding:0px;">
				        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder-plus" onclick="fn_addFileForm();">
				            <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
				            <line x1="12" y1="11" x2="12" y2="17"></line>
				            <line x1="9" y1="14" x2="15" y2="14"></line>
				        </svg>
				    </div>
				</div>
            </div>
            <div id="basicFileForm" class="input-group mb-3">
			  <div class="custom-file" style="display: flex; align-items: center; width:">
			    <input type="file" name="upFile" class="custom-file-input">
			    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle" onclick="fn_deleteFileForm();">
			        <circle cx="12" cy="12" r="10"></circle>
			        <line x1="15" y1="9" x2="9" y2="15"></line>
			        <line x1="9" y1="9" x2="15" y2="15"></line>
			    </svg>
			</div>
			</div>
		</div>									
         <div class="bottomicon">
            <br />
            <input type="submit" name="name" id="submit" class="button" value="등록" >
        	<input type="button" onclick="resetForm()" id="resetButton" class="button" value="초기화" style="width:60px; margin-left:0px;'"/>
        </div>
			<div class="plusicon"></div>
        </form>
    </div>
</div>
<style>
	#Title{
	 margin-top: 50px;
	}
	hr{
	width:1200px;
	}
	.ck.ck-editor{
	width: 1200px;
	margin-left:40px;
	}
	.ck-editor__editable { 
	width: 1200px;
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
    .ck-content .image img{
    	width:500px;
    	hiight:500px;
    }
    #boardType{
    width:150px;
    }
    #boardTitle{
    width:300px;
    }
    #basicFileForm{
    margin-left:40px;
    }
    .bottomicon{
    position: absolute; 
    right: 245px;
    }
      .input-group-prepend {
        position: relative;
    }

    .input-group-prepend::after {
        content: "파일 추가";
        position: absolute;
        top: 0;
        left: 100%;
        padding: 0.5rem;
        background-color: transparent;
        border: none;
        white-space: nowrap;
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s, opacity 0.3s;
    }

    .input-group-prepend:hover::after {
        visibility: visible;
        opacity: 1;
    }
    .custom-file-input{
    width:250px;
    }
    #userForm{   
    margin-left: 145px; 
    height: 1300px;
    margin-top: 60px;
    
    }
    .messagebyte{
  	 margin-left:1100px;
    }
    .button {
    width: 50px;
    height: 40px;
    background-color: #fff; 
    color: #000; 
    border-radius: 5px;
    font-size: 16px;
    line-height: 16px;
    text-transform: uppercase;
    padding: 5px;
    margin-bottom: 20px;
    margin-left: 30px;
    display: inline-block;
    vertical-align: middle;
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    box-shadow: 0 0 1px rgba(0, 0, 0, 0);
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    -moz-osx-font-smoothing: grayscale;
    position: relative;
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: transform;
    transition-property: transform;
    text-decoration: none;
}

.button:before {
    pointer-events: none;
    position: absolute;
    z-index: -1;
    content: '';
    top: 100%;
    left: 5%;
    height: 10px;
    width: 90%;
    opacity: 0;
    background: -webkit-radial-gradient(center, ellipse, rgba(0, 0, 0, 0.35) 0%, rgba(0, 0, 0, 0) 80%);
    background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.35) 0%, rgba(0, 0, 0, 0) 80%);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: transform, opacity;
    transition-property: transform, opacity;
}

.button:hover,
.button:focus,
.button:active {
    -webkit-transform: translateY(-5px);
    transform: translateY(-5px);
    color: #000; /* hover 시 글자색을 검정색으로 변경 */
}

.button:hover:before,
.button:focus:before,
.button:active:before {
    opacity: 1;
    -webkit-transform: translateY(5px);
    transform: translateY(5px);
}
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 페이지가 로드될 때 실행되는 함수

        // boardType 매개변수를 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const boardTypeParam = urlParams.get('boardType');

        // 게시판 선택(select) 요소
        const boardTypeSelect = document.getElementById('boardType');

        // 매개변수에 따라 옵션 선택하기
        if (boardTypeParam === 'BRD001') {
            // BRD001이면 공지사항 선택
            boardTypeSelect.value = 'BRD001';
        } else if (boardTypeParam === 'BRD002') {
            // BRD002이면 건의사항 선택
            boardTypeSelect.value = 'BRD002';
        }

        // 선택되지 않은 옵션 숨김 처리
        const options = boardTypeSelect.options;
        for (let i = 0; i < options.length; i++) {
            if (options[i].value !== boardTypeSelect.value) {
                options[i].hidden = true;
            }
        }
    });
</script>

<script>
	function resetForm() {
		document.getElementById("userForm").reset();
		ckeditor.data.set('');
}
</script>
<script></script>
<script>
const adddelFunction = (function () {
    let count = 2;
    const addFile = () => {
        if (count <= 3) {
            const fileForm = $("#basicFileForm").clone(true);
            fileForm.find("span.input-group-text").text("첨부파일 " + count);
            fileForm.find("label.custom-file-label").text("파일을 선택하세요")
                .attr("for", "upFile" + count);
            fileForm.find("input[type=file]").attr("id", "upFile" + count).val("");
            
            // 새 파일 양식을 추가할 목적지 요소를 지정합니다 (예: "bottomicon" 클래스가 지정된 div 아래에 추가)
            $(".plusicon").append(fileForm);
            
            count++;
        } else {
            alert("첨부파일은 3개까지 가능합니다.");
        }
    };

    const delFile = () => {
        if (count != 2) {
            // 삭제할 파일 양식이 있는 목적지 요소를 지정합니다 (예: "bottomicon" 클래스가 지정된 div 내에서 위치)
            $(".plusicon").find("#basicFileForm:last-child").remove();
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