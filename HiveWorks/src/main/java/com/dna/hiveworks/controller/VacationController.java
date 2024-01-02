package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @author : 강진하
 * @since : 2023. 12. 28.
 * Description : 휴가컨트롤러
 * 
 * History :
 * - 작성자 : 강진하, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.service.VacationService;

import lombok.AllArgsConstructor;
@Controller
@AllArgsConstructor
@RequestMapping("/vacation")
public class VacationController {
	
	private final VacationService service;
	
	@GetMapping("managevacation")
	public String worksList(Model m) {
		List<Vacation> vacations = service.selectVacationByNo(1);
		m.addAttribute("vacations", vacations);
		return "vacation/vacationList";
	}
	
//	@GetMapping("selectvacation")
//	public String selectVacation(int no, Model m){
//		List<Vacation> vacations = service.selectVacationByNo(no);
//		m.addAttribute("vacations", vacations);
//		return "vacation/vacationList";
//	}
	
	@PostMapping("applyvacation")
	public String applyVacation(Vacation vacation) {
		int result = service.insertVacation(vacation);
		
		String msg,loc;
		if(result>0) {
			msg = "휴가 신청 완료  :)";
			loc = "vacation/vacationList";
		} else {
			msg = "휴가 신청 실패  :(";
			loc = "vacation/vacationList";
		}
		
		return "vacation/vacationList";
	}
	
	
	
	
	
	
	
}
