package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final MypageService service;
	
	@GetMapping("myprofile")
	public String myprofile(Model m) {
		int empNo = 1;
		Employee employee = service.selectMyInfo(empNo);
		m.addAttribute("employee", employee);
		return "mypage/myprofile";
	}
	@GetMapping("myvacation")
	public String myvacation() {
		return "mypage/myvacation";
	}
	@GetMapping("editmyprofile")
	public String editmyprofile(Model m) {
		int empNo = 1;
		Employee employee = service.selectMyInfo(empNo);
		m.addAttribute("employee", employee);
		return "mypage/editmyprofile";
	}
	
	
	
	
}
	

