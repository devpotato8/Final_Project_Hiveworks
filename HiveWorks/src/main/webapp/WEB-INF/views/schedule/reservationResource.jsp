<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>

  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 부트스트랩CDN -->
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"
  ></script>
  <!-- 부트스트랩CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous"
  />
 
<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/>	
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<div class="hk-pg-wrapper pb-0">
			<div class="hk-pg-body py-0">
				<div class="blogapp-wrap">
					<nav class="blogapp-sidebar">
						<div data-simplebar class="nicescroll-bar">
							<div class="menu-content-wrap">
								<a href="add-new-post.html" class="btn btn-primary btn-rounded btn-block mb-4">
									Create Post
								</a>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item active">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="users"></i></span></span>
												<span class="nav-link-text">내 예약 현황</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="separator separator-light"></div>
								<div class="d-flex align-items-center justify-content-between mb-2">
									<div class="title-sm text-primary mb-0">전사자산</div>
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">본사4층회의실</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">본사5층회의실</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">빔프로젝터</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link link-badge-right" href="#">
												<span class="nav-link-text">차량예약</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="menu-gap"></div>
								<div class="nav-header">
									<span>관리자</span>
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">	
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="flag"></i></span></span>
												<span class="nav-link-text">전체 예약/대여 조회</span>
											</a>
										</li>
										
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="grid"></i></span></span>
												<span class="nav-link-text">전사자산 목록</span>
											</a>
										</li>
									</ul>
								</div>
								
		
				
					</nav>
					<div class="blogapp-content">
						<div class="blogapp-detail-wrap">
							<header class="blog-header">
								<div class="d-flex align-items-center">
									<a class="blogapp-title link-dark" href="#">
										<h1>자산 예약</h1>
									</a>
								</div>
								<div class="blog-options-wrap">	
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none" href="#"  data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Refresh"><span class="icon"><span class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
									<div class="v-separator  d-lg-inline-block d-none"></div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0  d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
										<span class="icon">
											<span class="feather-icon"><i data-feather="chevron-up"></i></span>
											<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
										</span>
									</a>
								</div>
								<div class="hk-sidebar-togglable"></div>
							</header>
							<div class="blog-body">
					  <!-- calendar 태그 -->
                      <div class="hk-pg-wrapper pb-0">
                        <div class="" style="display: flex;">
                            <div class="calendarapp-content" style="width: 50%; padding:30px;">
                                <div id="calendar" class="w-100"></div>
                            </div>
                            <div style="width: 50%; display: block;">
                                <form>
                       <!--              <div class="form-group">
                                        <select class="form-select">
                                            <option  selected="" value="1">가능 </option>
                                            <option value="2">Half Day</option>
                                            <option value="3">9 to 5</option>
                                        </select>
                                        </div> -->
                                        	<div class="row gx-3">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="form-label">시작일자</label> <input
													class="form-control cal-event-date-start" name="single-date" type="text" />
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="form-label">종료일자</label> <input
													class="form-control cal-event-date-end" name="single-date" type="text" />
											</div>
										</div>
									</div>
                                    <div class="form-group">
                                        <label class="form-label">참석자</label>
                                        <input class="form-control" type="text"/>
                                        <button type="button" class="btn btn-light btn-floating">추가</button>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                          알림여부
                                        </label>
                                </div>
                                 <button type="button" class="btn btn-secondary">취소</button>
					<button id="add_event" type="button" class="btn btn-primary fc-addEventButton-button">예약</button>
                        </form>
                    <table class="table">
                        <thead>
                            <tr>
                            <th scope="col">예약시각</th>
                            <th scope="col">예약자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <th scope="row">1</th>
                            <td>18:00~20:00</td>
                            <td>홍길동</td>
                            </tr>
                    </table>
                </div>
                    </div>
                    </div>
                    </div>
						
						<!-- Add Category -->
						<div id="add_new_cat" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Category</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<input class="form-control" type="text" placeholder="Category Name"/>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- /Add Category -->
						
						<!-- Add Tag -->
						<div id="add_new_tag" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Tag</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<select id="input_tags" class="form-control" multiple="multiple">
															<option selected="selected">Collaborator</option>
															<option selected="selected">Designer</option>
															<option selected="selected">React Developer</option>
															<option selected="selected">Promotion</option>
															<option selected="selected">Advertisement</option>
														</select>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Add Tag -->
					</div>
				</div>
			</div>
			<!-- /Page Body -->
		</div>
		<!-- /Main Content -->
	</div>
	  <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        googleCalendarApiKey: 'AIzaSyDTmzIpCFcBNK5_MAtLBPVD-j7O9mkXb_c',// 여기에 구글캘린더 api키 입력하시면 됩니다.
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        //데이터 가져오는 이벤트
        eventSources:[
          {
            events: async function (info, successCallback, failureCallback) {
          const eventResult = await axios({
            method: "POST",
            url: "/eventData",
          });
          const eventData = eventResult.data;
          //이벤트에 넣을 배열 선언하기
          const eventArray = [];
          eventData.forEach((res) => {
            eventArray.push({
              title: res.title,
              start: res.start,
              end: res.end,
              backgroundColor: res.backgroundColor,
            });
          });
          successCallback(eventArray);
        
        },
          },
            {
              googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com',
              backgroundColor: 'red',
            }
         ],
         eventClick: function(info){
            //클릭시 구글캘린더 url로 가는것을 막는다.
            info.jsEvent.stopPropagation();
            info.jsEvent.preventDefault();
         }
         });

      //모달창 이벤트
      $("#saveChanges").on("click", function () {
            var eventData = {
              title: $("#title").val(),
              start: $("#start").val(),
              end: $("#end").val(),
              color: $("#color").val(),
            };
            //빈값입력시 오류
            if (
              eventData.title == "" ||
              eventData.start == "" ||
              eventData.end == ""
            ) {
              alert("입력하지 않은 값이 있습니다.");

              //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
            } else if ($("#start").val() > $("#end").val()) {
              alert("시간을 잘못입력 하셨습니다.");
            } else {
              // 이벤트 추가
              calendar.addEvent(eventData);
              $("#exampleModal").modal("hide");
              $("#title").val("");
              $("#start").val("");
              $("#end").val("");
              $("#color").val("");
            }
          });
      // 캘린더 랜더링
      calendar.render();
    });
  })();

  //datepickcalendar
  $(document).ready(function() {
    calendarInit();
});
/*
    달력 렌더링 할 때 필요한 정보 목록 

    현재 월(초기값 : 현재 시간)
    금월 마지막일 날짜와 요일
    전월 마지막일 날짜와 요일
*/

function calendarInit() {

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
    // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar.innerHTML = '';
        
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate -1].classList.add('today');
        }
    }

    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<!-- Fancy Dropdown JS -->
<script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

<!-- Bootstrap Colorpicker JavaScript -->
<script src="${path}/resources/js/color-picker-data.js"></script>

<!-- Fullcalendar JS -->
<script src="${path}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${path}/resources/vendors/fullcalendar/index.global.min.js"></script>
<script
	src="${path}/resources/vendors/@fullcalendar/bootstrap5/index.global.min.js"></script>

<script
	src="${path}/resources/vendors/daterangepicker/daterangepicker.js"></script>
<script src="${path}/resources/js/daterangepicker-data.js"></script>
<script
	src="${path}/resources/vendors/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${path}/resources/js/fullcalendar-init.js"></script>

<!-- Bootstrap Notify JS -->
<script src="${path}/resources/js/bootstrap-notify.min.js"></script>