package com.dna.hiveworks.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.service.WorkService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@AllArgsConstructor
public class ViewController {
	
	private final WorkService service; 

	@GetMapping("/")
	public String index(Model m) {
		int empNo = 1;
		Work commute = service.selectCommute(empNo);
		m.addAttribute("commute", commute);
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
	
	@GetMapping("/messageview")
	public String messageView() {
		return "message/message";
	}
}
