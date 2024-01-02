package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
import com.dna.hiveworks.serviceimpl.VacationServiceImpl;

import lombok.AllArgsConstructor;
@Controller
@AllArgsConstructor
@RequestMapping("/vacation")
public class VacationController {
	
	private final VacationServiceImpl serviceImpl;
	
	@GetMapping("managevacation")
	public String worksList() {
		return "vacation/vacationList";
	}
	
	@PostMapping("applyvacation")
	public Vacation applyVacation(Vacation vacation) {
		serviceImpl.insertVacation(vacation);
		return vacation;
	}
	
	
	
	
	
	
	
}
