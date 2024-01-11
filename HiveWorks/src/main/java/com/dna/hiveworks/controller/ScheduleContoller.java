package com.dna.hiveworks.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.dna.hiveworks.service.DeptService;
import com.dna.hiveworks.service.EmpService;
import com.dna.hiveworks.service.ScheduleService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleContoller {

	private static final Logger log = LoggerFactory.getLogger(ScheduleContoller.class);

	private final ScheduleService scheduleService;
	
	private final DeptService deptservice;
	
	private final EmpService empservice; 
	
	
	//일정 조회 페이지 연결
	@GetMapping("/schedulelist.do")
	public String scheduleList(Model model) {
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList",empList);
		System.out.println(deptList);
		return "schedule/scheduleList";
	}
	
	
	 //일정 조회
	@GetMapping("/schedulelistend.do")
	@ResponseBody
	public List<Schedule> scheduleListEnd() {
		List<Schedule> s = scheduleService.selectScheduleAll();
		System.out.println(s);
		return s;
		
	};
	
	
	//프로젝트 & 일정 등록
		@PostMapping(value = "/insertschedule.do", consumes = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ResponseEntity<Integer> insertSchedule(@RequestBody Map<String, Object> param) throws Exception {

			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);

			System.out.println(param.get("start"));

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
			int empNo = Integer.parseInt((String) param.get("empno"));
			List<String> empStrList = (List<String>)param.get("empList");
			List<Integer> empList = new ArrayList<>();
			if(empStrList.size() > 0) {    
			    for (String emp : empStrList) {
			        if (!emp.isEmpty()) {  // emp가 빈 문자열이 아닌 경우에만 parseInt 실행
			            int empInt = Integer.parseInt(emp);
			            empList.add(empInt);
			        }
			    }
			}

			Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
			Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

			Schedule schedule = Schedule.builder() 
					.calSubject(calSubject)
					.calStartDate(calStartDate)
					.calEndDate(calEndDate)
					.calColor(calColor)
					.calCode(calCode)
					.calContent(calContent)
					.reminderYn(reminderYn)
					.calAlldayYn(calAlldayYn)
					.calStatus(calStatus)
					.myEmpNo(empNo)
					.creater(empNo)
					.modifier(empNo)
					.build();

			result = scheduleService.insertSchedule(schedule, empList);

			return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result)
					: ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
			
		}
		
		//일정 수정
		@PostMapping("/updateschedule")
		public String updateSchedule(@RequestParam Map<String, Object> param, Model model) {
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);
			
			int result = 0;
			
			int calNo = Integer.parseInt((String) param.get("recalno"));
			String calSubject = (String) param.get("retitle");
			String startDateString = (String) param.get("trstart");
			String endDateString = (String) param.get("reend");
			String calCode = (String) param.get("code");
			String calColor = null;
				if(calCode == "CAL001") calColor = "#FF1F1F";
				if(calCode == "CAL002") calColor = "#00AD14";
				if(calCode == "CAL003") calColor = "#000000";
			String calContent = (String) param.get("recontent");
			String reminderYn = (String) param.get("rereminder");
			String calAlldayYn = (String) param.get("reallday");
			String calStatus = (String) param.get("restatus");
			int reempNo = Integer.parseInt((String) param.get("reempno"));
			List<String> recalEmps = (List<String>) param.get("recalEmp");
			List<Integer> empList = new ArrayList<>();

			for(String reemp : recalEmps) {
				if (!reemp.isEmpty()) {  // emp가 빈 문자열이 아닌 경우에만 parseInt 실행
		            int reempInt = Integer.parseInt(reemp);
		            empList.add(reempInt);
		        }
		    }
			

			Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
			Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

			Schedule schedule = Schedule.builder()
					.myEmpNo(reempNo)
					.calSubject(calSubject)
					.calStartDate(calStartDate)
					.calEndDate(calEndDate)
					.calCode(calCode)
					.calColor(calColor)
					.calContent(calContent)
					.reminderYn(reminderYn)
					.calAlldayYn(calAlldayYn)
					.calStatus(calStatus)
					.modifier(reempNo)
					.build();
					

			
			System.out.println(schedule);
			
			result=scheduleService.updateSchedule(schedule,empList,calNo);
			
			String msg, loc;
			if(result>0) {
				msg="수정성공";
				loc="schedule/reservationlist.do";
			}else {
				msg="수정실패";
				loc="schedule/reservationlist.do";
			}
			
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
			
			
			return "schedule/msg";
		}
		
	//일정 삭제
	@DeleteMapping("/deleteschedule")
	public String deleteSchedule(@RequestParam Map<String, Object> param, Model model) {
		int calNo = Integer.parseInt((String)param.get("calNo"));
		int result = scheduleService.deleteSchedule(calNo);
		String msg, loc;
		if(result>0) {
			msg="삭제성공";
			loc="schedule/reservationlist.do";
		}else {
			msg="삭제실패";
			loc="schedule/reservationlist.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "schedule/msg";
	}
	
	
	//프로젝트 조회
	@GetMapping("/projectlist.do")
	public String projectList(Model model) {
		List<Schedule> projectList = scheduleService.selectprojectAll();
		model.addAttribute("projectList", projectList);
		return "schedule/projectList";
	}
	
	//프로젝트 상세조회
	@GetMapping("/projectlistbycalno.do")
	@ResponseBody
	public Schedule projectListByCalNo(@RequestParam int calNo) {
		Schedule project = scheduleService.selectprojectByCalNo(calNo);
		return project;
	}
	
	//사원번호별 프로젝트 조회
	@GetMapping("/projectlistbyempno.do")
	public String projectListByEmpNo(@RequestParam int empNo, Model model) {
		List<Schedule> myProjectList = scheduleService.selectprojectByEmpNo(empNo);
		model.addAttribute("myProjectList", myProjectList);
		return "schedule/myProjectList";
	}
	

	//calcode별로 스케쥴러 나누기
	/*
	 * @GetMapping("/schedulelistend.do")
	 * 
	 * @ResponseBody public List<Schedule> scheduleListEnd(String calCode) { if
	 * (calCode=="C") return scheduleService.selectScheduleAll(calCode); }
	 */
	
	
	//자산 예약 조회
	@GetMapping("/reservationlist.do")
	public String reservationList(Model model) {
		String result = "";
		/* if(calCode==null) { */
			List<Schedule> reserveList = scheduleService.selectReserveAll();
			System.out.println(reserveList);
			model.addAttribute("reserveList", reserveList);
			 result = "schedule/reservationList";
		/*}if(calCode=="CAL004") {
			List<Schedule> reserveRoomList = scheduleService.selectReserveByCode(calCode);
			model.addAttribute("roomList", reserveRoomList);
			result = "schedule/roomReservationList";
		}if(calCode=="CAL005") {
			List<Schedule> reserveCarList = scheduleService.selectReserveByCode(calCode);
			model.addAttribute("CarList", reserveCarList);
			result = "schedule/carReservationList";
		}if(calCode=="CAL006") {
			List<Schedule> reserveBeamList = scheduleService.selectReserveByCode(calCode);
			model.addAttribute("beamList", reserveBeamList);
			result = "schedule/beamReservationList";
		}*/
		return result;
	}
	
	//사원번호별 자산 예약 조회
	@GetMapping("/reservationlistbyno.do")
	public String reservationListByNo(@RequestParam int empNo, Model model) {
		List<Schedule> MyReserveList = scheduleService.selectReserveByNo(empNo);
		model.addAttribute("MyReserveList", MyReserveList);
		return "schedule/reservationList";
	
	}
	
	
	/*
	 * @GetMapping("/reservationlistend.do") public String reservationListEnd(String
	 * calCode,Model model) { if(calCode==null) { List<Schedule> reservList =
	 * scheduleService.selectReserveAll(); model.addAttribute("reList",
	 * resourceList); return "" }if
	 */
	//}

	
	//자산 목록 조회
	@GetMapping("/resourcelist.do")
	public String resourceList(Model model) {
		List<Resource> resourceList = scheduleService.selectResourceAll();
		model.addAttribute("reList", resourceList);
		return "schedule/resourceList";
	}
	
	
	//자산 예약 
		@PostMapping("/reserveResourceEnd.do")
		public String reserveResourceEnd(@RequestParam Map<String, Object> param, Model model){
			
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);
			
			int result = 0;
			
			int resourceNo = Integer.parseInt((String) param.get("resourceNo"));
			String startDateString = (String) param.get("start");
			String endDateString = (String) param.get("end");
			//String calColor = (String) param.get("backgroundColor");
			String calCode = (String) param.get("code");
			String reminderYn = (String) param.get("reminder");

			Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
			Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

			Schedule schedule = Schedule.builder() 
					.calStartDate(calStartDate)
					.calEndDate(calEndDate)
					.calCode(calCode)
					.reminderYn(reminderYn)
					.build();
			
			System.out.println(schedule);
			
			result=scheduleService.reserveResource(schedule,resourceNo);
			
			String msg, loc;
			if(result>0) {
				msg="예약성공";
				loc="schedule/reservationlist.do";
			}else {
				msg="예약실패";
				loc="schdule/reserveResource.do";
			}
			
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
			
			
			return "schedule/msg";
		}
	
	
	//자산 예약 페이지 연결
	@GetMapping("/reserveResource.do")
	public String reserveResource() {
		return "schedule/reservationResource";
	}
	
	//자산 등록
	@PostMapping(value = "/insertresource.do", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Resource insertResource(@RequestBody Resource resource) throws Exception {
		int result = scheduleService.insertResource(resource);
		return result>0?resource:null;
		
		
	}
	
	
	
	
		
		
	}
	