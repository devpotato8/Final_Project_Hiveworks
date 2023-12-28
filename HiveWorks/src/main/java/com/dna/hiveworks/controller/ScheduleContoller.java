package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleContoller {
	
	@GetMapping
	public String schuduleList() {
		return "/schuduleList";
	}

}
