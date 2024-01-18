package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/overtimepay")
@RequiredArgsConstructor
public class OvertimePayController {

	@GetMapping("/overtimePayList")
	public String selectOvertimePayList(Model model) {
		
		
		
		
		
		return "overtimepay/overtimePayList";
	}
	
}
