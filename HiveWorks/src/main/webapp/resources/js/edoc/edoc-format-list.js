// 테이블에 DataTable 적용하기
const dataTable = $('#docTable').DataTable( {
	scrollX:  true,
	autoWidth: false,
	language: { search: "",
		searchPlaceholder: "Search",
		sLengthMenu: "_MENU_items",
		paginate: {
			next: '', // or '→'
			previous: '' // or '←' 
		},
        columns:[
            {data:'seq'},
            {data:'dotCode'},
            {data:'name'},
            {data:'createDate'},
            {data:'desc'},
            {data:'action'}
        ]
	},
	"drawCallback": function () {
		$('.dataTables_paginate > .pagination').addClass('custom-pagination pagination-simple');
	}
});

// 양식 생성 버튼 클릭 했을 때
$('#btnFormatWrite').on('click',()=>{
    location.href = contextPath+'/edoc/format/write';
});


// 양식 복사 버튼 클릭 했을 때
$(document).on('click','Button.btn-format-copy', (e)=>{
    
    e.stopPropagation();

    const target = e.target.closest('tr');
    const formatNo = target.dataset.sampleno;

    const formData = new FormData();

    formData.append('sampleNo',formatNo);

    fetch(contextPath+'/edoc/format/copy',{
        method : 'POST',
        body : formData
    }).then(response=>{
        if(response.status != 200) throw new Error(response.status);
        return response.json();
    }).then(data=>{
        if(data.status != 200) throw new Error(data.error);
        alert('정상적으로 복사 되었습니다.');

        dataTable.row.add([
            data.data.dotCodeName,
            data.data.sampleName,
            data.data.createDate,
            data.data.sampleDesc,
            '<button type="button" class="btn btn-outline-secondary btn-icon btn-format-copy" title="양식복사"><span class="zmdi-icon"><i class="zmdi zmdi-collection-item"></i></span></button> <button type="button" class="btn btn-outline-secondary btn-icon btn-format-delete" title="양식삭제"><span class="zmdi-icon"><i class="zmdi zmdi-delete"></i></span></button>'
        ]).draw();
        document.querySelectorAll('#docTable tbody tr').forEach((v)=>{if(v.dataset.sampleno == null){v.dataset.sampleno = data.data.sampleNo}});
    }).catch(e=>{
        alert(e);
        console.log(e);
    })
});

// 양식 삭제 버튼 클릭 했을 때
$(document).on('click','Button.btn-format-delete', (e)=>{
    
    e.stopPropagation();

    const target = e.target.closest('tr');
    const formatNo = target.dataset.sampleno;

    const formData = new FormData();

    formData.append('sampleNo',formatNo);

    fetch(contextPath+'/edoc/format/delete',{
        method : 'DELETE',
        body : formData
    }).then(response=>{
        if(response.status != 200) throw new Error(response.status);
        return response.json();
    }).then(data=>{
        if(data.status != 200) throw new Error(data.error);
        alert('정상적으로 삭제 되었습니다.');
        dataTable.row('[data-sampleno="'+formatNo+'"]').remove().draw();
    }).catch(e=>{
        alert(e);
        console.log(e);
    })

});

// 테이블의 행 클릭시 해당 양식으로 연결
$(document).on('click','#docTable tbody tr', (e)=>{
    
    e.stopPropagation();

    const target = e.currentTarget;
    const formatNo = target.dataset.sampleno;

    location.assign(contextPath+'/edoc/format/view?formatNo='+formatNo);
});
