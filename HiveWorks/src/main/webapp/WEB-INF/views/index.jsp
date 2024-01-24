<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style" />
	<jsp:param value="" name="hover" />
</jsp:include>
<%-- 	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/> --%>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait" />
</jsp:include>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Main Content -->
<div class="hk-pg-wrapper">
	<div class="container-xxl">
		<!-- Page Header -->
		<div class="hk-pg-header pg-header-wth-tab pt-7">
			<div class="d-flex">
				<div class="d-flex flex-wrap flex-1 align-items-center">
					<div class="mb-lg-0 mb-2 d-flex align-items-center">
						<c:choose>
							<c:when test="${not empty loginEmp }">
								<h1 class="pg-title m-0">안녕하세요! ${loginEmp.emp_name}님</h1>
							</c:when>
							<c:otherwise>
								<h1 class="pg-title m-0">안녕하세요! 로그인을 해주세요</h1>
							</c:otherwise>
						</c:choose>
						<div id="weather"
							class="d-flex align-items-center justify-content-between"
							style="width: 240px; margin-left: 20px">
							<div class="badge badge-soft-danger my-1  me-1"
								data-bs-toggle="tooltip" data-bs-placement="top" title="온도"></div>
							<div class="badge badge-soft-danger my-1  me-1"
								data-bs-toggle="tooltip" data-bs-placement="top" title="현재 위치"></div>
							<div style="width: 50px; height: 50px"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Header -->

		<!-- Page Body -->
		<div>
			<div class="container d-flex justify-content-center">
				<div class="left-container">
					<!-- 프로필부분 -->
					<div class="card card-border contact-card"
						style="margin-bottom: 50px">
						<div class="card-body text-center">
							<div class="card-action-wrap"></div>

							<div class="avatar-xl avatar-rounded align-items-center mb-5 mt-5">
								<img src="${path }/resources/img/logo_bee.png" alt="user"
									class="brand-img img-fluid " width="100px" height="100px">
							</div>
									<div class="user-name">나는 ${loginEmp.emp_name} 입니다</div>
									<div class="user-email">부서 ${loginEmp.dept_code }</div>
									<div class="user-contact">${loginEmp.emp_phone }</div>
						</div>
						<div class="card-footer text-muted position-relative">
							<a href="${path }/mypage/myprofile"
								class="d-flex align-items-center" data-bs-toggle="tooltip"
								data-bs-placement="top" title="프로필보기"
								data-bs-target="#contact_detail"> <span
								class="feather-icon me-2" style="color: navy;"><i
									data-feather="user-check"></i></span> <span class="fs-7 lh-1"
								style="color: navy;">Profile</span>
							</a>
						</div>
					</div>
					<div>
						<div>
							<div class="d-flex flex-column align-items-center clockAndCheck">
								<div class="btn-block">출퇴근을 눌러주세요 😊</div>
								<div class="btn-block" id="currentTime"></div>
							</div>
							<div class="button-container d-flex justify-content-center mt-3">
								<form action="${path}/work/updateStartWork" method="post" id="workStartForm">
									<input class="btn btn-flush-light btn-animated" type="submit"
										value="출근하기" onclick="workStartForm(event)"/> 
										<input type="hidden" id="workStartTime" name="workStartTime" value="" />
								</form>
								<form action="${path}/work/updateEndWork" method="post" id="workEndForm">
									<input class="btn btn-flush-light btn-animated" type="submit"
										value="퇴근하기" onclick="workEndForm(event)"/> 
										<input type="hidden" id="workEndTime" name="workEndTime" value="" />
								</form>
							</div>
							<div class="SEWork">
								<c:if test="${not empty commute.workStartTime }">
									<fmt:formatDate value="${commute.workStartTime}"
										pattern="HH:mm:ss" var="workStartTime" />
									<div class="btn-block" style="background-color: #f1c40f">출근시간
										- ${workStartTime}</div>
									<!-- 포맷팅된 날짜와 시간을 출력 -->
								</c:if>
								<c:if test="${not empty commute.workEndTime }">
									<fmt:formatDate value="${commute.workEndTime}"
										pattern="HH:mm:ss" var="workEndTime" />
									<div class="btn-block" style="background-color: #f1c40f">퇴근시간
										- ${workEndTime }</div>
								</c:if>
							</div>
						</div>
					</div>

				</div>
				<div class="right-container">
					<div class="right-container-up ">
						<div class="cal-section align-items-center"
							style="width: 500px; margin-right: 50px">
							<!-- 캘린더 -->
							<div class="sec_cal contact-card">
								<div class="cal_nav">
									<a href="javascript:;" class="nav-btn go-prev"
										data-bs-toggle="tooltip" data-bs-placement="top" title="이전달">prev</a>
									<div class="year-month"></div>
									<a href="javascript:;" class="nav-btn go-next"
										data-bs-toggle="tooltip" data-bs-placement="top" title="다음달">next</a>
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
						<!-- 2 -->
						<div class="d-flex justify-content-center">
							<div style="width: 400px; height: 400px"
								class="d-flex justify-content-center">
								<!-- <div class="wrapper" style="width: 350px; height: 350px">
									<header>TodoList</header>
									<div class="inputField d-flex justify-content-around">
										<input type="text" id="addValue" placeholder="할 일 추가하기" autofocus />
										<button id="btn" onclick="addTodo()">추가</button>
										<button id="allClear" onclick="allClearList()">모두삭제</button>
									</div>
									<div>
										<ul id="addTodo" class="Todolist">
											<li><div id="result"></div></li>
										</ul>
									</div>
								</div> -->
								<img alt=""
									src="https://pbs.twimg.com/media/GC0ulucaUAAsu8A?format=jpg&name=medium"
									style="width: 350px; height: 350px">
							</div>
						</div>
					</div>

					<!-- 3 -->

					<div class="right-container-down">
						<div class="newsList">
							<div class="badge badge-soft-blue" style="font-size: 14px;">뉴스게시판</div>
							<div style="width: 750px; height: 500px"
								class="justify-content-center text-center">
								<table class="table">
									<thead>
										<tr>
											<th scope="col"></th>
											<th scope="col">제목</th>
											<th scope="col">내용</th>
											<th scope="col">날짜</th>
										</tr>
									</thead>
									<tbody id="myTbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--  -->
					<!-- 게시판 -->
					<!-- <div class="d-flex justify-content-center">
					<div style="width: 400px; height: 350px" class="justify-content-center text-center">
						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">조회수</th>
									<th scope="col">날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>1</th>
									<td>제목</td>
									<td>12</td>
									<td>2024.01.03</td>
								</tr>
								<tr>
									<th>2</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>3</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>4</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>5</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					</div> -->
					<!-- 게시판보여주기 -->
				</div>

			</div>
		</div>

	</div>
