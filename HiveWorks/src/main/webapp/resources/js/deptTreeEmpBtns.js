
/*<!-- 부서이동 버튼 이벤트 -->*/

$('.btn.deptMove').off('click').on('click', function() {
    var selectedIds = [];
    var selectedNames = [];
    var isLeader = false;
	
    // 체크박스가 선택된 row의 id를 가져옴
    $('input[name="chkRow"]:checked').each(function() {
        var id = $(this).closest('tr').find('td:nth-child(2)').text();
        var name = $(this).closest('tr').find('td:nth-child(3)').text();
        var leader = $(this).closest('tr').find('img').length > 0; // leader 정보 확인
        if (leader) {
            isLeader = true;
            return false; 
        }
        selectedIds.push(id);
        selectedNames.push(name);
    });

    // leader인 경우
    if (isLeader) {
        alert("조직장은 이동시킬 수 없습니다. 조직장 설정을 먼저 변경하세요.");
    }
    // 선택된 row가 없는 경우
    else if (selectedIds.length === 0) {
        alert("선택된 구성원이 없습니다.");
    } 
    // 그 외 경우, 모달창 띄우기
    else {
    	
    	$.ajax({
    		type:'GET',
    		url:'/deptlist',
    		dataType:'JSON',
    		success: function(response){
    			 // 가져온 부서 목록으로 select 요소의 option들 생성
    		    var options = response.map(function(dept) {
    		      return '<option value="' + dept.deptCode + '">' + dept.deptName + '</option>'; 
    		    });

    		    // select 요소에 option들 추가
    		    $('#deptSelect').html(options.join(''));
    		  },
    		  error: function(err) {
    		    console.error(err);
    		  }
   		});
    	
    	// 현재 소속 부서 이름 가져오기
        var deptName = $('.deptName').text(); // h5 태그의 텍스트 가져오기
        var currentDept = deptName.replace(" 구성원 목록", ""); // " 구성원 목록" 문자열 제거
     	
        // 모달창에 현재 소속 부서 표시
        $('#changeDept .modal-header .modal-title').text('선택된 구성원 ▶' + selectedNames.join(', '));
        $('.deptNow').text('현재 부서 ▶ '+ currentDept);
		
        // 모달창 표시
        $('#changeDept').modal('show');
    }
});

//모달창에서 변경사항 저장 버튼 클릭 이벤트
$('#changeDept').on('shown.bs.modal', function () {
	$('.deptChangeSaveBtn').off('click').on('click', function() {
	    var deptCode = $('#deptSelect').val(); // 선택된 부서 코드
	    var selectedIds = []; // 선택된 구성원 id 배열
	
	    // 체크박스가 선택된 row의 id를 가져옴
	    $('input[name="chkRow"]:checked').each(function() {
	        var id = $(this).closest('tr').find('td:nth-child(2)').text();
	        selectedIds.push(id);
	    });
		
	    // 서버로 전송
	    $.ajax({
	        type: 'POST',
	        url: '/changeEmpDept', 
	        traditional: true,
	        data: {
	            deptCode: deptCode,
	            empIds: selectedIds
	        },
	        success: function(response){
	        	if(response.status==='success'){
	            	alert('부서 이동이 성공적으로 처리되었습니다.');
	             	$('#changeDept').modal('hide'); // 모달창 닫기
	             	loadDeptEmpList(deptCode);
	        	}else if(response.status==='fail'){
	        		alert('부서 이동 실패. 다시 시도해주세요.');
	        	}
	        },
	        error: function(err) {
	            alert('서버 통신 실패. 관리자에게 문의해주세요.');
	        }
	    });
	});
});


//전역변수 설정 (조직장 설정 관련)

//체크된 row와 이전 조직장 row의 정보를 담을 객체
var leaderData = {
    newLeader: null,
    oldLeader: null
};
//현재 열려있는 부서 코드
var deptCode ='';

