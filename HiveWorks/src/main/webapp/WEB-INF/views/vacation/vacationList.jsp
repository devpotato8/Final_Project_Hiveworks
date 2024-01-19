<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <jsp:include page= "/WEB-INF/views/common/header.jsp"/> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="collapsed" name="style" />
	<jsp:param value="data-hover='active'" name="hover" />
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
   <jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<div class="hk-pg-wrapper">
	<div class="container-xxl">
		<!-- Page Header -->
		<div class="hk-pg-header pg-header-wth-tab pt-7">
			<div class="d-flex">
				<div class="d-flex flex-wrap justify-content-between flex-1">
					<div class="mb-lg-0 mb-2 me-8 d-flex justify-content-between">
						<h1 class="pg-title">휴가신청 - ${loginEmp.emp_name }님</h1>
					</div>
					<div><h1 class="pg-title"> 잔여연차 수 ${leftVacation }</h1></div>
				</div>
			</div>
		</div>
		<!-- /Page Header -->
		<section>
					<div class="container-fluid">
						<div class="row justify-content-center ">
							<div class="col-md-8 col-sm-12">
								<div class="tab-content">
									<div class="tab-pane fade show active" id="tab_boards">
										<div
											class="d-flex justify-content-between align-items-center mb-5">
										</div>

										<div class="row">
											
											<div class="col-lg-3">
												<div class="card border-dark">
													<div class="card-body">
														<div class="align-items-center">
																<span>반차</span>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div class="">
																	<span class="card-text">0.5일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="반차" value="반차">신청하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-3">
												<div class="card border-dark">
													<div class="card-body">
														<div class="align-items-center">
															<div>연차</div>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<p class="card-text">1일</p>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white" name="vacOption" id="연차"
																value="연차">신청하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-3">
												<div class="card border-dark">
													<div class="card-body">
														<div class="media align-items-center">
															<div class="media-body">
																<span>병가</span>
															</div>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div>
																	<span class="card-text">1일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="병가" value="병가">신청하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-3">
												<div class="card border-dark">
													<div class="card-body">
														<div class="align-items-center">
																<span>공가</span>
															</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div>
																	<span class="card-text">1일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="공가" value="공가">신청하기</button>
														</div>
													</div>
												</div>
											</div>

										</div>
										<div class="row">

											<div class="col-lg-6">
												<div class="card border-dark">
													<div class="card-body">
														<div class="media align-items-center">
															<div class="media-head"></div>
																<span>조의 (부모 / 배우자 / 자녀)</span>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div>
																	<span class="card-text">5일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="조의 (부모 / 배우자 / 자녀)" value="조의5일">신청하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="card border-dark">
													<div class="card-body">
														<div class="media align-items-center">
															<div class="media-head"></div>
																<span>조의 (조부모 / 형제 / 자매)</span>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div>
																	<span class="card-text">3일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="조의 (조부모 / 형제 / 자매)" value="조의3일">신청하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="card border-dark">
													<div class="card-body">
														<div class="media align-items-center">
															<div class="media-head"></div>
																<span>결혼 (본인)</span>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div>
																	<span class="card-text">3일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="결혼 (본인)" value="결혼본인">신청하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="card border-dark">
													<div class="card-body">
														<div class="media align-items-center">
															<div class="media-head"></div>
																<span>결혼 (자녀)</span>
														</div>
													</div>
													<div class="card-footer justify-content-between">
														<div>
															<div
																class="avatar-group avatar-group-sm avatar-group-overlapped me-3">
																<div>
																	<span class="card-text">1일</span>
																</div>
															</div>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-white"
																name="vacOption" id="결혼 (자녀)" value="결혼자녀">신청하기</button>
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		</section>

		<!-- 모달 -->
		<form action="${path }/vacation/applyvacation" method="post">
			<div class="modal fade" id="modal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">휴가신청 -</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- 캘린더 -->
							<div class="sec_cal">
								<div class="cal_nav">
									<a href="javascript:;" class="nav-btn go-prev">prev</a>
									<div class="year-month"></div>
									<a href="javascript:;" class="nav-btn go-next">next</a>
								</div>
								<div class="cal_wrap">
									<div class="days">
										<div class="day">MON</div>
										<div class="day">TUE</div>
										<div class="day">WED</div>
										<div class="day">THU</div>
										<div class="day">FRI</div>
										<div class="day">SAT</div>
										<div class="day">SUN</div>
									</div>
									<div class="dates"></div>
								</div>
							</div>
						</div>


						<div class="labelBox" id="timeLabelBox">
							<label>
								<select class="form-select" name="dayAndAfter" id="dayAndAfter">
									<option value="오전">오전</option>
									<option value="오후">오후</option>
								</select>
							</label> 
							<label>
								<div>오전 : 09:00시 부터 / 오후 : 14:00시 부터</div> 
							</label>
						</div>

						<div class="modal-footer">
							<input type="hidden" id="vacOption" name="vacOption" value="">
							<input type="hidden" name="createDate" value="">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn"
								style="background-color: rgba(14, 25, 90, 0.8); color: white;">신청</button>
						</div>
					</div>
				</div>
			</div>
		</form>


	</div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
		
		/* 시간선택변경시 */
		/* $("#startTime").change(()=>{
		    let startTime = ($("#startTime").val()).substr(0,2);
		    let endTime = ($("#endTime").val()).substr(0,2);
		    $("#endTime option").removeAttr("disabled");
		    // if(startTime>=endTime){
		    //     alert("종료시간은 시작시간보다 커야합니다");
		    //     for(let i=0; i<=10-endTime;i++){
		    //         $("#endTime option:eq("+i+")").attr("disabled", true);
		    //     }
		    // }
		    for(let i=0; i<=startTime-9;i++){
		        $("#endTime option:eq("+i+")").attr("disabled", true);
		    }
		}); */
        // div 클릭 시 모달 열기
        const openModal = () =>
            $("#modal").modal("show");

        const elements = document.querySelectorAll(".card-footer>div>button");
        elements.forEach(function(element) {
            element.addEventListener("click", openModal);
        });
        
        // 휴가신청 클릭시 상단 제목 휴가신청 - 해당하는 휴가종류표시
        //$(".common-container>div").click(function(e){
        $(".card-footer>div>button").click(function(e){
        	      console.log(e.target.id);
        	$("#exampleModalLabel").text("휴가신청 - " + e.target.id);
        	$("input[name='vacOption']").val(e.target.id);
       	});
        
        
        
        $(document).ready(function() { // $(function() {}) 이렇게써도됨
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
            
         	// 데이트 클릭시 선택표시 css적용
            $(".dates").click(function(e){
            	let clickedElement = e.target; // 클릭한 요소
            	let addedCurrentMonth = currentMonth + 1;
            	if(currentMonth<10){
            		currentMonth2 = "0" + addedCurrentMonth;
            	} else {
            		currentMonth2 = currentMonth;
            	}
            	if(clickedElement.textContent<10){
            		clickedElement.textContent2 = "0" + clickedElement.textContent;
            	} else {
            		clickedElement.textContent2 = clickedElement.textContent;
            	}
            	
            	let applyDate = currentYear + "-" + currentMonth2 + "-" + clickedElement.textContent2;
            	console.log("선택한 날짜 : " + applyDate);

            	// 선택된 날짜가 이미 highlight 클래스를 가지고 있는 경우 아무 작업도 하지 않습니다.
                if ($(clickedElement).hasClass("highlight")) {
                    return;
                }

                // 기존에 선택된 날짜가 있다면 highlight 클래스를 제거합니다.
                $(".dates .highlight").removeClass("highlight");

                // 클릭한 요소에 highlight 클래스를 추가합니다.
                $(clickedElement).addClass("highlight");
                
           	 	//$(clickedElement).toggleClass("highlight"); // 클릭한 요소에만 highlight 클래스를 토글
             	// applyDate 값을 hidden input 요소의 value에 넣습니다.
                
             	$("input[name='createDate']").val(applyDate);
           	 	
           	});
         
          //반차 옵션 선택 시에만 보여주는 기능
    		var vacOption = document.getElementById('vacOption');
    		var timeLabelBox = document.getElementById('timeLabelBox');
    		var btn = document.getElementsByClassName('btn');
    		
    		  const elements = document.querySelectorAll(".card-footer>div>button");
    	        elements.forEach(function(element) {
    	            element.addEventListener("click", function() {
    	            	if (vacOption.value !== '반차') {
    	      			  timeLabelBox.style.visibility = 'hidden';
    	      			}
   	    			  if (vacOption.value === '반차') {
   	      				timeLabelBox.style.visibility = 'visible';
   	      			  } else {
   	      				timeLabelBox.style.visibility = 'hidden';
   	      			  }
    	      			});
    	        });
    		  
         
        }
        
    </script>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

:root {
	--navy: rgba(14, 25, 90, 0.8);
}

* {
	font-family: 'Pretendard-Regular';
}

.container {
	width: 100%;
	height: 100%;
	width: 90%;
	margin: auto;
}

.top-bar>div {
	display: flex;
	margin-bottom: 10px;
}

.first-line {
	font-size: 28px;
}

.first-line>div {
	margin-right: 20px;
}

.second-line {
	font-size: 18px;
	display: flex;
	justify-content: space-between;
}

.second-line>div {
	display: flex;
}

.second-line>div>div {
	margin-right: 10px;
}

.thrid-line {
	display: flex;
	justify-content: space-between;
}

.thrid-line>div {
	display: flex;
}

.day-filter>button {
	margin-right: 5px;
}

.filter-right-part>button {
	margin: 0 10px;
}

.main-container {
	display: flex;
	flex-direction: column;
}

.first-container {
	margin-bottom: 20px
}

.common-container {
	height: 200px;
	display: flex;
	justify-content: space-between;
}

.common-container>div {
	box-shadow: rgba(3, 22, 187, 0.16) 0px 1px 4px;
	border-radius: 5px;
	padding: 10px;
	height: 100%;
	width: 23%;
	cursor: pointer;
}

.common-container>div:hover {
	scale: 1.02;
	transition: all 0.5s;
}

.main-container>p {
	font-size: 28px;
}

/* section calendar */
.sec_cal {
	width: 360px;
	margin: 0 auto;
	font-family: "NotoSansR";
}

.sec_cal .cal_nav {
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: 700;
	font-size: 48px;
	line-height: 78px;
}

.sec_cal .cal_nav .year-month {
	width: 300px;
	text-align: center;
	line-height: 1;
}

.sec_cal .cal_nav .nav {
	display: flex;
	border: 1px solid #333333;
	border-radius: 5px;
}

.sec_cal .cal_nav .go-prev, .sec_cal .cal_nav .go-next {
	display: block;
	width: 50px;
	height: 78px;
	font-size: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sec_cal .cal_nav .go-prev::before, .sec_cal .cal_nav .go-next::before {
	content: "";
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	transition: border 0.1s;
}

.sec_cal .cal_nav .go-prev:hover::before, .sec_cal .cal_nav .go-next:hover::before
	{
	border-color: #ed2a61;
}

.sec_cal .cal_nav .go-prev::before {
	transform: rotate(-135deg);
}

.sec_cal .cal_nav .go-next::before {
	transform: rotate(45deg);
}

.sec_cal .cal_wrap {
	padding-top: 40px;
	position: relative;
	margin: 0 auto;
}

.sec_cal .cal_wrap .days {
	display: flex;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
}

.sec_cal .cal_wrap::after {
	top: 368px;
}

.sec_cal .cal_wrap .day {
	display: flex;
	align-items: center;
	justify-content: center;
	width: calc(100%/ 7);
	text-align: left;
	color: #999;
	font-size: 12px;
	text-align: center;
	border-radius: 5px
}

.current.today {
	background: rgb(242, 242, 242);
}

.sec_cal .cal_wrap .dates {
	display: flex;
	flex-flow: wrap;
	height: 290px;
}

.sec_cal .cal_wrap .day:nth-child(7n -1) {
	color: #3c6ffa;
}

.sec_cal .cal_wrap .day:nth-child(7n) {
	color: #ed2a61;
}

.sec_cal .cal_wrap .day.disable {
	color: #ddd;
}

.day {
	cursor: pointer;
}

.highlight {
	background-color: var(--navy);
}
/* 드래그 금지기능 */
.dates {
	user-select: none;
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
/* 시간선택 */
.labelBox {
	text-align: center;
}

.labelBox>label {
	margin-bottom: 15px;
}

.labelBox>label>div {
	color: var(--navy);
}

/* 휴가수 */
.initial-wrap {
	background-color: color: var(--navy);
}
</style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>