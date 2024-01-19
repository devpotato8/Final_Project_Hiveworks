package com.dna.hiveworks.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;
import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.service.DeptService;
import com.dna.hiveworks.service.EmpService;
import com.dna.hiveworks.service.ScheduleService;
import com.dna.hiveworks.service.VacationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleContoller {

	private static final Logger log = LoggerFactory.getLogger(ScheduleContoller.class);

	private final ScheduleService scheduleService;

	private final DeptService deptservice;

	private final EmpService empservice;
	
	private final VacationService vacationservice;

	// 일정 조회 페이지 연결
	@GetMapping("/schedulelist.do")
	public String scheduleList(Model model) {
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		return "schedule/scheduleList";
	}

	// 일정 조회
	@GetMapping("/schedulelistend.do")
	@ResponseBody
	public List<Schedule> scheduleListEnd() {
		List<Schedule> schedules = scheduleService.selectScheduleAll();
		return schedules;

	};
	
	//내일정/내부서일정/중요일정/전사일정/(전체일정) 조회
	@PostMapping("/searchschedule")
	@ResponseBody
	public List<Schedule> searchSchedule(@RequestBody Map<String, Object> param){
		
	
		  param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		  instanceof String)); });
		 
		String calCode = (String) param.get("calCode");
		System.out.println(calCode);
		//String calStatus = (String) param.get("status");
		int empNo = (Integer)param.get("empNo");
		String deptCode = (String) param.get("deptCode");
		String searchType = (String) param.get("searchType");
		if (searchType.indexOf('A') > -1) {param.put("searchTypeA", "A");}
		if (searchType.indexOf('B') > -1) {param.put("searchTypeB", "B");}
		if (searchType.indexOf('C') > -1) {param.put("searchTypeC", "C");}

		List<Schedule> searchList = scheduleService.searchSchedule(param);
		
		return searchList;
