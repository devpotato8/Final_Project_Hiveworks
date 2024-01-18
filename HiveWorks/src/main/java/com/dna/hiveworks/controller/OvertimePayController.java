package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dna.hiveworks.model.dto.salary.OvertimePay;
import com.dna.hiveworks.serviceimpl.OvertimePayServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/overtimepay")
@RequiredArgsConstructor
public class OvertimePayController {

	private final OvertimePayServiceImpl service;
	
	@GetMapping("/overtimePayList")
	public String selectOvertimePayList(Model model) {
		
		List<OvertimePay> workList = service.selectOvertimePayListAll();
		
		model.addAttribute("workList",workList);
		
		return "overtimepay/overtimePayList";
	}
	
	@GetMapping("/myovertimepay")
	public String selectMyOvertimePayByempNo(Model model, int emp_no) {
		
		List<OvertimePay> myWorkList = service.selectMyOvertimePayByempNo(emp_no);
		
		model.addAttribute("workList",myWorkList);
		
		return "overtimepay/myOvertimePay";
			
	}
	
}
