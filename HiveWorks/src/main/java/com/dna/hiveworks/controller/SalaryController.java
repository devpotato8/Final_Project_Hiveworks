package com.dna.hiveworks.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dna.hiveworks.model.dto.salary.Salary;
import com.dna.hiveworks.serviceimpl.SalaryServiceImpl;

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

	
	private final SalaryServiceImpl service;
	
	@GetMapping("/salaryList")
	public String selectSalaryListAll(Model model, @RequestParam(defaultValue="1") int cPage, @RequestParam(defaultValue="10") int numPerpage){
		List<Salary> list = service.selectSalaryListAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		model.addAttribute(list);
		
		return "salary/salaryList";
	}
	
	
}
