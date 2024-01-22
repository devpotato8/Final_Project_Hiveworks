package com.dna.hiveworks.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;
import com.dna.hiveworks.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final MypageService service;
	
	@GetMapping("myprofile")
	public String myprofile(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		
		int empNo = loginEmp.getEmp_no();
		Employee employee = service.selectMyInfo(empNo);
		m.addAttribute("employee", employee);
		return "mypage/myprofile";
	}
	@GetMapping("myvacation")
	public String myvacation() {
		return "mypage/myvacation";
	}
	@GetMapping("editmyprofile")
	public String editmyprofile(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		int empNo = loginEmp.getEmp_no();
		Employee employee = service.selectMyInfo(empNo);
		m.addAttribute("employee", employee);
		return "mypage/editmyprofile";
	}
	
	@GetMapping(value = "integratedsearch", produces = "application/json")
	@ResponseBody
	public List<Search> integratedSearch(@RequestParam("keyword") String keyword) {
	    List<Search> search = service.integratedSearch(keyword);
	    return search;
	}
	
	@PostMapping("updateProfile")
	public String updateProfile(Employee employee, @SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		int empNo = loginEmp.getEmp_no();
		Map<String, Object> param = new HashMap<>();
		
		param.put("employee", employee);
		param.put("empNo", empNo);
		int result = service.updateProfile(param);
		
		String msg,loc;
		if(result>0) {
			msg = "회원정보 변경완료 :)";
			loc = "mypage/editmyprofile";
		} else {
			msg = "회원정보 변경실패 :(";
			loc = "mypage/editmyprofile";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
	
	
}
	

