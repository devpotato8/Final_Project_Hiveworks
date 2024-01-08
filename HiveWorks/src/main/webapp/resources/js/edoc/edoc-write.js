/**
 * 전자문서 기안페이지에서 사용하는 JS 모음
 * 작성자 : 이재연
 */

 $('#edocType').on('change',(e)=>{
	const $format = $('#edocFormat');
	fetch(path+"/edoc/formatList?edocDotCode="+e.target.value)
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
	})
	.catch(e=>{
		alert(e);
		console.log(e);
	});
});

$('#edocFormat').on('change',(e)=>{
	let processContinue = confirm('작성중인 내용이 전부 사라질 수 있습니다. 진행하시겠습니까?');
	const $editable = $('#content');
	const edocFormatNo = e.target.value;
	if(processContinue){
		fetch(path+"/edoc/formatData?formatNo="+edocFormatNo)
		.then(response=>{
			if(response.status != 200) throw new Error(response.status)
			return response.json();
		})
		.then(data=>{
			console.log(data);
			document.getElementById('content').ckeditorInstance.data.set(data.sampleContent);
		})
		.catch(e=>{
				alert(e);
				console.log(e);
			})
	}
});

$('#submitButton').on('click',()=>{
	const edoc  = {
				edocTitle : $('#edocTitle').val(),
				edocDotCode : $('#edocType').val(),
				edocDsgCode : $('#edocDsgCode').val(),
				creater : $('#edocCreter').val(),
				period : $('#period').val(),
				edocContent : $('#content').html()
			};
	fetch(path+'/edoc/write',{
		method : 'post',
		headers: {
      		"Content-Type": "application/json",
    	},
    	body : JSON.stringify(edoc)
	})
	.then(response =>{
		if(response.status != 200) throw new Error(response.status);
		return response.json();
	})
	.then(data=>{
		alert('문서가 정상적으로 기안되었습니다.\n문서번호 : '+data.edocNo);
		location.replace(path+"/edoc/lists/process");
	})
	.catch(e=>{
		alert(e);
		console.log(e);
	})
});