/*<!-- 조직장 설정 버튼 이벤트-->*/
    $('.setLeaderBtn').on('click', function() {
    	// 체크된 row수 확인
    	var checkedRows = $('.deptTable tbody tr').filter(function() {
	        return $(this).find('input[type="checkbox"]').is(':checked');
	    });

	    if (checkedRows.length > 1) {
	        alert('조직장 설정은 한 명만 가능합니다.\n다시 확인하시고 선택해주세요');
	        return;
	    }else if (checkedRows.length === 0) {
	        alert("선택된 구성원이 없습니다.");
	        return;
	    } 

    // 체크된 row 정보 가져오기
	    $('.deptTable tbody tr').each(function() {
	    	var $row = $(this);
	        if ($row.find('input[type="checkbox"]').is(':checked')) {
	            leaderData.newLeader = {
	                id: $row.find('td:nth-child(2)').text(),
	                name: $row.find('td:nth-child(3)').text()
	            };
	        }
	        
	    });

    // 이전 조직장 row 정보 가져오기
	    $('.deptTable tbody tr').each(function() {
	    	var $row = $(this);
	        if ($row.find('img').length > 0) {
	            leaderData.oldLeader = {
	                id: $row.find('td:nth-child(2)').text(),
	                name: $row.find('td:nth-child(3)').text()
	            }; 
	        
	        }        
	    });
    
	 // 체크된 사람이 이미 조직장인지 확인
	    if (leaderData.oldLeader !== null && leaderData.newLeader.id === leaderData.oldLeader.id) {
		    alert('이미 조직장으로 설정되어 있습니다.');
		    return;
		}
    
    // 이전 조직장이 emp001이라면 불가능
	    if(leaderData.oldLeader !== null && leaderData.oldLeader.id === 'emp001') {
		    alert('최고 레벨 조직장이 존재하고 있어 변경할 수 없습니다.');
		    return;
		}
    
	// 현재 소속 부서 code 가져오기
	    $('.deptTable tbody tr').each(function() {
	        var $row = $(this);
	        if ($row.find('input[type="checkbox"]').is(':checked')) {
	           deptCode = $row.find('td:nth-child(6)').text();
	        };
	    });
    
    // 현재 소속 부서 이름 가져오기
    var deptName = $('.deptName').text(); // h5 태그의 텍스트 가져오기
    var currentDept = deptName.replace(" 구성원 목록", ""); // " 구성원 목록" 문자열 제거

    // 모달창에 현재 소속 부서 표시
    $('#leaderOn .modal-body').text('선택된 구성원 ▶ ' + leaderData.newLeader.name + '(을)를 ' + currentDept + ' 조직장으로 설정합니까?');

    // 모달창 표시
    $('#leaderOn').modal('show');
    
});

// 부서장 설정 modal창에서 확인버튼 클릭 이벤트
$('.deptLeaderOn').on('click', function() {
	
	// oldLeaderId와 newLeaderId를 String 형태로 추출
    var oldLeaderId = leaderData.oldLeader ? leaderData.oldLeader.id : null;
    var newLeaderId = leaderData.newLeader ? leaderData.newLeader.id : null;
    
	// 서버로 정보 전송
    $.ajax({
        type: 'POST',
        url: '/setleader',
        data: JSON.stringify({oldLeaderId: oldLeaderId, newLeaderId: newLeaderId}),
        contentType: 'application/json',
        success: function(response) {
            // 성공 시 처리
            if(response.status==='success'){
            	alert('조직장 설정이 완료되었습니다.');
            	$('#leaderOn').modal('hide'); // 모달창 닫기
           		loadDeptEmpList(deptCode);
            }else if(response.status==='fail'){
            	alert('조직장 설정에 실패하였습니다. 다시 시도해주세요.')
            }
            
        },
        error: function() {
        	console.error()
            // 실패 시 처리
            alert('서버 통신 실패. 관리자에게 문의하세요.');
        }
    });
});



/*<!-- 조직장 해제 버튼 이벤트 -->*/
var selectedPerson;
var currentLeader;
var deptCode2;
$('.removeLeaderBtn').on('click', function() {
    // 체크된 row수 확인
    var checkedRows = $('.deptTable tbody tr').filter(function() {
        return $(this).find('input[type="checkbox"]').is(':checked');
    });

    if (checkedRows.length > 1) {
        alert('조직장 해제는 한 명만 가능합니다.\n다시 확인하시고 선택해주세요');
        return;
    }else if (checkedRows.length === 0) {
        alert("선택된 구성원이 없습니다.");
        return;
    } 

    // 체크된 row 정보 가져오기
    $('.deptTable tbody tr').each(function() {
        var $row = $(this);
        if ($row.find('input[type="checkbox"]').is(':checked')) {
        	selectedPerson = {
                id: $row.find('td:nth-child(2)').text(),
                name: $row.find('td:nth-child(3)').text()
            };
        }
       
    });

    // 이전 조직장 row 정보 가져오기
    $('.deptTable tbody tr').each(function() {
        var $row = $(this);
        if ($row.find('img').length > 0) {
        	currentLeader = {
                id: $row.find('td:nth-child(2)').text(),
                name: $row.find('td:nth-child(3)').text()
            };
        }
        
    });

    // 체크된 사람이 조직장이 아닌지 확인
    if (selectedPerson.id !== currentLeader.id) {
        alert('선택한 사람은 조직장이 아닙니다.');
        return;
    }

    // 최고 레벨 조직장(emp001)은 해제 불가능
    if(currentLeader.id === 'emp001') {
        alert('최고 레벨 조직장은 해제할 수 없습니다.');
        return;
    }
    
 	// 현재 소속 부서 code 가져오기
    $('.deptTable tbody tr').each(function() {
        var $row = $(this);
        if ($row.find('input[type="checkbox"]').is(':checked')) {
           deptCode2 = $row.find('td:nth-child(6)').text();
        };
    });

    // 모달창에 현재 선택된 사람 표시
    $('#leaderOff .modal-body').text('선택된 조직장 ▶ ' + selectedPerson.name + '을(를) 조직장에서 해제합니까?');

    // 모달창 표시
    $('#leaderOff').modal('show');

});

