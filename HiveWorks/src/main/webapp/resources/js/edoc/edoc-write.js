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
			$format.append($('<option>').val(i.sampleNo).text(i.sampleName));
		});
	})
	.catch(e=>{
		alert(e);
		console.log(e);
	});
});

$('#edocFormat').on('change',(e)=>{
	
});
