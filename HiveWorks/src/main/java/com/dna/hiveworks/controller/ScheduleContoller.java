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

import com.dna.hiveworks.model.dto.CheckList;
import com.dna.hiveworks.model.dto.Comment;
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
	@GetMapping("/schedulelist")
	public String scheduleList(Model model) {
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		return "schedule/scheduleList";
	}

	// 일정 조회
	@GetMapping("/schedulelistend")
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
		if (searchType.indexOf('D') > -1) {param.put("searchTypeD", "D");}

		List<Schedule> searchList = scheduleService.searchSchedule(param);
		
		System.out.println("서치스케쥴"+searchList);
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
	public ResponseEntity<Map<String,Object>> searchVacation(@RequestBody Map<String, Object> param){
		int empNo = (Integer)param.get("empNo");
		List<Vacation> searchList =  vacationservice.selectVacationByNo(empNo);
		searchList = searchList.stream().filter(vac->vac.getVacPermit()!=null&&!vac.getVacPermit().equals("반려")).toList();
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("searchList",searchList));
	}
	

	//일정 등록
	@PostMapping(value = "/insertschedule", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Object> insertSchedule(@RequestBody Map<String, Object> param) throws Exception {
		
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
	
	// 프로젝트 등록
	@PostMapping("/insertproject")
	public String insertProject(@RequestParam Map<String, Object> param, Model model, String[] calEmp) {
		
		log.debug(Arrays.toString(calEmp));
		
		  param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		 instanceof String)); });
		 

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);

		int result = 0;
		String calSubject = (String) param.get("title");
		String calStatus = (String) param.get("status");
		String calContent = (String) param.get("content");
		String startDateString = (String) param.get("start");
		String endDateString = (String) param.get("end");
		String calAlldayYn = (String) param.get("allday");
		String calCode = (String) param.get("code");
		String calColor = (String) param.get("backgroundColor");
		int empNo = Integer.parseInt((String) param.get("empno"));

		
	    int[] empList = new int[calEmp.length];
        
        for (int i = 0; i < calEmp.length; i++) {
        	empList[i] = Integer.parseInt(calEmp[i]);
        }

		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

		Schedule schedule = Schedule.builder().calStartDate(calStartDate).calEndDate(calEndDate).calCode(calCode).myEmpNo(empNo)
				.creater(empNo).modifier(empNo).calColor(calColor).calSubject(calSubject).calContent(calContent).calStatus(calStatus).build();

		result = scheduleService.insertProject(schedule, empList);

		String msg, loc;
		if (result > 0) {
			msg = "프로젝트 등록 성공";
			loc = "schedule/projectlist";
		} else {
			msg = "프로젝트 등록 실패 ";
			loc = "schdule/projectlist";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";
	}
	
	

		
	// 일정 수정
	@PostMapping(value= "/updateschedule", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Object> updateSchedule(@RequestBody Map<String, Object> param){///@RequestParam(name="reempList", required = false) List<String> param2
		

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);
		
	
		  param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		  instanceof String)); });
		 
		
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
	
	
	//프로젝트 수정
	@PostMapping(value= "/updateproject", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Schedule updateProject(@RequestBody Map<String, Object> param){///@RequestParam(name="reempList", required = false) List<String> param2
		

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);
		
	
		  param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		  instanceof String)); });
		 
		
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
		int calNo = Integer.parseInt((String)param.get("recalno"));
		int reempNo = (Integer)param.get("reempno");
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
		  calContent).calNo(calNo)
		  .reminderYn(reminderYn).calAlldayYn(calAlldayYn).calStatus(calStatus).
		  modifier(reempNo).build();
		 
		 
		  result = scheduleService.updateSchedule(schedule, reempList, calNo);
		  
		  return result>0?schedule:null;
		
		
		
		
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
	@ResponseBody
	public ResponseEntity<Object> deleteSchedule(@RequestBody Map<String, Object> param, Model model) {
		//int calNo = (Integer)param.get("calNo");
		int calNo = (Integer)param.get("calNo");
		int result = scheduleService.deleteSchedule(calNo);
		
		return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
			  ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
	}

	// 프로젝트 조회
	@GetMapping("/projectlist")
	public String projectList(Model model) {
		List<Schedule> projectList = scheduleService.selectprojectAll();
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("projectList", projectList);
		return "schedule/projectList";
	}

	//프로젝트 상세 조회
	/*
	 * @GetMapping("/projectlistbycalno")
	 * 
	 * @ResponseBody public ResponseEntity<Schedule>
	 * projectListByCalNo(@RequestParam int calNo, Model model) { Schedule project =
	 * scheduleService.selectprojectByCalNo(calNo); return
	 * ResponseEntity.ok(project); }
	 */

	// 사원번호별 프로젝트 조회
	@GetMapping("/projectlistbyempno")
	public String projectListByEmpNo(@RequestParam int empNo, Model model) {
		List<Schedule> myProjectList = scheduleService.selectprojectByEmpNo(empNo);
		List<Department> deptList = deptservice.deptListAll();
		List<Employee> empList = scheduleService.selectEmployeesList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("myProjectList", myProjectList);
		return "schedule/myProjectList";
	}
	
	
	//일정 상세 조회
	@GetMapping("/scheduleListByCalNo")
	@ResponseBody
	public ResponseEntity<Schedule> scheduleListByCalNo(@RequestParam int calNo, Model model) {
		Schedule schedule = scheduleService.scheduleListByCalNo(calNo);
		 return ResponseEntity.ok(schedule);
	}
	
	//체크리스트 조회
	@GetMapping("/checkListByCalNo")
	@ResponseBody
	public ResponseEntity<List<CheckList>> checkListByCalNo(@RequestParam int calNo, Model model) {
		List<CheckList> checklist = scheduleService.checkListByCalNo(calNo);
		 return ResponseEntity.ok(checklist);
	}
	
	
	

	// 체크리스트 등록
	@PostMapping("/insertChecklist")
	@ResponseBody
	public int insertChecklist(@RequestBody Map<String, Object> param) throws Exception {
	    int empNo = (Integer) param.get("empNo");
        String checklistValue = (String) param.get("checklistValue");
        int calNo = Integer.parseInt((String)param.get("calNo"));

        CheckList checklist = CheckList.builder()
                .checkCalNo(calNo)
                .calChecklistContent(checklistValue)
                .creater(empNo)
                .modifier(empNo)
                .build();

        int result = scheduleService.insertChecklist(checklist);
        
        int checklistNo = checklist.getCalChecklistNo();

        if(result == 0) {
            throw new Exception("체크리스트 등록에 실패했습니다.");
        }
        // 체크리스트 등록 성공 시
        return checklistNo;
    } 

	          
	
	
	
	
	
	//체크리스트 삭제
		@PostMapping("/deleteChecklist")
		@ResponseBody
		public ResponseEntity<Object> deleteChecklist(@RequestBody Map<String, Object> param){	
			System.out.println("파람람"+param);
		    int checklistNo = Integer.parseInt((String)param.get("checklistNo"));
		    
		    int result = scheduleService.deleteChecklist(checklistNo);

		    return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
		          ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
		}
		
		//체크리스트 done 표시
				@PostMapping("/doneChecklist")
				@ResponseBody
				public ResponseEntity<Object> doneChecklist(@RequestBody Map<String, Object> param){	
					System.out.println("파람람"+param);
					int checklistNo = Integer.parseInt((String)param.get("checklistNo"));
				    
				    int result = scheduleService.doneChecklist(checklistNo);

				    return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
				          ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
				}
				
		//체크리스트 undone으로 변경 
				@PostMapping("/undoneChecklist")
				@ResponseBody
				public ResponseEntity<Object> undoneChecklist(@RequestBody Map<String, Object> param){	
					System.out.println("파람람"+param);
					int checklistNo = Integer.parseInt((String)param.get("checklistNo"));
				    
				    int result = scheduleService.undoneChecklist(checklistNo);

				    return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
				          ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
				}
		
		//댓글 등록
		@PostMapping("/insertComment")
		@ResponseBody
		public Comment insertComment(@RequestBody Map<String, Object> param) throws Exception {
		    int empNo = (Integer) param.get("empNo");
	        String commentText = (String) param.get("commentText");
	        int calNo = Integer.parseInt((String) param.get("calNo"));
	        int calCommentLevel = (Integer) param.get("calCommentLevel");
	        int calCommentRef = (Integer) param.get("calCommentRef");
	        

	        Comment comment = Comment.builder().calNo(calNo).calCommentContent(commentText)
	        		.calCommentLevel(calCommentLevel).calCommentRef(calCommentRef).creater(empNo).modifier(empNo).build();

	        int result = scheduleService.insertComment(comment);
	        
	        int calCommenttNo = comment.getCalCommentNo();
	        
	        
	        //  댓글 등록 실패 시
	        if(result > 0) {
	        	comment = scheduleService.selectCommentByNo(calCommenttNo);
	        	System.out.println(comment);
	        }else {
	        	  throw new Exception("댓글 등록에 실패했습니다.");
	        }
	        return comment;
	        
	    } 
		
		//댓글 수정
		@PostMapping("/updateComment")
		@ResponseBody
		public Comment updateComment(@RequestBody Map<String, Object> param) throws Exception {
	        String commentText = (String) param.get("commentText");
	        int calCommentNo = Integer.parseInt((String)param.get("calCommentNo"));

	        Comment comment = Comment.builder().calCommentContent(commentText).calCommentNo(calCommentNo).build();

	        int result = scheduleService.updateComment(comment);
	        
	     
	        //  댓글 수정 실패 시
	        if(result == 0) {
	        	throw new Exception("댓글 수정에 실패했습니다.");
	        }

	        return comment;
	          
	    } 
		
		//댓글 삭제
		@PostMapping("/deleteComment")
		@ResponseBody
		public ResponseEntity<Object> deleteComment(@RequestBody Map<String, Object> param) throws Exception {
	        int calCommentNo = Integer.parseInt((String)param.get("calCommentNo"));

	        int result = scheduleService.deleteComment(calCommentNo);
	        
	     
	        //  댓글 수정 실패 시
	        if(result == 0) {
	        	throw new Exception("댓글 삭제에 실패했습니다.");
	        }

	        return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result) :
		          ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
	          
	    } 
				
	
	

	// calcode별로 스케쥴러 나누기
	/*
	 * @GetMapping("/schedulelistend.do")
	 * 
	 * @ResponseBody public List<Schedule> scheduleListEnd(String calCode) { if
	 * (calCode=="C") return scheduleService.selectScheduleAll(calCode); }
	 */

	// 자산 예약 조회
	@GetMapping("/reservationlist")
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
	@GetMapping("/reservationlistbyno")
	public String reservationListByNo(@RequestParam int empNo, Model model) {
		List<Schedule> MyReserveList = scheduleService.selectReserveByNo(empNo);
		List<Resource> resourceList = scheduleService.selectResourceAll();
		model.addAttribute("MyReserveList", MyReserveList);
		model.addAttribute("reList", resourceList);
		return "schedule/myReservationList";

	}
	
	//날짜별 자산 예약 조회
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
	
	//자산별 예약 목록 조회
	@PostMapping("/selectReserveByresource")
	@ResponseBody
	public List<Schedule> selectReserveByresource(@RequestBody Map<String, Object> param){
		
		param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
				  instanceof String)); });
		System.out.println(param);
		
		int resourceNo = (Integer)param.get("resourceNo");

		System.out.println(resourceNo);
		
		List<Schedule> ReserveListByresource = scheduleService.selectReserveByresource(resourceNo);

		return ReserveListByresource;
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
	@GetMapping("/resourcelist")
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
	
	//자산 예약 type/keyword로 조회
	@PostMapping("/reserveBykeyword")
	@ResponseBody
	public List<Schedule> reserveBykeyword(@RequestParam Map<String, Object> param){
		
		int empNo = Integer.parseInt((String)param.get("empNo"));
		String type = (String)param.get("type");
		String keyword = (String)param.get("keyword");
		System.out.println("컨트롤러"+type+keyword);
		List<Schedule> reserveBykeyword = scheduleService.reserveBykeyword(keyword, type, empNo);
		System.out.println(reserveBykeyword);
		return reserveBykeyword;
		
	}
	
	
	// 자산 예약 페이지 연결
	@GetMapping("/reserveResource")
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
	@PostMapping("/reserveResourceEnd")
	public String reserveResourceEnd(@RequestParam Map<String, Object> param, Model model, String[] calEmp) {
		
		log.debug(Arrays.toString(calEmp));
		
		  param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		 instanceof String)); });
		 

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);

		int result = 0;
		int empNo = Integer.parseInt((String)param.get("empNo"));
		int resourceNo = Integer.parseInt((String) param.get("resourceNo"));
		String startDateString = (String) param.get("resstart");
		String endDateString = (String) param.get("resend");
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
		if (calEmp.length > 0) {
			 for (int i = 0; i < calEmp.length; i++) {
		        	empList[i] = Integer.parseInt(calEmp[i]);
		        }
		}
		
		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

		Schedule schedule = Schedule.builder().calStartDate(calStartDate).calEndDate(calEndDate).calCode(calCode).myEmpNo(empNo)
				.reminderYn(reminderYn).creater(empNo).modifier(empNo).calColor(calColor).calSubject(calSubject).build();

		result = scheduleService.reserveResource(schedule, resourceNo, empList);

		String msg, loc;
		if (result > 0) {
			msg = "예약성공";
			loc = "schedule/reservationlistbyno?empNo="+empNo;
		} else {
			msg = "예약실패";
			loc = "schdule/reserveResource";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";
	}
	
	//자산 예약 수정
	@PostMapping("/updateReservationEnd")
	public String updateReservationEnd(@RequestParam Map<String, Object> param, Model model, String[] recalEmp) {
		
		
		/*
		 * param.forEach((key,value)->{ System.out.println(key+" : "+value + (value
		 * instanceof String)); });
		 */
		 

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm", Locale.KOREA);

		int result = 0;
		int calNo = Integer.parseInt((String)param.get("calNo"));
		int empNo = Integer.parseInt((String)param.get("empNo"));
		int resourceNo = Integer.parseInt((String) param.get("resourceNo"));
		String startDateString = (String) param.get("upstart");
		String endDateString = (String) param.get("upend");
		String calColor = (String) param.get("backgroundColor");
		String calCode = (String) param.get("code");
		String calSubject = "";
		switch(calCode) {
		case "CAL004": calSubject = "회의실 예약"; break;
		case "CAL005": calSubject = "차량 예약"; break;
		case "CAL006": calSubject = "빔프로젝터 예약"; break;
		}
		
		String reminderYn = (String) param.get("reminder");
		
		int[] empList;
		if (recalEmp != null && recalEmp.length > 0) {
		    empList = new int[recalEmp.length];
		    for (int i = 0; i < recalEmp.length; i++) {
		        empList[i] = Integer.parseInt(recalEmp[i]);
		    }
		} else {
		    empList = new int[0];
		}

		Timestamp calStartDate = Timestamp.valueOf(LocalDateTime.parse(startDateString, dateTimeFormatter));
		Timestamp calEndDate = Timestamp.valueOf(LocalDateTime.parse(endDateString, dateTimeFormatter));

		Schedule schedule = Schedule.builder().calNo(calNo).calStartDate(calStartDate).calEndDate(calEndDate).calCode(calCode).myEmpNo(empNo)
				.reminderYn(reminderYn).creater(empNo).modifier(empNo).calColor(calColor).calSubject(calSubject).build();

		result = scheduleService.updateReservation(schedule, calNo, empList);

		String msg, loc;
		if (result > 0) {
			msg = "예약 수정 성공";
			loc = "schedule/reservationlistbyno?empNo="+empNo;
		} else {
			msg = "예약 수정 실패";
			loc = "schdule/reserveResource";
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
	@PostMapping("/insertresource")
	public String insertResource(Resource resource, Model model) throws Exception {
		int result = scheduleService.insertResource(resource);
		String msg, loc;
		if (result > 0) {
			msg = "등록 성공";
			loc = "schedule/resourcelist";
		} else {
			msg = "등록 실패";
			loc = "schdule/resourcelist";
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
			loc = "schedule/resourcelist";
		} else {
			msg = "수정 실패";
			loc = "schdule/resourcelist";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "schedule/msg";

	}
	
	//자산 삭제
	@PostMapping("/deleteResource")
	@ResponseBody
	public int deleteResource(@RequestBody List<Integer> checkedList) throws Exception {
	    int result = 0;

	    if (checkedList != null && !checkedList.isEmpty()) {
	        result = scheduleService.deleteResource(checkedList);
	    }
	    
	    if(result == 0) {
            throw new Exception("자산 삭제에 실패했습니다.");
        }
 
        return result;
	}
	
	
	
	

}
