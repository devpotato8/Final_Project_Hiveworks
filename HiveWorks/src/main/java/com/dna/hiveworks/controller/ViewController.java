package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.service.WorkService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ViewController {
	
	private final WorkService service; 
	
	@GetMapping("/")
	public String loginPage() {
		return "common/loginPage";
	}
	
	@RequestMapping(value="/login/index",method= {RequestMethod.GET, RequestMethod.POST})
	public String index(HttpSession session, Model m) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication == null || authentication instanceof AnonymousAuthenticationToken) {
	        // 인증되지 않은 사용자일 경우 로그인 페이지로 리다이렉트
	        return "redirect:/";
	    }
		
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		session.setAttribute("loginEmp", loginEmp);
		
		// 직원 근무일 가져오기
		List<Work> selectWorkListAllByEmp = service.selectWorkListAllByEmp(empNo);
		
		// 직원 출퇴근기록 가져오기
		Work commute = service.selectCommute(loginEmp.getEmp_no());
		m.addAttribute("commute", commute);
		return "index";
	}
		
	
	@PostMapping("/loginfail")
	public String loginFailPage(HttpServletRequest request, Model model) {
		String referrer = request.getHeader("Referer");
	    model.addAttribute("url", referrer);  //이전 주소를 model에 담아서 보내기
		return "common/loginError";
	}
	
}
