package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleContoller {
	
	@GetMapping("schedulelist.do")
	public String schuduleList() {
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
	
	
}
