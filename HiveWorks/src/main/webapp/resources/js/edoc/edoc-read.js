$('#btn_approval').on('click',(e)=>{
    $('#form_approval').submit();
});

$('#form_approval').on('submit',(e)=>{
    e.preventDefault();
    
    const form = e.target
    
    const formData = new FormData(form);
    const data = {};
    formData.forEach((value,key)=>{data[key]=value});

    console.log(data);

    fetch(form.action,{
        method:form.method,
        headers:{
            'Content-Type':'application/json'},
        body:JSON.stringify(data)
    }).then((response)=>{
        if(response.status != 200) throw new Error(response.status);
        return response.json();
    }).then((data)=>{
        if(data.status != 200){
            console.log(data.error);
            alert(data.error);
        }else{
            console.log(data);
            alert("결재 처리 되었습니다.");
            location.reload();
        }
    });
});