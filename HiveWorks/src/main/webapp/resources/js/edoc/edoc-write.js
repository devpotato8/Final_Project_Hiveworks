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


/*
 * 문서종류를 고르면 양식 목록을 가져오는 메소드
 */
let dotCode;
let formatNo;
 $('#edocType').on('change',(e)=>{
    let dotCodeValue = e.target.value;
	dotCode = dotCodeValue;
	formatNo = null;
	const $format = $('#edocFormat');
	fetch(contextPath+"/edoc/formatList?edocDotCode="+dotCodeValue)
	.then(response=>{
		if(response.status != 200) throw new Error(response.status);
		return response.json();
	})
	.then(result =>{
		$format.html("");
		$format.append($('<option disabled="disabled" selected="selected">').text('서식종류'));
		
		result.forEach((v,i)=>{
			$format.append($('<option>').val(v.sampleNo).text(v.sampleName));
		});

		// 문서종류가 연장근무 신청서라면
		if(dotCodeValue === 'DOT005'){
			let dateInfo = document.querySelector('#edocDate');
			if(dateInfo == null){
				dateInfo = $('<tr id="edocDate">')
					.append($('<th>').text('기간'))
					.append($('<td colspan="3">').append('<input class="form-control" type="text" id="dateTimePicker">'));

				$('#detail_table tbody').append(dateInfo);

				$('#dateTimePicker').daterangepicker({
					timePicker: true,
					timePicker24Hour: true,
					timePickerIncrement: 30,
					startDate: moment().startOf('hour'),
					endDate: moment().startOf('hour').add(30, 'minute'),
					"cancelClass": "btn-secondary",
					locale:{
						format: 'YYYY/MM/DD HH:mm'
					}
				});
			}
		}else{
			let dateInfo = document.querySelector('#edocDate');
			if(dateInfo != null){
				dateInfo.remove();
			}
		}
	})
	.catch(e=>{
		alert(e);
		console.log(e);
	});
});

/*
 * 문서 양식을 고르면 본문 내용을 양식 내용으로 치환하는 메소드
 */


$('#edocFormat').on('change',(e)=>{
	const edocFormatNo = e.target.value;
	const processContinue = confirm('작성중이던 내용이 사라질 수 있습니다.\n계속하시겠습니까?');
	if(processContinue){
		fetch(contextPath+"/edoc/formatData?formatNo="+edocFormatNo)
		.then(response=>{
			if(response.status != 200) throw new Error(response.status)
			return response.json();
		})
		.then(data=>{
			if(data.sampleFormat != null){
				document.getElementById('content').ckeditorInstance.data.set(data.sampleFormat);
			}
            formatNo = data.sampleNo;
		})
		.catch(e=>{
				alert(e);
				console.log(e);
			})
	}else{
		$('#edocFormat option:eq(0)').prop('selected',true);
		formatNo = '';
	}
});

function getDeptList(){
	let rootDeptCode;
	fetch(contextPath+'/deptlist')
	.then(response=>{
		if(response.status != 200) throw new Error(response.status)
		return response.json();
	})
	.then(data=>{
		var deptlist = new Array();
		$.each(data, function(idx, item){
			deptlist[idx]={id:item.deptCode, parent:item.deptUpstair, text:item.deptName};
			if(idx == 0) rootDeptCode = item.deptCode;
		});
		
		$('#deptTree').jstree({
			'plugins':['types','sort','search'],
			'core':{
				'data':deptlist,
				'check_callback': true
			},
			'types':{
				'default':{
					'icon':'fa-solid fa-book-open-reader'
				}
			}
		

		}).bind("select_node.jstree", function (e, data) {
			let nodeId = data.node.id;
			loadDeptEmpList(nodeId);
		}).on('ready.jstree', function() {
			    $(this).jstree('open_all');	//항상 노드 전체 오픈
				loadDeptEmpList(rootDeptCode);
		});
	})
	.catch(e=>{ alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요"); console.log(e);
	});
}
//선택된 부서의 구성원 목록을 가져오는 ajax함수
function loadDeptEmpList(nodeId) {
	fetch(contextPath+'/edoc/approvalList?deptCode='+nodeId)
	.then(response=>{
		if(response.status != 200) throw new Error(response.status)
		return response.json();
	})
	.then(data=>{
		let $employeeList = $('#employee-list');
		// 선택목록 내용 비우기
		$employeeList.empty();
		// 선택한 부서 사람으로 선택목록 채우기
		data.forEach((v)=>{
			const $option = $('<option>').val(v.empNo).text(v.name+' ('+v.dept+':'+v.position+')');
			$employeeList.append($option);
		});
	})
	.catch(e=>{
		alert("구성원 정보 로딩 실패. 관리자에게 문의하세요");
	});
}

