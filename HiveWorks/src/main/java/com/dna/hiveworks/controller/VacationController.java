package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.service.VacationService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/vacation")
public class VacationController {
	
	private final VacationService service;
	
	@GetMapping("vacationList")
	public String worksList(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		
		double leftVacation = service.selectLeftVacation(loginEmp.getEmp_no());
		
		m.addAttribute("leftVacation", leftVacation);
		
		return "vacation/vacationList";
	}
	
//	@GetMapping("selectvacation")
//	public String selectVacation(int no, Model m){
//		List<Vacation> vacations = service.selectVacationByNo(no);
//		m.addAttribute("vacations", vacations);
//		return "vacation/vacationList";
//	}
	
	@PostMapping("applyvacation")
	public String applyVacation(Vacation vacation, Model m, @RequestParam("dayAndAfter") String dayAndAfter) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		int result;
		// 휴가를 신청하면 즉시승인되고 잔여연차가 1 줄어야함
		if(vacation.getVacOption().equals("반차")) {
			vacation.setVacCount(0.5);
			vacation.setVacOption(dayAndAfter+"반차");
			log.debug(vacation.getVacOption());
			// 전자문서 insert로직 추가 해야할듯
			
			result = service.insertVacation(vacation, empNo);
			service.updateVacation(vacation.getVacCount(), empNo);
		} else if(vacation.getVacOption().equals("연차")||vacation.getVacOption().equals("병가")||vacation.getVacOption().equals("공가")) {
			vacation.setVacCount(1);
			result = service.insertVacation(vacation, empNo);
			service.updateVacation(vacation.getVacCount(), empNo);
		} else if(vacation.getVacOption().equals("조의 (부모 / 배우자 / 자녀)")){
			vacation.setVacCount(5);
			result = service.insertVacation(vacation, empNo);
			service.updateVacation(vacation.getVacCount(), empNo);
		} else if(vacation.getVacOption().equals("결혼자녀")) {
			vacation.setVacCount(1);
			result = service.insertVacation(vacation, empNo);
			service.updateVacation(vacation.getVacCount(), empNo);
		} else {
			vacation.setVacCount(3);
			result = service.insertVacation(vacation, empNo);
			service.updateVacation(vacation.getVacCount(), empNo);
		}
		
		String msg,loc;
		if(result>0) {
			msg = "휴가 신청 완료  :)";
			loc = "vacation/vacationList";
		} else {
			msg = "휴가 신청 실패  :(";
			loc = "vacation/vacationList";
		}
		
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
		//return "vacation/vacationList";
	}
	
	@GetMapping("vacationView")
	public String vacationView(Model m) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		List<Vacation> vacations = service.selectVacationByNo(empNo);
		m.addAttribute("vacations", vacations);
		return "vacation/vacationView";
	}
	
	
	
	
	
}
