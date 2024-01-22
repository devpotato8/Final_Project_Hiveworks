/**
 * 전자문서 기안페이지에서 사용하는 JS 모음
 * 작성자 : 이재연
 */

/*
 * CKEditor에서 사용하는 이미지 업로드용 어댑터
 */
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
        xhr.open( 'POST', path+'/edoc/imgupload', true );
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

/*
 * 위에 설정한 이미지 업로드용 어댑터를 플러그인 화 하는 함수
 */
function ElectronicDocumentImageUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        // Configure the URL to the upload script in your back-end here!
        return new ElectronicDocumentImageUploadAdapter( loader );
    };
}
/*
 * CK Editer 초기화
 */
let ckeditor;
DecoupledEditor
.create( document.querySelector("#content"),{
	extraPlugins :[
        // 이미지 업로드용 어댑터 적용
        ElectronicDocumentImageUploadAdapterPlugin
        ]
    })
	.then( editor => {
        ckeditor = editor;
        const toolbarContainer = document.querySelector( '.editor-toolbar-container' );
        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
    })
    .catch( error => {
        console.error( error );
    });


let dotCode;

$('#docType').on('change',(e)=>{
    dotCode = e.target.value;
});

$('#submitButton').on('click',(e)=>{
    e.preventDefault();

    const $btn = e.target;

	$btn.disabled = true;
	$($btn).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>전송중');

	let formData;
    
	
	formData = dataProcess();
	

    // fetch로 전송
	fetch(path+'/edoc/format/write',{
		method : 'post',
    	body : formData
	})
	.then(response =>{
		if(response.status != 200) throw new Error(response.error);
		return response.json();
	})
	.then(data=>{
		if(data.status != 200){
			alert(data.status+"\n"+data.error);
			
		}else{
			alert('양식이 정상적으로 전송되었습니다.');
			location.replace(path+"/edoc/format/lists");
		}
	})
	.catch(e=>{
		alert(e);
		console.log(e);
	}).finally(()=>{
		$btn.disabled = false;
		$($btn).html('기안하기');
	});
});

const dataProcess = ()=>{
    
    let formData = new FormData();
    
    let sample = {
        sampleDotCode : dotCode,
        sampleName : $('#sampleName').val(),
        sampleDesc : $('#sampleDesc').val(),
        sampleContent : ckeditor.getData()
    }

    formData.append("sample",JSON.stringify(sample));
	
    return formData;

}