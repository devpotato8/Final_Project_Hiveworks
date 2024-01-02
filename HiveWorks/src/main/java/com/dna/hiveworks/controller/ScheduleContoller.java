package com.dna.hiveworks.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dna.hiveworks.model.dto.Schedule;
import com.dna.hiveworks.service.ScheduleService;

import lombok.RequiredArgsConstructor;

@Controller
//@RestController
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleContoller {
	
	 private static final Logger log = LoggerFactory.getLogger(ScheduleContoller.class);
	
	private final ScheduleService scheduleService;
	
	@GetMapping("schedulelist.do")
	public String schuduleList(){
	//@ResponseBody
//	public List<Map<String, Object>> schuduleList() {
//		
//		List<Schedule> listAll = scheduleService.selectAll();
//		
//		JSONObject jsonObj = new JSONObject();
//        JSONArray jsonArr = new JSONArray();
//        
//        HashMap<String, Object> hash = new HashMap<>();
//        
//
//        for (int i = 0; i < listAll.size(); i++) {
//            hash.put("title", listAll.get(i).getCalSubject());
//            hash.put("start", listAll.get(i).getCalStartDate());
//            hash.put("end", listAll.get(i).getCalEndDate());
//        
//        jsonObj = new JSONObject(hash);
//        jsonArr.add(jsonObj);
//
//	    log.info("jsonArrCheck: {}", jsonArr);
//	    return jsonArr;
//		
//		
		return "schedule/scheduleList";
	}
	
	
	@GetMapping("reservationlist.do")
	public String reservationList() {
		return "schedule/reservationList";
	}
	
	@GetMapping("projectlist.do")
	public String projectList() {
		return "schedule/projectList";
	}
	
	@GetMapping("reservationinsert.do")
	public String reservationInsert() {
		return "schedule/reservationResource";
	}
	
	
	@PostMapping(value="insertschedule.do", consumes= MediaType.APPLICATION_JSON_VALUE) 
	@ResponseBody
	public String insertSchedule(@RequestBody List<Map<String, Object>> param) throws Exception {
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",Locale.KOREA);
		
		for (int i = 0; i < param.size(); i++) {
			
			String calSubject = (String) param.get(i).get("title");
			String startDateString = (String) param.get(i).get("start");
            String endDateString = (String) param.get(i).get("end");
            
            LocalDateTime calStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime calEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            Schedule schedule = Schedule.builder()
            		.calSubject(calSubject)
            		.calStartDate(calStartDate)
            		.calEndDate(calEndDate)
            		.build();
			
		scheduleService.insertSchedule(schedule);
			
		}
		return "/schedule/scheduleList";

		
		
	}
	
	
}