</div>

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
	box-sizing: border-box;
	font-family: 'Pretendard-Regular';
}

.inputField>button {
	border: none;
	background-color: var(--navy);
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
}

.btn-block {
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
	height: 40px;
}

.SEWork {
	margin-top: 20px;
	background-color: white;
	color: white;
	display: flex;
	flex-direction: column;
	font-size: 16px;
	text-align: center;
}

.container {
	margin-top: 20px;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-between;
}

.left-container {
	/* display: flex;
           flex-direction: column; */
	justify-content: space-between;
	width: 25%;
}

.left-container>div {
	/* box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px; */
	border-radius: 5px;
	height: 350px;
}

.right-container {
	margin-left: 50px;
	width: 60%;
	display: flex;
	flex-direction: column;
	/* gap: 15px; */
}

.right-container-up {
	display: flex;
	width: 100%;
}

.right-container-down {
	display: flex;
	width: 100%;
}

.right-container>div {
	/* box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px; */
	/* border-radius: 5px;
	width: 470px;
	height: 350px; */
	
}

.newsList {
	overflow: auto;
}

.newsList::-webkit-scrollbar {
	display: block;
}

::-webkit-scrollbar-thumb {
	background-color: lightblue;
}

table>thead {
	background-color: var(--navy);
}

.clockAndCheck>div {
	background-color: var(--navy);
	color: white;
}

/* section calendar */
.sec_cal {
	width: 350px;
	height: 0;
	margin: 0 auto;
	font-family: "NotoSansR";
}

.sec_cal .cal_nav {
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: 700;
	line-height: 78px;
}

