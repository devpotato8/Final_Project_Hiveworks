package com.dna.hiveworks.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;
import com.dna.hiveworks.service.ScheduleService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleContoller {

	private static final Logger log = LoggerFactory.getLogger(ScheduleContoller.class);

	private final ScheduleService scheduleService;
	
	
	@GetMapping("/schedulelist.do")
	public String scheduleList() {
		return "schedule/scheduleList";
	}
	
	@GetMapping("/schedulelistend.do")
	@ResponseBody
	public List<Schedule> scheduleListEnd() {
		return scheduleService.selectScheduleAll();
	};
	
	@GetMapping("/projectlist.do")
	public String projectList(Model model) {
		List<Schedule> projectList = scheduleService.selectprojectAll();
		model.addAttribute("projectList", projectList);
		return "schedule/projectList";
	}
	
	@GetMapping("/projectlistbyno.do")
	public String projectListByNo(@RequestParam int empNo, Model model) {
		List<Schedule> myProjectList = scheduleService.selectprojectByNo(empNo);
		model.addAttribute("myProjectList", myProjectList);
		return "schedule/projectList";
	}
	

	//calcode별로 스케쥴러 나누기
	/*
	 * @GetMapping("/schedulelistend.do")
	 * 
	 * @ResponseBody public List<Schedule> scheduleListEnd(String calCode) { if
	 * (calCode=="C") return scheduleService.selectScheduleAll(calCode); }
	 */
	
	

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

	
	@GetMapping("/resourcelist.do")
	public String resourceList(Model model) {
		List<Resource> resourceList = scheduleService.selectResourceAll();
		model.addAttribute("reList", resourceList);
		return "schedule/resourceList";
	}
	

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
				.build();

		result = scheduleService.insertSchedule(schedule);

		return result > 0 ? ResponseEntity.status(HttpStatus.OK).body(result)
				: ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
		
		
		
		
		

	}
	
	@PostMapping(value = "/insertresource.do", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Resource insertResource(@RequestBody Resource resource) throws Exception {
		int result = scheduleService.insertResource(resource);
		return result>0?resource:null;
		
		
	}
	
	@GetMapping("/reserveResource.do")
	public String reserveResource() {
		return "schedule/reservationResource";
	}
	

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
		
		
	}
	