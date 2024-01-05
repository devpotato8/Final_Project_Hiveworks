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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	/*
	 * public List<Schedule> selectScheduleAll() { return
	 * scheduleService.selectScheduleAll();
	 */
		
		/*
		 * List<Schedule> listAll = scheduleService.selectSchduleAll();
		 * 
		 * JSONObject jsonObj = new JSONObject(); JSONArray jsonArr = new JSONArray();
		 * 
		 * HashMap<String, Object> hash = new HashMap<>();
		 * 
		 * 
		 * for (int i = 0; i < listAll.size(); i++) { hash.put("title",
		 * listAll.get(i).getCalSubject()); hash.put("start",
		 * listAll.get(i).getCalStartDate()); hash.put("end",
		 * listAll.get(i).getCalEndDate());
		 * 
		 * jsonObj = new JSONObject(hash); jsonArr.add(jsonObj);
		 * 
		 * log.info("jsonArrCheck: {}", jsonArr); return jsonArr;
		 */
		
	//}

	@GetMapping("/reservationlist.do")
	public String reservationList() {
		return "schedule/reservationList";
	}

	@GetMapping("/projectlist.do")
	public String projectList() {
		return "schedule/projectList";
	}
	
	@GetMapping("/reservationinsert.do")
	public String reservationInsert() {
		return "schedule/reservationResource";
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
	
	@PostMapping("/reserveResource.do")
	public String reserveResource(Schedule schedule, Model model){
		int result=scheduleService.reserveResource(schedule);
		
		String msg, loc;
		if(result>0) {
			msg="예약성공";
			loc="schedule/reservationinsert.do";
		}else {
			msg="예약실패";
			loc="schdule/reserveResource.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "schedule/msg";
	}
		
		
	}
	