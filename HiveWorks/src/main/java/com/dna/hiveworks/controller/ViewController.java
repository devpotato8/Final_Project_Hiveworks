package com.dna.hiveworks.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dna.hiveworks.model.dto.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ViewController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/login/index")
	public String index(HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		session.setAttribute("loginEmp", loginEmp);
		return "index";
	}
	
	@GetMapping("/MyLoginPage")
	public String loginPage() {
		return "common/loginPage";
	}
	
	@PostMapping("/loginfail")
	public String loginFailPage(HttpServletRequest request, Model model) {
		String referrer = request.getHeader("Referer");
	    model.addAttribute("url", referrer);  //이전 주소를 model에 담아서 보내기
		return "common/loginError";
	}
	
	
	@GetMapping("/insertDeptList")
	public String insertDeptExcel(){
		return "department/deptExcelUpload";
	}
}