// 조직장 해제 modal창에서 확인버튼 클릭 이벤트
$('.deptLeaderOff').on('click', function() {
    
    // 서버로 정보 전송
    $.ajax({
        type: 'POST',
        url: '/removeleader',
        data: {id: selectedPerson.id},
        contentType:'application/x-www-form-urlencoded; charset=UTF-8',
        success: function(response) {
            // 성공 시 처리
            if(response.status==='success'){
            	 alert('조직장 해제가 완료되었습니다.');
                 $('#leaderOff').modal('hide'); // 모달창 닫기
                 loadDeptEmpList(deptCode2);
        	}else if(response.status==='fail'){
        		alert('조직장 해제에 실패했습니다. 다시 시도해주세요.');
        	}
        },
        error: function() {
            // 실패 시 처리
            alert('서버 통신 오류. 관리자에게 문의하세요.');
        }
    });
});



/*<!-- 소속제외 버튼 클릭 이벤트 -->*/
var deptCode3;
$('.deptOutBtn').on('click', function() {
    var selectedPeople = [];
    var selectedNames = [];
    var leaderExists = false;
    $('.deptTable tbody tr').each(function() {
        var $row = $(this);
        if ($row.find('input[type="checkbox"]').is(':checked')) {
            selectedPeople.push($row.find('td:nth-child(2)').text()); // id
            selectedNames.push($row.find('td:nth-child(3)').text()); // 이름
            if ($row.find('td:nth-child(4)').text() == 'Y') { // 조직장 여부
                leaderExists = true;
            }
        }
    });
    
    var checkedRows = $('.deptTable tbody tr').filter(function() {
        return $(this).find('input[type="checkbox"]').is(':checked');
    });
    
    if (checkedRows.length === 0) {
        alert("선택된 구성원이 없습니다.");
        return;
    } 

    if (leaderExists) {
        alert('조직장은 소속제외 할 수 없습니다. 다시 선택해주세요.');
        return;
    }
 	// 현재 소속 부서 code 가져오기
    $('.deptTable tbody tr').each(function() {
        var $row = $(this);
        if ($row.find('input[type="checkbox"]').is(':checked')) {
           deptCode3 = $row.find('td:nth-child(6)').text();
        };
    });

    $('#deptOut').modal('show'); // 모달창 띄우기
    $('#deptOut .modal-body').text('선택된 구성원 ▶ '+ selectedNames.join(', ')+ ' 정말로 소속제외 시킬까요?');
    
    $('#deptOut .confirmBtn').on('click', function() {
        $('#deptOut').modal('hide'); // 모달창 닫기
        $.ajax({
            type: 'POST',
            url: '/deptout',
            data: JSON.stringify(selectedPeople),
            contentType: 'application/json',
            success: function(response) {
            	if(response.status==='success'){
                	alert('소속 제외가 완료되었습니다.');
                	loadDeptEmpList(deptCode3);
            	}else if(response.status==='fail'){
            		alert('소속 제외에 실패했습니다. 다시 시도해주세요.');
            	}
            },
            error: function() {
                alert('서버 통신 실패. 다시 시도해주세요.');
            }
        });
    });
});