.sec_cal .cal_nav .year-month {
	width: 100px;
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
	width: 10px;
	height: 58px;
	font-size: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sec_cal .cal_nav .go-prev::before, .sec_cal .cal_nav .go-next::before {
	content: "";
	display: block;
	width: 10px;
	height: 10px;
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
	padding-top: 10px;
	position: relative;
	margin: 0 auto;
}

.sec_cal .cal_wrap .days {
	display: flex;
	margin-bottom: 10px;
	padding-bottom: 10px;
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
	font-size: 14px;
	font-weight: 14px;
	text-align: center;
	border-radius: 5px
}

.current.today {
	background-color: var(--navy);
	/* background: rgb(242, 242, 242); */
}

.sec_cal .cal_wrap .dates {
	display: flex;
	flex-flow: wrap;
	height: 220px;
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
.inputField input{
    color: black;
    border: none;
    outline: none;
}
.wrapper{
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 0px 1px;
	border-radius: 5px;
	padding: 10px;
}
#addValue{
	width: 150px;
	text-align: center;
}
</style>
<!-- 출퇴근제출 -->
<script >
function workStartForm(event) {
	event.preventDefault(); // 기본 동작인 폼 제출을 막음
	if (confirm("출근하시겠습니까?")) {
		document.getElementById("workStartForm").submit();
	} else {
	}
}
function workEndForm(event) {
	event.preventDefault(); // 기본 동작인 폼 제출을 막음
	if (confirm("퇴근하시겠습니까?")) {
		document.getElementById("workEndForm").submit();
	} else {
	}
}
</script>
<!-- 투두리스트 -->
<script>
	const btn = document.getElementById('btn'); //버튼
	let addValue = document.getElementById('addValue'); //할일 입력
	let result = document.getElementById('result');// 추가된 할일
	
	//할일 추가시
	function addTodo(){
	    if(addValue.value==false){ /*''가능 */
	        alert('내용을 입력하세요!');
		    }else{
		    let list = document.createElement("li");
		    let del = document.createElement("button");
		    list.innerHTML = addValue.value;
		    
		    result.appendChild(list); //추가된 할일에 할일 리스트 추가하기
		    list.appendChild(del);    //할일 리스트 추가시 삭제버튼도 추가    
		    del.innerText = "x";      //삭제버튼에 들어갈 'x'자 문자
		    del.style.fontSize = "14px";
		    del.style.border = "none";
		    del.style.float = "right";
		    //del.style.right = "115px";
		    //del.style.marginTop = "10px";
		    del.style.cursor = "pointer";
		    del.addEventListener("click", deleteList); //삭제버튼 클릭시 리스트지우기 이벤트 실행
		    //del.style.position='relative';
		    
		    addValue.value = "";                            //할일 입력창 초기화
		    addValue.focus();                               //강제 커서 깜빡임
		    list.addEventListener("click", function(){      //할일 완료 후 클릭시 밑줄로 표시
		        list.style.textDecoration = "line-through";
		        list.style.color = "gray";                  //클릭시 색변환
		    })
		}
	}
	//할일 목록 삭제시
	function deleteList(e){ //삭제 버튼(x) 클릭시 
	    let removeOne = e.target.parentElement;  //선택한 목록 한개만 지우기(부모 객체를 지운다)
	    removeOne.remove();
	}
	// //모두 삭제시
	function allClearList(e){
	    if(confirm("정말 삭제하시겠습니까?")==true){ //취소메시지가 true(ok)일때
	        if(result.innerText==''){                      //목록칸이 비어있다면
	            alert("삭제할 목록이 없습니다");            //삭제할 목록이 없다는 경고창뜨기
	        }else{                                         //삭제할 목록이 있다면
	            result.innerText='';                       //전체 삭제
	        }
	    }else{                                      //취소메시지가 false(no)일때
	        return false;                           //삭제 취소
	    }
	}
</script>
<!-- naverAPI -->
<script>
	function printAPI(){
		fetch("${path }/naverApi")
		.then((res)=> res.json())
		.then((data)=> {
			data.items.forEach( (e, index) =>{
				const tr = document.createElement("tr");
				const num = document.createElement("th");
				const title = document.createElement("td");
				const description = document.createElement("td");
				const pubDate = document.createElement("td");
				const link = document.createElement("a");
				
				/* 링크를넣고 text를 추가해야함 */
				link.target = "_blank";
				link.href = e['link'];
				link.textContent = e['title'].replace(/<[^>]+>|&quot;/g, "");
				
				num.textContent = (index + 1).toString();
				description.textContent = e['description'].replace(/<[^>]+>|&quot;|&lt;|&gt;|&amp;/g, "");
				pubDate.textContent = e['pubDate'].replace("+0900","");
				
				tr.appendChild(num);
				title.appendChild(link);
				tr.appendChild(title);
			  	tr.appendChild(description);
			 	tr.appendChild(pubDate);
			 	
				document.getElementById("myTbody").appendChild(tr);
			});
		});
	}
	printAPI();
</script>

<!-- 날씨정보가져오기 -->
<script>
let weatherIcon = {
		'Clear': "${path}/resources/weatherimgs/production/fill/all/clear-day.svg",
	   'Sun' : "${path}/resources/weatherimgs/production/fill/all/sun.svg",
	   'Clouds' : "${path}/resources/weatherimgs/production/fill/all/cloudy.svg",
	   'Rain' : "${path}/resources/weatherimgs/production/fill/all/rain.svg",
	   'Snow' : "${path}/resources/weatherimgs/production/fill/all/snow.svg",
	   'Thunderstorm':"${path}/resources/weatherimgs/production/fill/all/thunderstorm.svg",
	   'Drizzle':"${path}/resources/weatherimgs/production/fill/all/dirzzle.svg",
	   'Fog':"${path}/resources/weatherimgs/production/fill/all/fog.svg",
	   'Smoke':"${path}/resources/weatherimgs/production/fill/all/smoke.svg",
	   'Haze': "${path}/resources/weatherimgs/production/fill/all/haze.svg",
	   'Mist': "${path}/resources/weatherimgs/production/fill/all/mist.svg"
	  };
const API_KEY = "99aa7d857c4cc6f52aeccac6d088bed1";

/* function onGeoOk(position) { */
function onGeoOk() {
    /* const lat = position.coords.latitude;
    const lon = position.coords.longitude; */
    const lat = "37.5185379872086";
    const lon = "126.91496951410905";
    const url = "https://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&appid=" + API_KEY + "&units=metric";
    fetch(url)
        .then((response) => response.json())
        .then((data) => {
            const weather = document.querySelector("#weather div:first-child")
            const city = document.querySelector("#weather div:nth-child(2)")
            const icon = document.querySelector("#weather div:last-child")
            let wetherInfo = data.weather[0].main
            weather.innerText = data.weather[0].main + " " +  data.main.temp + "℃";
            city.innerText = data.name;
            //icon.innerHTML = weatherIcon[wetherInfo];
        	
            const childElement = document.createElement("img");
            childElement.setAttribute("src",weatherIcon[wetherInfo]);
			icon.appendChild(childElement);
            //icon.setAttribute("src",weatherIcon[wetherInfo]);
            
        });
}
onGeoOk();
/* function onGeoError() {
    alert("위치정보를 찾을 수 없습니다.")
} */
/* navigator.geolocation.getCurrentPosition(onGeoOk,onGeoError); */
</script>
<script>
  // 현재 시간을 가져오는 함수
  function getCurrentTime() {
    let date = new Date();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();

    // 시, 분, 초를 2자리 숫자로 표시하기 위해 앞에 0을 붙임
    hours = addLeadingZero(hours);
    minutes = addLeadingZero(minutes);
    seconds = addLeadingZero(seconds);

    // 시간을 형식에 맞게 표시
    let currentTime = hours + ":" + minutes + ":" + seconds;

    // HTML 요소에 현재 시간을 표시
    document.getElementById("currentTime").innerText = currentTime;
    //document.getElementById("workStartTime").value=currentTime;
    //document.getElementById("workEndTime").value=currentTime;
  }

  // 숫자 앞에 0을 붙이는 함수
  function addLeadingZero(number) {
    return number < 10 ? "0" + number : number;
  }

  // 1초마다 현재 시간 업데이트
  setInterval(getCurrentTime, 1000);
</script>
<script>
	
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

		var thisMonth = new Date(today.getFullYear(), today.getMonth(), today
				.getDate());
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
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="day prev disable">' + i + '</div>'
			}
			// 이번달
			for (var i = 1; i <= nextDate; i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="day current">' + i + '</div>'
			}
			// 다음달
			for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="day next disable">' + i + '</div>'
			}

			// 오늘 날짜 표기
			if (today.getMonth() == currentMonth) {
				todayDate = today.getDate();
				var currentMonthDate = document
						.querySelectorAll('.dates .current');
				currentMonthDate[todayDate - 1].classList.add('today');
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