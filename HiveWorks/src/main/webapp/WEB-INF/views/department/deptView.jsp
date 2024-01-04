<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
</jsp:include>

<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

<!-- Main Content -->
<div class="hk-pg-wrapper" style="margin-left:300px;">
	<div class="container-xxl">
		
	<!-- Page Header -->
	<div class="hk-pg-header pg-header-wth-tab pt-7">
		<div class="d-flex">
			<div class="flex-1">
				<h1 class="pg-title">조직 관리</h1>
				<br>
				<p class="p-lg col-lg-8">조직도로 부서관리를 하거나, 구성원들을 관리할 수 있습니다</p>
			</div>
		</div>
		<ul class="nav nav-line nav-light nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-bs-toggle="tab" href="#tab_block_1">
					<span class="nav-link-text">조직도 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-bs-toggle="tab" href="#tab_block_2">
					<span class="nav-link-text">구성원 관리</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- /Page Header -->

	<!-- Page Body -->
	<div class="hk-pg-body">
		<div class="tab-content">
			<!-- 조직도관리 -->
			<div class="tab-pane fade show active" id="tab_block_1">
				<div class="row">
					<div class="col-xl-10">
						
						<h3><b>조직도</b></h3>
						<p class="mt-3">부서 추가,수정,삭제 등 변경사항은 즉시 적용됩니다. 작성에 주의하세요</p>
						<div class="text-first mt-3">
							<input type="text" id="schName" value="" class="mb-4">
	    					<button class="btn btn-primary btn-sm" onclick="deptsearch()">검색</button>
	    				</div>
						

			<div id="jstree"></div>
		
						
						<div class="text-end mt-5">
							<button class="btn btn-primary">부서 일괄 등록</button>
						</div>
					
					</div>
				</div>	
			</div>
			<!-- /조직도 관리 -->
			
			
			<div class="tab-pane fade" id="tab_block_2">
				<div class="row">
					<div class="col-md-8">
						<div class="title-lg fs-5"><span>Social profile links</span></div>
						<p class="mb-4">Connect your social media accounts for one-click sharing.</p>
						<form>
							<div class="form-group">
								<label class="form-label">Facebook</label>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="${path}resources/img/symbol-avatar-17.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8" placeholder="Username" value="Hencework">
										<a href="#" class="input-suffix text-muted"><span class="feather-icon"><i data-feather="edit-3"></i></span></a>
									</span>
								</div>
								<small class="form-text text-muted">
									One-click sign in
								</small>
							</div>
							<div class="form-group">
								<label class="form-label">Twitter</label>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="${path}resources/img/symbol-avatar-18.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8" placeholder="Username">
										<a href="#" class="input-suffix text-muted"><span class="feather-icon"><i data-feather="edit-3"></i></span></a>
									</span>
								</div>
								<small class="form-text text-muted">
									One-click sign in
								</small>
							</div>
							<div class="form-group mb-5">
								<label class="form-label">Linkedin</label>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="${path}resources/img/symbol-avatar-19.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8" placeholder="Username">
										<a href="#" class="input-suffix text-muted"><span class="feather-icon"><i data-feather="edit-3"></i></span></a>
									</span>
								</div>
								<div class="form-check form-check-sm mt-2">
									<input type="checkbox" class="form-check-input" id="customCheckList4" checked>
									<label class="form-check-label" for="customCheckList4">
										This is a company account
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">Connect</label>
								<div class="input-group mb-3">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="${path}resources/img/symbol-avatar-6.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8 pe-15" placeholder="Behance">
										<span class="input-suffix"><button class="btn btn-sm btn-outline-primary">
											connect
										</button></span>
									</span>
								</div>
								<div class="input-group">
									<span class="input-affix-wrapper">
										<span class="input-prefix">
											<span class="avatar avatar-logo avatar-xs">
												<span class="initial-wrap">
													<img src="${path}resources/img/symbol-avatar-5.png" alt="logo">
												</span>
											</span>
										</span>
										<input type="text" class="form-control form-control-lg ps-8 pe-15" placeholder="Dribbble">
										<span class="input-suffix"><button class="btn btn-sm btn-outline-primary">
											connect
										</button></span>
									</span>
								</div>
							</div>
						</form>
						<div class="text-end mt-6">
							<button class="btn btn-primary btn-rounded">
								Save changes
							</button>
						</div>
					</div>
				</div>	
			</div>
			</div>
		</div>
	</div>
	<!-- /Page Body -->		
</div>


	<!-- jQuery -->
    <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="${path}/resources/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

	<!-- Simplebar JS -->
	<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>

	<!-- Init JS -->
	<script src="${path}/resources/js/init.js"></script>
	<script src="${path}/resources/js/chips-init.js"></script>
	
	
	<!-- jstree -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js" integrity="sha512-ekwRoEshEqHU64D4luhOv/WNmhml94P8X5LnZd9FNOiOfSKgkY12cDFz3ZC6Ws+7wjMPQ4bPf94d+zZ3cOjlig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/themes/default/style.min.css" integrity="sha512-A5OJVuNqxRragmJeYTW19bnw9M2WyxoshScX/rGTgZYj5hRXuqwZ+1AVn2d6wYTZPzPXxDeAGlae0XwTQdXjQA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<script>
       
function deptsearch() {
    $('#jstree').jstree(true).search($("#schName").val());
}

$.jstree.defaults.core.themes.variant = "large";

function getJson(){
	$.ajax({
		type:'GET',
		url:'/deptlist',
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
							                    url: '/insertdept',
							                   
							                    data: JSON.stringify({
							                        'deptName': data.text,
							                        'deptUpstair': parentNode
							                    }),
							                    contentType:'application/json',
							                    dataType:'json',
							                    success: function(response) {
							                        inst.set_id(new_node, response.deptCode);
							                        alert('부서 생성 성공');
							                    },
							                    error: function(error) {
							                        alert('부서 생성 실패');
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
										var name = data.text;
										
										$.ajax({
											type:'POST',
											url: '/updatedept',
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
												}
											},
											error: function(){
												alert('부서명 변경실패');
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
							        	console.log(sendData);
							            $.ajax({
							                type: 'POST',
							                url: '/deletedept', //부서 삭제 요청을 처리하는 서버 URL
							                data: JSON.stringify(sendData),
							                contentType: 'application/json',
							                dataType: 'json',
							                success: function(response) {
							                    if(response.status==='success'){
							                        alert('부서 삭제 성공');
							                        inst.delete_node(obj); //서버에서 삭제 성공했을 때만 노드를 삭제
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
			
		},
		error:function(data){
			alert("조직도 구성에 실패하였습니다. 관리자에게 문의하세요");
		}
	});
	
}
	
$(document).ready(function(){
	getJson();
});



</script>
	