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
        xhr.open( 'POST', contextPath+'/edoc/imgupload', true );
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

    if(dataValidate()){
        $btn.disabled = false;
		$($btn).html('기안하기');
        return;
    }


	let formData;
	formData = dataProcess();
	

    // fetch로 전송
	fetch(contextPath+'/edoc/format/write',{
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
			location.replace(contextPath+"/edoc/format/lists");
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
    let data = ckeditor.getData();
    let format;
    if(data.indexOf('{{서식시작}}') != -1 && data.indexOf('{{서식종료}}') != -1){
        
        let formatStart;
        let formatEnd;
        if(data.substr(data.indexOf('{{서식시작}}')-3,3) != '<p>'){
            formatStart = data.indexOf('{{서식시작}}');
        }else{
            formatStart = data.indexOf('{{서식시작}}')-3;
        }
        if(data.substr(data.indexOf('{{서식종료}}')+12,4) != '</p>'){
            formatEnd = data.indexOf('{{서식종료}}')+8;
        }else{
            formatEnd = data.indexOf('{{서식종료}}')+12;
        }

        format = data.substring(formatStart, formatEnd);
        data = data.replace(format, '{{상세내용}}');

        if(format.substr(0,15) == '<p>{{서식시작}}</p>'){
            format = format.substr(15);
        }else if(format.substr(0,12) == '{{서식시작}}</p>'){
            format = format.substr(8+4);
        }else if(format.substr(0,8) == '{{서식시작}}'){
            format = format.substr(8);
        }else{
            format = format.substr(format.indexOf('{{서식시작}}')+8);
        }
        if(format.substr(format.length-15) == '<p>{{서식종료}}</p>'){
            format = format.substr(0,format.length-15);
        }else if(format.substr(format.length-12) == '{{서식종료}}</p>'){
            format = format.substr(0,format.length-12);
        }else if(format.substr(format.length-8) == '{{서식종료}}'){
            format = format.substr(0,format.length-8);
        }else{
            format = format.substr(0,format.indexOf('{{서식종료}}'));
        }
    }

    let sample = {
        sampleDotCode : dotCode,
        sampleName : $('#sampleName').val(),
        sampleDesc : $('#sampleDesc').val(),
        sampleContent : data,
        sampleFormat : format
    }

    formData.append("sample",JSON.stringify(sample));
	
    return formData;

}
$('#helpButton').on('click',()=>{
    const helpWindow = window.open('','_blank','height=500, width=600, scrollbars=yes, toolbar=no, left=0, top=0');
    const $ul = $('<ul>');
    $ul.append($('<li>').text('{{문서번호}} : 해당위치에 문서 번호를 불러옴'));
    $ul.append($('<li>').text('{{제목}} : 해당위치에 문서 제목을 불러옴'));
    $ul.append($('<li>').text('{{기안자}} : 해당위치에 기안자 이름을 불러옴'));
    $ul.append($('<li>').text('{{기안일자}} : 해당위치에 기안일자(yyyy.MM.dd)를 불러옴'));
    $ul.append($('<li>').text('{{기안일시}} : 해당위치에 기안일시(yyyy.MM.dd hh:mm)를 불러옴'));
    $ul.append($('<li>').text('{{기안자사번}} : 해당위치에 기안자 사번을 불러옴'));
    $ul.append($('<li>').text('{{기안자부서}} : 해당위치에 기안자 부서이름을 불러옴'));
    $ul.append($('<li>').text('{{기안자직급}} : 해당위치에 기안자 직급을 불러옴'));
    $ul.append($('<li>').text('{{시작일자}} : 해당위치에 시작일자(yyyy.MM.dd)를 불러옴'));
    $ul.append($('<li>').text('{{시작일시}} : 해당위치에 시작일시(yyyy.MM.dd hh:mm)를 불러옴'));
    $ul.append($('<li>').text('{{종료일자}} : 해당위치에 종료일자(yyyy.MM.dd)를 불러옴'));
    $ul.append($('<li>').text('{{종료일시}} : 해당위치에 종료일시(yyyy.MM.dd hh:mm)를 불러옴'));
    $ul.append($('<li>').html('{{결재선}} : 해당위치에 결재선정보를 불러옴,<br>'
    +'결재정보는 정보당 1x3의 테이블로 구성되어있으며,'
    +'<br>위로부터 결재자 이름, 서명, 결재일 정보가 들어감'));
    $ul.append($('<li>').text('{{첨부목록}} : 해당위치에 첨부파일 목록을 불러옴'));
    $ul.append($('<li>').text('{{상세내용}} : 해당위치에 문서의 내용을 불러옴. 한 양식에 1번만 사용이가능하다.'));
    $ul.append($('<li>').html('{{서식시작}}, {{서식종료}} : {{서식시작}}과 {{서식종료}} 사이를 사용자가 입력할 수 있는 서식으로 제공함<br>'
    +'해당부분은 {{상세내용}}으로 자동으로 치환되며, {{상세내용}}과 동시에 사용이 불가능하다'));
    $(helpWindow.document.body).append($ul);
});

const dataValidate = ()=>{
    let results = [];
    if(dotCode == null){
        $('#docType').removeClass('is-valid');
        $('#docType').addClass('is-invalid');
        results.push(false);
    }else{
        $('#docType').removeClass('is-invalid');
        $('#docType').addClass('is-valid');
        results.push(true);
    }
    if($('#sampleName').val() == null || $('#sampleName').val() == ""){
        $('#sampleName').removeClass('is-valid');
        $('#sampleName').addClass('is-invalid');
        results.push(false);
    }else{
        $('#sampleName').removeClass('is-invalid');
        $('#sampleName').addClass('is-valid');
        results.push(true);
    }
    const sampleData = ckeditor.data.get();
    let isContainsDetail = sampleData.includes('{{상세내용}}');
    let isContainsSampleStart = sampleData.includes('{{서식시작}}');
    let isContainsSampleEnd = sampleData.includes('{{서식종료}}');
    if((isContainsDetail && isContainsSampleStart) || (isContainsDetail && isContainsSampleEnd)){
        alert('{{상세내용}}과 {{서식시작}} 혹은 {{서식종료}}는 \n 동시에 사용할 수 없습니다.');
        results.push(false);
    }else if((isContainsSampleStart && !isContainsSampleEnd) || (!isContainsSampleStart && isContainsSampleEnd)){
        alert('{{서식시작}}과 {{서식종료}}는 모두 작성하여야 합니다.');
        results.push(false);
    }else if(sampleData.indexOf('{{서식시작}}')>sampleData.indexOf('{{서식종료}}')){
        alert('{{서식시작}}이 {{서식종료}}보다 뒤에 위치할 수 없습니다.');
        results.push(false);
    }else if(!isContainsDetail && !isContainsSampleStart && !isContainsSampleEnd){
        alert('{{상세내용}} 혹은 {{서식시작}}{{서식종료}} 중 하나는 반드시 존재하여야 합니다.');
        results.push(false);
    }else{
        results.push(true);
    }
    return !results.includes(false);
};