// 부서원 전체 선택 버튼
$('#employeeSelectAllBtn').on('click',()=>{
    $('#employee-list').val($('#employee-list').find('option').map(function(){return $(this).val()}).get());
});

// 부서원 전체 선택 해제 버튼
$('#employeeDeselectAllBtn').on('click',()=>{
    $('#employee-list').val('');
})

const approvalList = [];
const referenceList = [];

const $approvalList = $('#approvalList');
const $referenceList = $('#referenceList');

const isExistInLists = (empNo)=>{
	const test1 = approvalList.some((e)=>e.aprvlEmpNo == empNo);
	const test2 = referenceList.some((e)=>e.refperEmpNo == empNo);
	return test1 || test2;
}

//현재 로그인 한 사람을 결재라인 처음에 추가
const fnAddApprovalListLoginEmp = (empNo, deptName, jobName, empName)=>{
	approvalList.push({aprvlEmpNo:empNo,aprvlApvCode:'APV001',aprvlStatus:'A',aprvlRank:1});
	$('<option>').val(empNo).text(empName+' ('+deptName+':'+jobName+')').attr('disabled','disabled').appendTo($approvalList);
}

const fnAddApprovalList = (empNo)=>{
	if($approvalList.length >6){
		alert('결재목록에는 6명까지만 가능합니다.');
	}else if(!isExistInLists(empNo)){
		$('#employee-list').find('option[value="'+empNo+'"]').clone().appendTo($approvalList);
		approvalList.push({aprvlEmpNo:empNo,aprvlApvCode:'APV000',aprvlStatus:'P',aprvlRank:1});
	}else{
		const emp = $('#employee-list').find('option[value="'+empNo+'"]').text();
		alert('이미 결재 혹은 참조 목록에 있는 사람입니다.\n'+emp);
	}
}

const fnDelApprovalList = (empNo)=>{
	approvalList.pop((e)=>e.aprvlEmpNo==empNo);
	$approvalList.find('option:selected').remove();
}

const fnAddreferenceList = (empNo)=>{
	if(!isExistInLists(empNo)){
		$('#employee-list').find('option[value="'+empNo+'"]').clone().appendTo($referenceList);
		referenceList.push({refperEmpNo:empNo,refperStatus:'N'});
	}else{
		const emp = $('#employee-list').find('option[value="'+empNo+'"]').text();
		alert('이미 결재 혹은 참조 목록에 있는 사람입니다.\n'+emp);
	}
}

const fnDelreferenceList = (empNo)=>{
	referenceList.pop((e)=>e.refperEmoNo==empNo);
	$referenceList.find('option:selected').remove();
}

$('#addApprovalList').on('click',(e)=>{
	$('#employee-list').val().forEach((v)=>{
		fnAddApprovalList(v);
	});
});
$('#removeApprovalList').on('click',(e)=>{
	$approvalList.val().forEach((v)=>{
		fnDelApprovalList(v);
	});
});
$('#addReferenceList').on('click',(e)=>{
	$('#employee-list').val().forEach((v)=>{
		fnAddreferenceList(v);
	});
});
$('#removeReferenceList').on('click',(e)=>{
	$referenceList.val().forEach((v)=>{
		fnDelreferenceList(v);
	});
});

/*
 * 기안하기 버튼을 눌렀을 때
 */

