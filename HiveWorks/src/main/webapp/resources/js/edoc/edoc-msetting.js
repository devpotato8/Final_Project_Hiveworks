$('#saveBtn').on('click',()=>{
    const formData = new FormData();
    formData.append('edocPrefix',$('#edocPrefix').val());
    formData.append('edocDateFormat',$('input[name="edocDateFormat"]:checked').val());
    formData.append('edocNumFormat',$('input[name="edocNumFormat"]:checked').val());
    $('select').each((i,v)=>{
        formData.append($(v).attr('name'),$(v).val());
    });

    fetch(contextPath+'/edoc/managerSetting',{
        method:'POST',
        body:formData
    }).then((response)=>{
        if(response.status != 200) throw new Error(response.status);
        return response.json();
    }).then((data)=>{
        if(data.status != 200) throw new Error(data.error);
        alert(data.data);
    }).catch((e)=>{
        alert(e);
        console.log(e);
    });
    

});

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
$('#edocPrefix').on('change',()=>{changeEdocNumber()});
$('input[name="edocDateFormat"]').on('change',()=>{changeEdocNumber()});
$('input[name="edocNumFormat"]').on('change',()=>{changeEdocNumber()});

$(function(){
    changeEdocNumber();
})

const changeEdocNumber = ()=>{
    const prefix = $('#edocPrefix').val();
    const dateFormat = $('input[name="edocDateFormat"]:checked').val();
    const numFormat = $('input[name="edocNumFormat"]:checked').val();
    $('#edocResult').val(prefix+'-'+dateString(dateFormat, new Date())+'-'+lpad(1,numFormat,0));
}

const dateString = (dateFormat,date)=>{
    let str = '';
    switch(dateFormat){
        case 'YYYYMMDD' : str = ''+date.getFullYear()+lpad(date.getMonth()+1,2,0)+date.getDate();
            break;
        case 'YYMMDD' : str = (''+date.getFullYear()).substring(2)+lpad(date.getMonth()+1,2,0)+date.getDate();
            break;
        case 'YYYYMM' : str = ''+date.getFullYear()+lpad(date.getMonth()+1,2,0);
            break;
        case 'YYMM' : str = (''+date.getFullYear()).substring(2)+lpad(date.getMonth()+1,2,0)
            break;
        case 'YYYY' : str = ''+date.getFullYear();
            break;
        case 'YY' : str = (''+date.getFullYear()).substring(2);
            break;
    }
    return str;
}

const lpad = (str, length, padstr)=>{
    if(padstr.length >=length){
        return str;
    }
    str += '';
    padstr += '';

    while(str.length < length){
        str = padstr + str;
    }
    str = str.length >= length ? str.substr(0,length) : str;
    return str;
}