/*<!-- 직원 검색창 실시간 결과 ajax -->*/
var empNo;
var isLeader;
var empId;
$(document).ready(function(){
    var ajaxRequest = false;
    var currentSelection = -1;
    var maxSelection = 0;  // 초기값을 0으로 설정합니다.
	
    $('#searchEmp').keyup(function(e){
        var searchText = $(this).val();

        // 방향키나 엔터키가 눌린 경우에는 검색을 수행하지 않습니다.
        if (e.which === 38 || e.which === 40 || e.which === 13) {
            return;
        }

        // 입력창 비워주기
        $('.autocomplete-dropdown').remove();
        currentSelection = -1;  // 검색 결과가 바뀔 때마다 선택 항목을 초기화합니다.

        // 입력창이 비어있지 않을 때만 ajax요청
        if(searchText !== '' && !ajaxRequest){
            ajaxRequest=true;
            $.ajax({
                type:'GET',
                url:'/searchEmp',
                data:{ name : searchText },
                dataType:'JSON',
                success: function(response){
                    ajaxRequest=false;
                    var searchResult= $('<ul class="autocomplete-dropdown">');
                    maxSelection = response.length;  // 검색 결과의 개수를 저장합니다.

                    $.each(response, function(index, employee){
                        listItem = $('<li class="autocomplete-dropdown-item">'+ employee.dept_name +' '+ employee.emp_name + ' ' + employee.position_name + '</li>');
                        listItem.data('empName', employee.emp_name); // 직원 이름만 저장
                        listItem.data('deptName', employee.dept_name);  // 직원 부서 저장
                        listItem.data('deptCode', employee.dept_code);  // 직원 부서 코드 저장
                        listItem.data('empNo', employee.emp_no);  // 직원 번호 저장
                        listItem.data('isLeader', employee.dept_leader); //조직장여부 저장
                        listItem.data('empId',employee.emp_id); // 직원 아이디 저장
                        
                        listItem.click(function() {
                            $('#searchEmp').val($(this).data('empName'));  // 클릭 시 직원 이름만 입력창에 반영
                            empNo=$(this).data('empNo');
                            empId=$(this).data('empId');
                            isLeader=$(this).data('isLeader');
                            $(this).remove(); // 선택한 항목 제거
                            if ($('.autocomplete-dropdown').children().length == 0) { // 모든 항목이 제거되었으면 dropdown도 제거
                                $('.autocomplete-dropdown').remove();
                            }
                        });

                        searchResult.append(listItem);
                    });

                    $('#searchEmp').after(searchResult);
                },
                error: function(){
                    ajaxRequest=false;
                    alert("직원 검색 실패. 관리자에게 문의하세요.")
                }
            });
        }
    });

    // 방향키와 엔터키 처리
    $('#searchEmp').keydown(function(e) {
        switch(e.which) {
            case 38: // 위쪽 방향키
                $('.autocomplete-dropdown-item').removeClass('selected');
                if (currentSelection > 0) {
                    currentSelection--;
                }
                $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').addClass('selected');
                break;
            case 40: // 아래쪽 방향키
                $('.autocomplete-dropdown-item').removeClass('selected');
                if (currentSelection < maxSelection - 1) {
                    currentSelection++;
                }
                $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').addClass('selected');
                break;
            case 13: // 엔터키
                if (currentSelection > -1) {
                	var text = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('empName');
                	empNo = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('empNo');
                	isLeader = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('isLeader');
                	empId = $('.autocomplete-dropdown-item:eq(' + currentSelection + ')').data('empId');
                    $('#searchEmp').val(text);
                    $('.autocomplete-dropdown').remove();  // 선택 후에는 목록을 제거합니다.
                }
                currentSelection = -1;
                break;
        }
    });
	//검색결과 외부에 다른 곳을 클릭하면 검색결과창 사라지게
    $(document).click(function(e) {
        if (!$(e.target).closest('#searchEmp, .autocomplete-dropdown').length) {
            $('.autocomplete-dropdown').remove();
        }
    });
});

//구성원 추가 버튼 클릭시 이벤트
var deptCode4;
$('.addEmpDeptBtn').click(function(){
	//현재 테이블의 dept_code
	$('.deptTable tbody tr').each(function() {
        var $row = $(this);
        deptCode4 = $row.find('td:nth-child(6)').text();
    }); 
	
	//부서선택하지 않고 누르면 alert후 종료
	if(!deptCode4||deptCode4.trim()===''){
		alert('부서를 먼저 조직도에서 선택하세요.');
		return;
	}
		
	var empName = $('#searchEmp').val();
	
	//검색어가 없으면 alert후 종료
	if (!empName || empName.trim() === "") {
        alert('검색할 직원을 먼저 입력하세요.');
        return;
    }
	
	//검색된 사람이 조직장이거나 emp001이면 alert후 종료
	if (empId==='emp001' || isLeader==='Y'){
		alert('조직장이거나 최고 레벨 구성원인 사람은 추가할 수 없습니다.')
		return;
	}
	
	$.ajax({
		url: '/addEmpDept',
		type:'POST',
		contentType:'application/json',
		data: JSON.stringify({
			'dept_code': deptCode4,
			'emp_name': empName,
			'emp_no': empNo
		}),
		success: function(response){
			
			if(response.status==='success'){
				
				var deptName = $('.deptName').text(); // h5 태그의 텍스트 가져오기
			    var currentDept = deptName.replace(" 구성원 목록", ""); // " 구성원 목록" 문자열 제거
			    
				alert(empName+'을(를) '+currentDept+'의 구성원으로 추가하였습니다.');
				loadDeptEmpList(deptCode4);
				
			}else if(response.status==='fail'){
				alert('구성원 추가에 실패하였습니다. 관리자에게 문의하세요.');
			}
		},
		error: function(error){
			alert('서버 통신오류. 관리자에게 문의하세요.');
		}
	});
});
