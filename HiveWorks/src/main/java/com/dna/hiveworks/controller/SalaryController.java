package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;


/**
 * @author : 김태하
 * @since : 2023. 12. 28.
 * Description : 급여정보 서비스 구현
 * 
 * History :
 * - 작성자 : 김태하, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

@Controller
@AllArgsConstructor
@RequestMapping("/salary")
public class SalaryController {

	
	//private final SalaryServiceImpl service;
	
	@GetMapping("/salaryList.do")
	public String selectSalaryListAll(Model model, @RequestParam(defaultValue="1") int cPage){
		//List<Salary> list = service.selectSalaryListAll();
		
		//model.addAttribute(list);
		
		return "salary/salaryList";
	}
	
	
}
