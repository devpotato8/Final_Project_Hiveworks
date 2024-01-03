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
	public String applyVacation(Vacation vacation, Model m) {
		
		// 휴가를 신청하면 즉시승인되고 잔여연차가 1 줄어야함
		if(vacation.getVacOption().equals("반차")) {
			vacation.setVacCount(0.5);
			service.insertVacation(vacation);
			service.updateVacation(vacation.getVacCount());
		} else if(vacation.getVacOption().equals("연차")||vacation.getVacOption().equals("병가")||vacation.getVacOption().equals("공가")) {
			vacation.setVacCount(1);
			service.insertVacation(vacation);
			service.updateVacation(vacation.getVacCount());
		} else if(vacation.getVacOption().equals("조의 (부모 / 배우자 / 자녀)")){
			vacation.setVacCount(5);
			service.insertVacation(vacation);
		} else if(vacation.getVacOption().equals("결혼자녀")) {
			vacation.setVacCount(1);
			service.insertVacation(vacation);
		} else {
			vacation.setVacCount(3);
			service.insertVacation(vacation);
		}
//		int result = service.insertVacation(vacation);
//		
//		String msg,loc;
//		if(result>0) {
//			msg = "휴가 신청 완료  :)";
//			loc = "vacation/vacationList";
//		} else {
//			msg = "휴가 신청 실패  :(";
//			loc = "vacation/vacationList";
//		}
//		
//		m.addAttribute("msg",msg);
//		m.addAttribute("loc",loc);
//		
//		return "common/msg";
		return "vacation/vacationList";
	}
	
	
	
	
	
	
	
}
