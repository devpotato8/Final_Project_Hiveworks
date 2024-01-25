const updateAutograph = (isChanged)=>{
    
    let targetAuto = null;

    if(isChanged){
        targetAuto = document.querySelector('#changeAutograph').files[0];
    }

    const formData = new FormData();

    formData.append('autograph', targetAuto);

    fetch(contextPath+'/edoc/autoupload',{
        method:'POST',
        body: formData
    }).then((response)=>{
        if(response.status != 200) throw new Error(response.status);
        return response.json();
    }).then((data)=>{
        $('#currentAuto').attr('src',data.url);
        alert('정상적으로 변경되었습니다.');

    }).catch((error)=>{
        console.log(error);
        alert(error);
    })
}

$('#setAutographBtn').on('click',()=>{updateAutograph(true)});
$('#setDefaultBtn').on('click',()=>{updateAutograph(false)});

$('#changeAutograph').on('change',(e)=>{
    const imgTag = $('#targetAuto');
    const target = e.target.files[0];

    const reader = new FileReader();
    reader.onload = (e)=>{
        imgTag.attr('src',e.target.result);
    }
    reader.readAsDataURL(target);
});