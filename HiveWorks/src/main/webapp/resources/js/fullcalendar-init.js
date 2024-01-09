/*Full Calendar Init*/
//Small Calendar
$('input[name="calendar"]').daterangepicker({
	singleDatePicker: true,
	showDropdowns: false,
	minYear: 1901,
	"cancelClass": "btn-secondary",
	autoApply: true,
	parentEl: "#inline_calendar",
});
/* Single Date*/
$('input[name="single-date-pick"]').daterangepicker({
	singleDatePicker: true,
	startDate: moment().startOf('hour'),
	showDropdowns: true,
	minYear: 1901,
	"cancelClass": "btn-secondary",
	locale: {
		format: 'YYYY-MM-DD'
	}
});
$('input[name="calendar"]').trigger("click");


var curYear = moment().format('YYYY'),
	curMonth = moment().format('MM');


document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar'),
		calendar = new FullCalendar.Calendar(calendarEl, {
			//googleCalendarApiKey: 'AIzaSyDTmzIpCFcBNK5_MAtLBPVD-j7O9mkXb_c',
			initialView: 'dayGridMonth',
			initialDate: curYear + '-' + curMonth + '-07',
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			themeSystem: 'bootstrap5',
			height: 'parent',
			navLinks: true,
			selectable: true, // 달력 일자 드래그 설정가능
			droppable: true,
			editable: true,
			locale: 'ko', // 한국어 설정
			select: function(selectionInfo) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
				$('#create_new_event').modal('show');
				
				var currentDate = new Date();
			    var currentHours = ('0' + currentDate.getHours()).slice(-2); // 시간을 두 자리 숫자로 설정
			    var currentMinutes = '00'; // 항상 00으로 설정
			    
			    var startTime = selectionInfo.startStr + ' ' + currentHours + ':' + currentMinutes;
			    
			    // 종료일자에서 하루를 빼기
			    var endDate = new Date(selectionInfo.endStr);
			    endDate.setDate(endDate.getDate() - 1);
			    var endYear = endDate.getFullYear();
			    var endMonth = ('0' + (endDate.getMonth() + 1)).slice(-2);
			    var endDay = ('0' + endDate.getDate()).slice(-2);
			    var endTime = endYear + '-' + endMonth + '-' + endDay + ' ' + currentHours + ':' + currentMinutes;
			    
			    $('.cal-event-date-start').val(startTime);
			    $('.cal-event-date-end').val(endTime);
			    
			    // 달력도 해당 날짜 시각으로 바꾸는 코드 추가
				$('.cal-event-date-start').daterangepicker({
				    timePicker: true,
				    singleDatePicker: true,
				    timePicker24Hour: true,
				    timePickerIncrement: 1,
				    startDate: startTime,
				    locale: {
				        format: 'YYYY/MM/DD HH:mm'
				    }
				});
				
				$('.cal-event-date-end').daterangepicker({
				    timePicker: true,
				    singleDatePicker: true,
				    timePicker24Hour: true,
				    timePickerIncrement: 1,
				    startDate: endTime,
				    locale: {
				        format: 'YYYY/MM/DD HH:mm'
				    }
				});
			    
			},
			events: function(info, successCallback, failureCallback) { // ajax 처리로 데이터를 로딩 시킨다. 
				$.ajax({
					url: `/schedule/schedulelistend.do`,
					type: "GET",
					dataType: "JSON",
					traditional: true,
					async: false, //동기
					success: function(data) {
						
						var events = data.map(function(event) {
							return {
								id: event.calNo,
								title: event.calSubject,
								start: event.calStartDate,
								end: event.calEndDate,
								backgroundColor: event.calColor,
								extendedProps: {
	                                content: event.calContent,   // 추가
	                                empName: event.calEmpName,// 추가
	                                calCode: event.calCode,//추가
	                                important: event.calImportYn,
	                                status: event.calStatus,
	                                reminder: event.reminderYn,
	                                allday: event.calAlldayYn
                              }

								
							};
						});
						successCallback(events); // 로드된 이벤트 데이터를 콜백으로 전달
						console.log(content);
							console.log(events);
						
						 
					},
					error: function(request, status, error) {
						alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
						console.log("code = " + request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			},

			eventContent: function(arg) {
				// 이벤트 컨텐츠를 커스텀하게 렌더링하고 싶을 때 사용
				if (arg.event.extendedProps.toHtml) {
					// 커스텀 HTML 렌더링 로직
				} else {
					return true; // 기본 렌더링
				}
			},

			eventClick: function(info) {
				// 이벤트 클릭 시 동작 정의
				targetE = info.event;
				
					function formatDate(date) {
						  var formattedDate = new Date(date);
						  var year = formattedDate.getFullYear();
						  var month = ("0" + (formattedDate.getMonth() + 1)).slice(-2);
						  var day = ("0" + formattedDate.getDate()).slice(-2);
						  var hours = ("0" + formattedDate.getHours()).slice(-2);
						  var minutes = ("0" + formattedDate.getMinutes()).slice(-2);
						  
						  return year + '/' + month + '/' + day + ' ' + hours + ':' + minutes;
							};
				
					//조회 부분
					$('#viewContainer').find('.event-start-date').text("시작 : "+formatDate(targetE.start));
					$('#viewContainer').find('.event-end-date').text("종료 : "+formatDate(targetE.end));
					var content = targetE.extendedProps.content || "내용이 없습니다.";
					$('#viewContainer').find('.event-content').html(content);
					var type = targetE.extendedProps.calCode;
					var typeval;
					switch(type) {
					    case 'CAL001':
					        typeval = "내일정";
					        break;
					    case 'CAL002':
					        typeval = "부서일정";
					        break;
					    case 'CAL003':
					        typeval = "전사일정";
					    default:
					        typeval = "미정인 일정";
					}
					
					$('#viewContainer').find('.event-code').html(typeval);
					
					var reminder = targetE.extendedProps.reminder;
					var reminderval;
					switch(reminder) {
					    case 'Y':
					        reminderval = "시작 30분전 알림 예정입니다";
					        break;
					    case 'N':
					        reminderval = "알림 예정이 없습니다";
					        break;
					}
					$('#viewContainer').find('.event-reminder').html(reminderval);
					
					
					//변경 부분
					//$('#modifyContainer').find('.event-start-date').val("시작 : "+formatDate(targetE.start));
					//$('#modifyContainer').find('.event-end-date').val("종료 : "+formatDate(targetE.end));
					$('#modifyContainer').find('.event-name').val(targetE.title);
					$('#modifyContainer').find('.event-content').val(targetE.extendedProps.content);
					$('#modifyContainer').find('.cal-event-code').val(targetE.extendedProps.calCode);
					switch(reminder) {
					    case 'Y':
					       $('#modifyContainer').find('.cal-event-reminder').prop('checked', true);
					        break;
					    case 'N':
					        $('#modifyContainer').find('.cal-event-reminder').prop('checked', false);
					        break;
					}
					
					
					var allday = targetE.extendedProps.calAlldayYn;
					switch(allday) {
					    case 'Y':
					       $('#modifyContainer').find('.cal-event-allday').prop('checked', true);
					        break;
					    case 'N':
					        $('#modifyContainer').find('.cal-event-allday').prop('checked', false);
					        break;
					}
					


					$('#modifyContainer').find('.cal-event-date-start').daterangepicker({
						timePicker: true,
					    singleDatePicker: true,
					    timePicker24Hour: true,
					    timePickerIncrement: 1,
					    startDate: targetE.start,
					    locale: {
					        format: 'YYYY/MM/DD HH:mm'
					    }
					});
						
						
					   
					
					$('#modifyContainer').find('.cal-event-date-end').daterangepicker({
					   timePicker: true,
					    singleDatePicker: true,
					    timePicker24Hour: true,
					    timePickerIncrement: 1,
					    startDate: targetE.end,
					    locale: {
					        format: 'YYYY/MM/DD HH:mm'
					    }
					});
					
					$('#alldayrecheck').on('click', function() {
				    var startPicker =  $('#modifyContainer').find('.cal-event-date-start').data('daterangepicker');
				    var endPicker = $('#modifyContainer').find('.cal-event-date-end').data('daterangepicker');
				
				    if ($(this).is(':checked')) {
				        console.log('종일여부 수정 체크됨');
				
				        var startDate = moment(startPicker.startDate);
				        startDate.set({ hour: 0, minute: 0, second: 0, millisecond: 0 });
				        startPicker.setStartDate(startDate);
				
				        var endDate = moment(endPicker.endDate);
				        endDate.set({ hour: 23, minute: 59, second: 59, millisecond: 999 });
				        endPicker.setEndDate(endDate);
				    
				    }
				});
				
				
					
					
					
					
					
					
					
					
		
					
					
					
				    
					
					
				
				// 모달 표시 또는 이벤트 상세 처리

    // 모달창 내의 요소에 이벤트의 내용을 채웁니다.
			}
		});
	calendar.render();

	
	var targetDrawer = '.hk-drawer.calendar-drawer',
		targetEvent;
	$(document).on("click", ".calendarapp-wrap .fc-daygrid-event", function(e) {
		console.log(this);
		$(targetDrawer).css({ "border": "none", "box-shadow": "0 8px 10px rgba(0, 0, 0, 0.1)" }).addClass('drawer-toggle');
		$('.calendar-drawer').find('.event-name').text($(this).text());
		return false;
	});
	/*Event Delete*/
	$(document).on("click", '#del_event', function(e) {
		$(this).closest('.hk-drawer').removeClass('drawer-toggle');
		Swal.fire({
			html:
				'<div class="mb-3"><i class="ri-delete-bin-6-line fs-5 text-danger"></i></div><h5 class="text-danger">Delete Note ?</h5><p>Deleting a note will permanently remove from your library.</p>',
			customClass: {
				confirmButton: 'btn btn-outline-secondary text-danger',
				cancelButton: 'btn btn-outline-secondary text-gray',
				container: 'swal2-has-bg',
				actions: 'w-100'
			},
			showCancelButton: true,
			buttonsStyling: false,
			confirmButtonText: 'Yes, Delete Note',
			cancelButtonText: 'No, Keep Note',
			reverseButtons: true,
		}).then((result) => {
			if (result.value) {
				targetEvent.remove();
				Swal.fire({
					html:
						'<div class="d-flex align-items-center"><i class="ri-delete-bin-5-fill me-2 fs-3 text-danger"></i><h5 class="text-danger mb-0">Event has been deleted!</h5></div>',
					timer: 2000,
					customClass: {
						content: 'p-0 text-left',
						actions: 'w-100 justify-content-start',
					},
					showConfirmButton: false,
					buttonsStyling: false,
				})
			}
		})
		return false;
	});
	/*Event Edit*/
	$(document).on("click", '#edit_event,.drawer-edit-close', function(e) {
		$(targetDrawer + '>div').toggleClass('d-none');
		return false;
	});
	/*Event Add*/
	$(document).on("click", "#add_event", function(e) {
		// 닫기 버튼 클래스 변경
		setTimeout(function() {
			$('.alert.alert-dismissible .close').addClass('btn-close').removeClass('close');
		}, 100);
		
		const empList = [];
		const count = $('.invitecontainer').length;
		console.log(count);
		
		for (let i = 1; i <= count; i++) {
		  const empValue = $('#calEmp' + i).val();
		  empList.push(empValue);
		}
					
		const addEvent = {
			title: $('.cal-event-name').val(),
			code: $('.cal-event-code').val(),
			empno: $('#cal-event-empno').val(),
			empList: empList, // empList를 addEvent 객체의 속성으로 추가
			backgroundColor: '',
			allday: $('.cal-event-allday').is(':checked') ? 'Y' : 'N',
			start: $('.cal-event-date-start').val(),
			end: $('.cal-event-date-end').val(),
			content: $('.cal-event-content').val(),
			reminder: $('.cal-event-reminder').is(':checked') ? 'Y' : 'N'
		};
		
		switch (addEvent.code) {
	    case 'CAL001':
	        addEvent.backgroundColor = '#FF1F1F';
	        break;
	    case 'CAL002':
	        addEvent.backgroundColor = '#00AD14';
	        break;
	    case 'CAL003':
	        addEvent.backgroundColor = '#000000';
	        break;
		};

		$.ajax({
			url: "/schedule/insertschedule.do",
			method: "POST",
			dataType: "json",
			data: JSON.stringify(addEvent),
			contentType: 'application/json',
		})
		.done(function(result) {
				alert("일정 등록 성공");
				calendar.addEvent(addEvent);
				// 일정을 등록한 후에 캘린더를 새로고침하지 않고 변경된 일정이 보이도록 처리합니다.
				calendar.refetchEvents();
			})
			.fail(function(request, status, error) {
				alert("일정 등록 실패" + error);
				console.log(error);
			});
		calender.unselect();
		
	});
});





/*Extra Costomization*/
setTimeout(function() {
	$('.fc-header-toolbar').append('<div class="hk-sidebar-togglable"></div>');
	$('.fc-toolbar-chunk:nth-child(3)').append('<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse"><span class="icon"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-up"><polyline points="18 15 12 9 6 15"></polyline></svg></span><span class="feather-icon d-none"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></span></span></a>');
	$('.fc-prev-button,.fc-next-button').addClass('btn-icon btn-flush-dark btn-rounded flush-soft-hover').find('.fa').addClass('icon');
	$('.fc-today-button').removeClass('btn-primary').addClass('btn-outline-light');
}, 120);
