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
			googleCalendarApiKey: 'AIzaSyDTmzIpCFcBNK5_MAtLBPVD-j7O9mkXb_c',
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
				/*$('.form-control cal-event-date-start').val(selectionInfo.startStr);*/

			},
			events: function(info, successCallback, failureCallback) { // ajax 처리로 데이터를 로딩 시킨다. 
				$.ajax({
					url: `/schedule/schedulelistend.do`,
					type: "GET",
					dataType: "JSON",
					traditional: true,
					async: false, //동기
					success: function(data) {
						// data를 사용하여 이벤트 객체 배열을 생성
						var events = data.map(function(event) {
							return {
								title: event.calSubject,
								start: event.calStartDate,
								end: event.calEndDate,
								backgroundColor: event.calColor,
								content: event.calContent
							};
						});
						successCallback(events); // 로드된 이벤트 데이터를 콜백으로 전달
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
				targetEvent = info.event;
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
		const addEvent = {
			backgroundColor: $('.cal-event-color').val(),
			title: $('.cal-event-name').val(),
			code: $('.cal-event-code').val(),
			allday: $('.cal-event-allday').is(':checked') ? 'Y' : 'N',
			start: $('.cal-event-date-start').val(),
			end: $('.cal-event-date-end').val(),
			content: $('.cal-event-content').val(),
			reminder: $('.cal-event-reminder').is(':checked') ? 'Y' : 'N'
		};


		//var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
		/*
					var events = new Array(); // Json 데이터를 받기 위한 배열 선언
					for (var i = 0; i < allEvent.length; i++) {
						var obj = new Object();     // Json 을 담기 위해 Object 선언
						// alert(allEvent[i]._def.title); // 이벤트 명칭 알람
						obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
						obj.start = allEvent[i]._instance.range.start; // 시작
						obj.end = allEvent[i]._instance.range.end; // 끝
		
						events.push(obj);
					}
					var jsondata = JSON.stringify(events);
					console.log(jsondata);*/
		// saveData(jsondata);

		$.ajax({
			url: "/schedule/insertschedule.do",
			method: "POST",
			dataType: "json",
			data: JSON.stringify(addEvent),
			contentType: 'application/json',
		})
			.done(function(result) {
				// alert(result);
				calendar.addEvent(addEvent);
			})
			.fail(function(request, status, error) {
				alert("에러 발생" + error);
				console.log(error);
			});
		calender.unselect();
		$.notify({
			icon: 'ri-checkbox-line mr-5',
			message: "이벤트가 등록되었습니다",
		}, {
			type: "dismissible alert alert-inv alert-inv-primary",
			placement: {
				from: "bottom",
				align: "center"
			},
			animate: {
				enter: 'animated fadeInUp',
				exit: 'animated fadeOutUp'
			},
			delay: 1000,
		});
		
		//return false;
		$('.cal-event-name').val("");
		$('.cal-event-date-start').val("");
		$('.cal-event-date-end').val("");
		$('.cal-event-content').val("");

	});
});





/*Extra Costomization*/
setTimeout(function() {
	$('.fc-header-toolbar').append('<div class="hk-sidebar-togglable"></div>');
	$('.fc-toolbar-chunk:nth-child(3)').append('<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse"><span class="icon"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-up"><polyline points="18 15 12 9 6 15"></polyline></svg></span><span class="feather-icon d-none"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></span></span></a>');
	$('.fc-prev-button,.fc-next-button').addClass('btn-icon btn-flush-dark btn-rounded flush-soft-hover').find('.fa').addClass('icon');
	$('.fc-today-button').removeClass('btn-primary').addClass('btn-outline-light');
}, 120);
