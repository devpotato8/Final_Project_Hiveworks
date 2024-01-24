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

// 인쇄 미리보기 버튼 눌렀을때 내용 가져오기
let printModal = document.getElementById('modal_print');
$(printModal).on('show.bs.modal',(e)=>{
    const edocNo = document.getElementById('document').dataset.edocNo;
    const formData = new FormData();
    formData.append('edocNo',edocNo);
    fetch(path+'/edoc/print',{
        method:'POST',
        body:formData
    }).then(response=>{
        if(response.status!=200) throw new Error(response.status);
        return response.json();
    }).then(data=>{
        if(data.status!=200) throw new Error(data.error);
        $(printModal).find('.document-content .container').html(data.data);
    }).catch(e=>{
        console.log(e);
        alert(e);
    })
});

// 인쇄버튼 눌렀을 때 로직
$('#printButton').on('click',(e)=>{
    const html = document.querySelector('html');
    const printContent = document.querySelector('#modal_print .document-content').innerHTML;
    const printDiv = document.createElement('DIV');

    printDiv.className = 'document-content';
    printDiv.innerHTML = printContent;
    
    html.appendChild(printDiv);
    document.body.style.display = 'none';

    setTimeout(()=>{
        window.print();
        document.body.style.display = 'block';
        printDiv.remove();
    },500);

});