$('#submitButton').on('click',(e)=>{

	const $btn = e.target;

	$btn.disabled = true;
	$($btn).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>전송중');

	let formData;
	
	try{
		formData = dataProcess();
	}catch(e){
		alert(e);
		console.log(e);
		return;
	}

    // fetch로 전송
	fetch(contextPath+'/edoc/write',{
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
			alert('문서가 정상적으로 기안되었습니다.\n문서번호 : '+data.edocNo);
			location.replace(contextPath+"/edoc/lists/process");
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


// 데이터 처리해서 formData로 넘겨주는 함수
const dataProcess = ()=>{
	// form validate
	if(!formValidate()){
		throw new Error("폼이 유효하지 않음");
	}
	


	// 결재목록 처리
	for (let i = 1; i < approvalList.length; i++) {
		let element = approvalList[i];
		element.aprvlRank = i+1;
		if(i==1){
			element.aprvlStatus = 'W';
		}else{
			element.aprvlStatus = 'P';
		}
	}

    // 전자문서 객체 생성
	const edoc  = {
				edocTitle : $('#edocTitle').val(),
				edocDotCode : dotCode,
				edocSampleNo : formatNo,
				edocDsgCode : $('#edocDsgCode').val(),
				creater : $('#edocCreter').val(),
				period : $('#period').val(),
				edocContent : document.getElementById('content').ckeditorInstance.data.get(),
				approval: approvalList,
				reference: referenceList,
				edocSampleNo : formatNo
			};
	
	// 연장근무 신청서일경우 시작/종료일 처리
	let edocStartDate;
	let edocEndDate;
	if(dotCode == 'DOT005'){
		const dateValue = $('#dateTimePicker').val();
		edocStartDate = new Date(Date.parse(dateValue.substr(0,dateValue.indexOf('-'))));
		edocEndDate = new Date(Date.parse(dateValue.substr(dateValue.indexOf('-')+1)));
		edoc.edocStartDate = edocStartDate;
		edoc.edocEndDate = edocEndDate;
	}

	
	// 첨부파일 등록
	
	const fileList = document.querySelector('#file').files;
	
	const formData = new FormData();

	formData.append("edoc",JSON.stringify(edoc));

	if(fileList.length > 0){
		for(let i=0; i< fileList.length; i++){
			formData.append("uploadFiles",fileList[i]);
		}
	}

	return formData;
}

const formValidate = ()=>{
	//TODO 폼 데이터 확인
	return true;
};


// 인쇄 미리보기 버튼 눌렀을때 내용 가져오기
let printModal = document.getElementById('modal_print');
$('#printPreviewButton').on('click',(e)=>{
    const sampleNo = formatNo;
	if(sampleNo == null || sampleNo == 0 || sampleNo == ''){
		alert('서식이 선택되지 않았습니다.');
		return;
	}

	const previewModal = new bootstrap.Modal(printModal);
	previewModal.show();

    const formData = new FormData();
    formData.append('sampleNo',sampleNo);
    fetch(contextPath+'/edoc/printpreview',{
        method:'POST',
        body:formData
    }).then(response=>{
        if(response.status!=200) throw new Error(response.status);
        return response.json();
    }).then(data=>{
        if(data.status!=200) throw new Error(data.error);
		//모달 창 안에 서식을 불러오기
        $(printModal).find('.document-content .container').html(data.data);
		setTimeout(()=>{
		// 기안자 정보 등록
		// 기안자 이름
		let $createrName = document.querySelectorAll('.createrName');
		if($createrName.length >0){
			$createrName.forEach((v)=>{v.innerText = creater.createrName});
		}
		let $createrNo = document.querySelectorAll('.creater');
		if($createrNo.length >0){
			$createrNo.forEach((v)=>{v.innerText = creater.createrNo});
		}
		let $createrDeptName = document.querySelectorAll('.createrDeptName');
		if($createrDeptName.length >0){
			$createrDeptName.forEach((v)=>{v.innerText = creater.createrDept});
		}
		let $createrJobName = document.querySelectorAll('.createrPosCode');
		if($createrJobName.length >0){
			$createrJobName.forEach((v)=>{v.innerText = createrJob});
		}

		//기안날짜 등록
		//기안일자
		let $createDate = document.querySelectorAll('.createDate');
		if($createDate.length >0){
			let now = new Date();
			$createDate.forEach((v)=>{v.innerText = now.getFullYear()+'.'+now.getMonth()+'.'+now.getDate()})
		}
		//기안일시
		let $createDateTime = document.querySelectorAll('.createDateTime');
		if($createDateTime.length > 0){
			let now = new Date();
			$createDateTime.forEach((v)=>{v.innerText = now.getFullYear()+'.'+now.getMonth()+'.'+now.getDate()+' '+now.getHours()+':'+now.getMinutes()});
		}
		
		//제목
		let $title = document.querySelectorAll('.edocTitle');
		if($title.length > 0){
			$title.forEach((v)=>{v.innerText = $('#edocTitle').val()});
		}
		//날짜정보가져오기
		const dateTimePicker = $('#dateTimePicker');
		let dateValue;
		if(dateTimePicker != null){

		dateValue = $('#dateTimePicker').val();
		}
		if(dateValue != null && dateValue != ''){
			//시작날짜 등록
			//시작일자
			const startDate = new Date(Date.parse(dateValue.substr(0,dateValue.indexOf('-'))));
			let $startDate = document.querySelectorAll('.edocStartDate');
			if($startDate.length >0){
				$startDate.forEach((v)=>{v.innerText = startDate.getFullYear()+'.'+startDate.getMonth()+'.'+startDate.getDate()});
			}
			//시작일시
			let $startDateTime = document.querySelectorAll('.edocStartDateTime');
			if($startDateTime.length > 0){
				$startDateTime.forEach((v)=>{v.innerText = startDate.getFullYear()+'.'+startDate.getMonth()+'.'+startDate.getDate()+' '+startDate.getHours()+':'+startDate.getMinutes()});
			}
			//종료날짜 등록
			//종료일자
			const endDate = new Date(Date.parse(dateValue.substr(0,dateValue.indexOf('-'))));
			let $endDate = document.querySelectorAll('.edocEndDate');
			if($endDate.length >0){
				$endDate.forEach((v)=>{v.innerText = endDate.getFullYear()+'.'+endDate.getMonth()+'.'+endDate.getDate()});
			}
			//종료일시
			let $endDateTime = document.querySelectorAll('.edocEndDateTime');
			if($endDateTime.length > 0){
				$endDateTime.forEach((v)=>{v.innerText = endDate.getFullYear()+'.'+endDate.getMonth()+'.'+endDate.getDate()+' '+endDate.getHours()+':'+endDate.getMinutes()});
			}
		}
		// 결재선 등록
		let $aprvlList = document.querySelectorAll('figure.approval-container');
		let aprvlList = document.querySelector('#approvalList').children;
		if($aprvlList.length >0){
			let aprvlTable = '<table style="border:solid 1px black; border-collapse: collapse;"><tbody><tr>';
			aprvlList.forEach((v)=>{aprvlTable += '<td style="border:solid 1px black; border-collapse: collapse;">'+v.innerText.substr(0,v.innerText.indexOf('('))+'</td>'});
			aprvlTable +='</tr><tr>';
			aprvlList.forEach((v)=>{aprvlTable += '<td style="border:solid 1px black; border-collapse: collapse;"></td>'});
			aprvlTable +='</tr><tr>';
			aprvlList.forEach((v)=>{aprvlTable += '<td style="border:solid 1px black; border-collapse: collapse;"></td>'});
			aprvlTable +='</tr></tbody></table>';
			$aprvlList.forEach((v)=>{v.innerHTML = aprvlTable});
		}
		// 첨부파일 목록 등록
		let $attachList = document.querySelectorAll('ol.attach-file-container');
		let attachList = document.querySelector('#file').files;
		if($attachList.length >0 && attachList.length > 0){
			let attachLists = '';
			attachList.forEach((v)=>{attachLists += '<li>'+v.name+'</li>';});
			$attachList.forEach((v)=>{v.innerHTML = attachLists;});
		}
		// 상세내용 등록
		let $content = document.querySelectorAll('.document-content .edocContent');
		if($content.length > 0){
			$content.forEach((v)=>{v.innerHTML = ckeditor.data.get();});
		}
		},500);
    }).catch(e=>{
        console.log(e);
        alert(e);
    })
});