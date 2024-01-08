/* 조직도 관리 js code */
function deptsearch() {
    $('#jstree').jstree(true).search($("#schName").val());
}

$.jstree.defaults.core.themes.variant = "large";

function getJson(){
	$.ajax({
		type:'GET',
		url:path+'/deptlist',
		dataType:'JSON',
		success: function(data){
			var deptlist = new Array();
			$.each(data, function(idx, item){
				//id, parent, text는 jstree에서 지정된 키값으로 그대로 쓴다.
				deptlist[idx]={id:item.deptCode, parent:item.deptUpstair, text:item.deptName};
			});
			
			//서버에서 department테이블 불러와서 조직도로 구현
			$('#jstree').jstree({
				//js트리에서 사용할 plugin들 넣어주기
				'plugins':['types','search','contextmenu','dnd','sort'],
				'core':{
					'data':deptlist,
					'check_callback': function(operation,node,node_parent,node_position,more){	
						if(operation==='create_node'||operation==='move_node'){
							if(node_parent.id==='#'){
								return false;
							}
						}
						return true;
					}
				},
				//우클릭하면 나오는 메뉴 설정
				'contextmenu': {
					'items': function(node) {
						return {
							"Create": {
							    "label": "새 하위부서 생성",
							    "action": function (data) {
							        var inst = $.jstree.reference(data.reference),
							        obj = inst.get_node(data.reference);
							        
							        //생성과 동시에 이름 변경할 수 있게 함.
							        inst.create_node(obj, {}, "last", function (new_node) {
							            setTimeout(function(){ inst.edit(new_node); },0);

							            //이름 변경이 완료되면 ajax로 data보내는 이벤트
							            $('#jstree').one('rename_node.jstree', function (e, data) {
							                var parentNode = inst.get_parent(new_node);

							                $.ajax({
							                    type: 'POST',
							                    url: path+'/insertdept',
							                    data: JSON.stringify({
							                        'deptName': data.text,
							                        'deptUpstair': parentNode
							                    }),
							                    contentType:'application/json',
							                    dataType:'json',
							                    success: function(response) {
							                        inst.set_id(new_node, response.deptCode);
							                        alert('부서 생성 성공');
							                        location.reload();
							                    },
							                    error: function(error) {
							                        alert('부서 생성 실패');
							                        inst.refresh();
							                    }
							                });
							                //rename메뉴쪽 이벤트와 충돌할수 있기때문에 이벤트 해제코드 넣어둠.
							                $('#jstree').off('rename_node.jstree');
							            });
							        });
							    }
							},
							"Rename": {
								"label": "부서명 변경",
								"action": function (data) {
									
									var inst = $.jstree.reference(data.reference),
									obj = inst.get_node(data.reference);
									inst.edit(obj);
									$('#jstree').one('rename_node.jstree',function(e,data){
										var code = data.node.id;
										var upstair = data.node.parent;
										var name = data.node.text;
										
										$.ajax({
											type:'POST',
											url: path+'/updatedept',
											data: JSON.stringify({
												'deptCode':code,
												'deptUpstair':upstair,
												'deptName':name
											}),
											contentType:'application/json',
											dataType:'json',
											success:function(response){
												if(response.status==='success'){
													alert('부서명 변경 성공');
													
												}else{
													alert('부서명 변경 실패');
													inst.refresh(); //변경시도 전 상태로 새로고침
												}
											},
											error: function(){
												alert('부서명 변경실패');
												inst.refresh();
											}
										});
									});
								}
							},
							"Remove": {
							    "label": "부서 삭제",
							    "action": function (data) {
							        var inst = $.jstree.reference(data.reference),
							        obj = inst.get_node(data.reference);
							        var deptCode = obj.id; //부서 코드
							        
							     	// 루트 부서 삭제 방지 로직
								    if(deptCode === 'DEP001') {
								        alert('최상위부서는 삭제할 수 없습니다');
								        return; // 함수를 여기서 종료
								    }
							        
							        var deptUpstair = obj.parent; //상위 부서 코드
							        var deptName = obj.text; //부서 이름
							        
							        // 하위 부서 코드 가져오기
							        var children = Array.from(inst.get_children_dom(obj)).map(function(child) {
									    return inst.get_node(child).id; // 객체 전체가 아닌 id만 추출
									});

							        // 확인 창
							        var result = confirm('이 부서의 하위부서들까지 함께 삭제됩니다. 정말 삭제하시겠습니까?');
							        if(result) { //확인을 눌렀을 때만 삭제 로직 실행
							        	var sendData = {
							                    'deptCode': deptCode,
							                    'deptUpstair': deptUpstair,
							                    'deptName': deptName,
							                    'children': children //하위 부서 정보도 같이 전송
							                };
							        	
							            $.ajax({
							                type: 'POST',
							                url: path+'/deletedept', //부서 삭제 요청을 처리하는 서버 URL
							                data: JSON.stringify(sendData),
							                contentType: 'application/json',
							                dataType: 'json',
							                success: function(response) {
							                    if(response.status==='success'){
							                        alert('부서 삭제 성공');
							                        inst.delete_node(obj); //서버에서 삭제 성공했을 때만 노드를 삭제
							                        location.reload();
							                    } else {
							                        alert('부서 삭제 실패');
							                    }
							                },
							                error: function(){
							                    alert('부서 삭제 실패');
							                }
							            });
							        }
                                }
                            }
                        }
                    }
				},
				
				'types':{
					'default':{
						'icon':'fa-solid fa-book-open-reader'
					}
				},
				//노드 정렬 설정
				'sort':function(a,b){
					var a1 = this.get_node(a);
					var b1 = this.get_node(b);
					return a1.text > b1.text ? 1:-1;
				}
			}).on('ready.jstree', function() {
			    $(this).jstree('open_all');	//항상 노드 전체 오픈
			});
			
			//드래그&드롭 부서이동 설정
			$('#jstree').on('move_node.jstree', function(e, data) {
			    var deptCode = data.node.id; // 이동된 노드
			    var newParent = data.parent; // 노드의 새 부모의 id
			    var deptName = data.node.text;
		    	var hasChildren = data.node.children && data.node.children.length>0 ; //하위 부서가 있는지 확인
				
		    	//하위부서 확인창
					var result = confirm('하위 부서가 존재하는 경우 하위부서들까지 함께 이동됩니다.\n정말 이동하시겠습니까?');
			        if(result) {
		
					    // 서버에 전달할 데이터 객체를 생성
					    var sendData = {
					        'deptCode': deptCode,
					        'deptUpstair': newParent,
					        'deptName': deptName
					    };
		
					    // 서버에 데이터를 전송
					    $.ajax({
					        type: 'POST',
					        url: path+'/updatedept', 
					        data: JSON.stringify(sendData),
					        contentType: 'application/json',
					        dataType: 'json',
					        success: function(response) {
					            if(response.status==='success'){
					                alert('부서 이동 성공');
					                location.reload();
					            } else {
					                alert('부서 이동 실패');
					                $('#jstree').jstree(true).refresh();
					            }
					        },
					        error: function(){
					            alert('부서 이동 실패');
					            $('#jstree').jstree(true).refresh();
					        }
					    });
			        }else{
			        	$('#jstree').jstree(true).refresh();  //사용자가 확인창에서 취소를 누른경우, 화면 새로고침
			        	return;
			        }
		    	
			});
		},
		error:function(data){
			alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요");
		}
	});
	
}
	
$(document).ready(function(){
	getJson();
});