//		return null;
	}
	
	//중요일정 조회
	@GetMapping("/searchImpschedule")
	@ResponseBody
	public List<Schedule> searchImpschedule(@RequestBody Map<String, Object> param) {
		String calImportYn = (String) param.get("important");
		List<Schedule> schedules = scheduleService.searchImpschedule(param);
		return schedules;
	}
	
	//직원일정 조회
	@PostMapping("/searchEmpschedule")
	@ResponseBody
	public List<Schedule> searchEmpschedule(@RequestBody Map<String, Object> param){
		
	
		/*
		 * param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		 * instanceof String)); });
		 */
		 
		String empName = (String)param.get("empName");
		
		List<Schedule> searchList = scheduleService.searchEmpSchedule(param);
		
		return searchList;
	}
	
	//직원 휴가 조회
	@PostMapping("/searchVacation")
	@ResponseBody
	public List<Vacation> searchVacation(@RequestBody Map<String, Object> param){
		int empNo = (Integer)param.get("empNo");
		List<Vacation> searchList =  vacationservice.selectVacationByNo(empNo);
		return searchList;
	}
	

	// 프로젝트 & 일정 등록
	@PostMapping(value = "/insertschedule.do", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Integer> insertSchedule(@RequestBody Map<String, Object> param) throws Exception {
		
		param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
				  instanceof String)); });
		
		
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);

		int result = 0;
		String calSubject = (String) param.get("title");
		String startDateString = (String) param.get("start");
		String endDateString = (String) param.get("end");
		String calColor = (String) param.get("backgroundColor");
		String calCode = (String) param.get("code");
		String calContent = (String) param.get("content");
		String reminderYn = (String) param.get("reminder");
		String calAlldayYn = (String) param.get("allday");
		String calStatus = (String) param.get("status");
		int empNo = Integer.parseInt((String)param.get("empno"));
		String empdeptcode = (String) param.get("empdeptcode");
		List<String> empStrList = (List<String>) param.get("empList");
		
		List<Integer> empList = new ArrayList<>();
		System.out.println(param);
		System.out.println(empList);
		if (empStrList != null && empStrList.size() > 0) {
			for (String emp : empStrList) {
				if (!emp.isEmpty()) { // emp가 빈 문자열이 아닌 경우에만 parseInt 실행
					int empInt = Integer.parseInt(emp);
					empList.add(empInt);
				}
			}
		}

		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

		Schedule schedule = Schedule.builder().calSubject(calSubject).calStartDate(calStartDate).calEndDate(calEndDate)
				.calColor(calColor).calCode(calCode).calContent(calContent).reminderYn(reminderYn)
				.calAlldayYn(calAlldayYn).calStatus(calStatus).myEmpNo(empNo).myDeptCode(empdeptcode).creater(empNo).modifier(empNo).build();

		result = scheduleService.insertSchedule(schedule, empList);

		return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result)
				: ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);

	}

	// 일정 수정
	@PostMapping(value= "/updateschedule", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Object> updateSchedule(@RequestBody Map<String, Object> param){///@RequestParam(name="reempList", required = false) List<String> param2
		

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);
		
		/*
		 * param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		 * instanceof String)); });
		 */
		
		int result = 0;
		System.out.println("파람"+param);
		String calSubject = (String)param.get("retitle");
		System.out.println(calSubject);
		
		String startDateString = (String)param.get("restart");
		String endDateString = (String)param.get("reend");
		String calCode = (String)param.get("recode");
		String calColor = (String)param.get("rebackgroundColor");
		String calContent = (String)param.get("recontent");
		String reminderYn = (String)param.get("rereminder");
		String calAlldayYn = (String)param.get("reallday");
		String calStatus = (String)param.get("restatus");
		int calNo = (Integer)param.get("recalno");
		int reempNo = Integer.parseInt((String)param.get("reempno"));
		List<String> empStrList = (List<String>)param.get("reempList");
		List<Integer> reempList = new ArrayList<>();
		if (empStrList != null && empStrList.size() > 0) {
			for (String emp : empStrList) {
				if (!emp.isEmpty()) { // emp가 빈 문자열이 아닌 경우에만 parseInt 실행
					int empInt = Integer.parseInt(emp);
					reempList.add(empInt);
				}
			}
		}

		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

		
		
		  Schedule schedule =
		  Schedule.builder().calSubject(calSubject).calStartDate(
		  calStartDate)
		  .calEndDate(calEndDate).calCode(calCode).calColor(calColor).calContent(
		  calContent)
		  .reminderYn(reminderYn).calAlldayYn(calAlldayYn).calStatus(calStatus).
		  modifier(reempNo).build();
		 
		 
		  result = scheduleService.updateSchedule(schedule, reempList, calNo);
		  
		  return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
		  ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
		
		
		
		
	}
	
	
	
	//중요일정 수정
	@PostMapping("/updateImportYn")
	@ResponseBody
	public ResponseEntity<Object> updateImportYn(@RequestBody Map<String, Object> param){
		System.out.println(param);
		String calImportYn = (String)param.get("importYn");
		int calNo = (Integer)param.get("calno");
		
		Schedule schedule = Schedule.builder().calImportYn(calImportYn).build();
		
		int result = scheduleService.updateImportYn(schedule,calNo);
		
		return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
			  ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
	}
	
	

	// 일정 삭제
	@PostMapping("/deleteschedule")
	public String deleteSchedule(@RequestBody Map<String, Object> param, Model model) {
		int calNo = (Integer)param.get("calNo");
		int result = scheduleService.deleteSchedule(calNo);
		String msg, loc;
		if (result > 0) {
			msg = "삭제성공";
			loc = "schedule/schedulelist.do";
		} else {
			msg = "삭제실패";
			loc = "schedule/schedulelist.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";
	}

	// 프로젝트 조회
	@GetMapping("/projectlist.do")
	public String projectList(Model model) {
		List<Schedule> projectList = scheduleService.selectprojectAll();
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("projectList", projectList);
		return "schedule/projectList";
	}

	// 프로젝트 상세조회
	@GetMapping("/projectlistbycalno.do")
	@ResponseBody
	public Schedule projectListByCalNo(@RequestParam int calNo) {
		Schedule project = scheduleService.selectprojectByCalNo(calNo);
		return project;
	}

	// 사원번호별 프로젝트 조회
	@GetMapping("/projectlistbyempno.do")
	public String projectListByEmpNo(@RequestParam int empNo, Model model) {
		List<Schedule> myProjectList = scheduleService.selectprojectByEmpNo(empNo);
		model.addAttribute("myProjectList", myProjectList);
		return "schedule/myProjectList";
	}

	// calcode별로 스케쥴러 나누기
	/*
	 * @GetMapping("/schedulelistend.do")
	 * 
	 * @ResponseBody public List<Schedule> scheduleListEnd(String calCode) { if
	 * (calCode=="C") return scheduleService.selectScheduleAll(calCode); }
	 */

	// 자산 예약 조회
	@GetMapping("/reservationlist.do")
	public String reservationList(Model model) {
		String result = "";
		/* if(calCode==null) { */
		List<Schedule> reserveList = scheduleService.selectReserveAll();
		List<Resource> resourceList = scheduleService.selectResourceAll();
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("reList", resourceList);
		result = "schedule/reservationList";
		/*
		 * }if(calCode=="CAL004") { List<Schedule> reserveRoomList =
		 * scheduleService.selectReserveByCode(calCode); model.addAttribute("roomList",
		 * reserveRoomList); result = "schedule/roomReservationList";
		 * }if(calCode=="CAL005") { List<Schedule> reserveCarList =
		 * scheduleService.selectReserveByCode(calCode); model.addAttribute("CarList",
		 * reserveCarList); result = "schedule/carReservationList";
		 * }if(calCode=="CAL006") { List<Schedule> reserveBeamList =
		 * scheduleService.selectReserveByCode(calCode); model.addAttribute("beamList",
		 * reserveBeamList); result = "schedule/beamReservationList"; }
		 */
		return result;
	}
	
	
	// 사원번호별 자산 예약 조회
	@GetMapping("/reservationlistbyno.do")
	public String reservationListByNo(@RequestParam int empNo, Model model) {
		List<Schedule> MyReserveList = scheduleService.selectReserveByNo(empNo);
		List<Resource> resourceList = scheduleService.selectResourceAll();
		model.addAttribute("MyReserveList", MyReserveList);
		model.addAttribute("reList", resourceList);
		return "schedule/myReservationList";

	}
	
	@PostMapping("/selectReservationBydate")
	@ResponseBody
	public List<Schedule> selectReservationBydate(@RequestBody Map<String, Object> param){
		
		param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
				  instanceof String)); });
		System.out.println(param);
		 int resourceNo = (Integer)param.get("resourceNo");
		String strDate = (String) param.get("selectDate");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		try {
		    utilDate = dateFormat.parse(strDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}

		java.sql.Date selectdate = new java.sql.Date(utilDate.getTime());

		System.out.println(resourceNo);
		System.out.println(selectdate);
		List<Schedule> ReserveListByDate = scheduleService.selectReservationBydate(selectdate, resourceNo);

		return ReserveListByDate;
	}
		


	/*
	 * @GetMapping("/reservationlistend.do") public String reservationListEnd(String
	 * calCode,Model model) { if(calCode==null) { List<Schedule> reservList =
	 * scheduleService.selectReserveAll(); model.addAttribute("reList",
	 * resourceList); return "" }if
	 */
	// }

	private int Integer(Object object) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 자산 목록 조회
	@GetMapping("/resourcelist.do")
	public String resourceList(Model model) {
		List<Resource> resourceList = scheduleService.selectResourceAll();
		model.addAttribute("reList", resourceList);
		return "schedule/resourceList";
	}
	
	//자산 타입별로 목록 조회
	@PostMapping("/resourcelistByType")
	@ResponseBody
	public List<Resource> resourcelistByType(@RequestParam Map<String, Object> param){
		String type = (String)param.get("resourceType");
		List<Resource> resourceT = scheduleService.selectResourceByType(type);
		return resourceT;
	}
	
	
	
	// 자산 예약 페이지 연결
	@GetMapping("/reserveResource.do")
	public String reserveResource(Model model, @RequestParam int resourceNo) {
		
		List<Resource> resourceList = scheduleService.selectResourceAll();
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("reList", resourceList);
		
		Resource current = resourceList.stream().filter(r -> r.getResourceNo() == resourceNo).findAny().get();
		String calCode = "";
		switch(current.getResourceType()) {
		case "회의실": calCode = "CAL004"; break;
		case "차량": calCode = "CAL005"; break;
		case "빔프로젝터": calCode = "CAL006"; break;
		}
		model.addAttribute("currentResourceCalCode",calCode);
		model.addAttribute("currentResourceNo", resourceNo);
		return "schedule/reservationResource";
	}
	
	//예약 수정 페이지 연결
	@GetMapping("/updateReservation")
	public String updateReservation(Model model, @RequestParam int calNo, @RequestParam int resourceNo) {
		List<Resource> resourceList = scheduleService.selectResourceAll();
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("reList", resourceList);
		List<Schedule> reserveList = scheduleService.selectReserveAll();
		Schedule currentR = reserveList.stream().filter(r -> r.getCalNo() == calNo).findAny().get();
		
		ObjectMapper mapper = new ObjectMapper();
		
		
		model.addAttribute("currentR", currentR);
		try {
			model.addAttribute("currentRJson", mapper.writeValueAsString(currentR));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		model.addAttribute("currentCalNo",calNo);
		model.addAttribute("currentResourceNo", resourceNo);
		return "schedule/updateReservation";
	}
	

	// 자산 예약
	@PostMapping("/reserveResourceEnd.do")
	public String reserveResourceEnd(@RequestParam Map<String, Object> param, Model model, String[] calEmp) {
		
		log.debug(Arrays.toString(calEmp));
		
		  param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		 instanceof String)); });
		 

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);

		int result = 0;
		int empNo = Integer.parseInt((String)param.get("empNo"));
		int resourceNo = Integer.parseInt((String) param.get("resourceNo"));
		String startDateString = (String) param.get("start");
		String endDateString = (String) param.get("end");
		String calColor = (String) param.get("backgroundColor");
		String calCode = (String) param.get("code");
		String calSubject = "";
		switch(calCode) {
		case "CAL004": calSubject = "회의실 예약"; break;
		case "CAL005": calSubject = "차량 예약"; break;
		case "CAL006": calSubject = "빔프로젝터 예약"; break;
		}
		
		String reminderYn = (String) param.get("reminder");
		/*
		 * String empArrayValue = (String) param.get("calEmp"); String[] empArray =
		 * empArrayValue != null ? empArrayValue.split(",") : new String[0];
		 * 
		 * List<Integer> empList = new ArrayList<>(); if (empArray != null &&
		 * empArray.length > 0) { for (String emp : empArray) { if (emp != null &&
		 * !emp.isEmpty()) { int empInt = Integer.parseInt(emp); empList.add(empInt); }
		 * } }
		 */
		
	    int[] empList = new int[calEmp.length];
        
        for (int i = 0; i < calEmp.length; i++) {
        	empList[i] = Integer.parseInt(calEmp[i]);
        }

		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

		Schedule schedule = Schedule.builder().calStartDate(calStartDate).calEndDate(calEndDate).calCode(calCode).myEmpNo(empNo)
				.reminderYn(reminderYn).creater(empNo).modifier(empNo).calColor(calColor).calSubject(calSubject).build();

		result = scheduleService.reserveResource(schedule, resourceNo, empList);

		String msg, loc;
		if (result > 0) {
			msg = "예약성공";
			loc = "schedule/reservationlistbyno.do?empNo="+empNo;
		} else {
			msg = "예약실패";
			loc = "schdule/reserveResource.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";
	}
	
	//예약 삭제
	@PostMapping("/deleteReservation")
	@ResponseBody
	public ResponseEntity<String> deleteReservation(@RequestBody List<Integer> checkedList) {
	    int result = 0;

	    if (checkedList != null && !checkedList.isEmpty()) {
	        result = scheduleService.deleteReservation(checkedList);
	    }

	    return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(String.valueOf(result)) :
	            ResponseEntity.status(HttpStatus.BAD_REQUEST).body(String.valueOf(result));
	} 


	// 자산 등록
	@PostMapping("/insertresource.do")
	public String insertResource(Resource resource, Model model) throws Exception {
		int result = scheduleService.insertResource(resource);
		String msg, loc;
		if (result > 0) {
			msg = "등록 성공";
			loc = "schedule/resourcelist.do";
		} else {
			msg = "등록 실패";
			loc = "schdule/resourcelist.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";

	}
	
	//자산 수정
	@PostMapping("/updateresource")
	public String updateResource(Resource resource, Model model) throws Exception {
		int result = scheduleService.updateResource(resource);
		String msg, loc;
		if (result > 0) {
			msg = "수정 성공";
			loc = "schedule/resourcelist.do";
		} else {
			msg = "수정 실패";
			loc = "schdule/resourcelist.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";

	}
	
	//자산 삭제
	@PostMapping("/deleteResource")
	@ResponseBody
	public ResponseEntity<String> deleteResource(@RequestBody List<Integer> checkedList) {
	    int result = 0;

	    if (checkedList != null && !checkedList.isEmpty()) {
	        result = scheduleService.deleteResource(checkedList);
	    }

	    return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(String.valueOf(result)) :
	            ResponseEntity.status(HttpStatus.BAD_REQUEST).body(String.valueOf(result));
	}
	

}
