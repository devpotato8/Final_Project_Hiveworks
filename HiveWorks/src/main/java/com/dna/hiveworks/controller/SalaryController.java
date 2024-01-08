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

import com.dna.hiveworks.model.dto.Employee;
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
		
		model.addAttribute("list",list);
		
		return "salary/salaryList";
	}
	
	@GetMapping("/salaryDetail")
	public String selectSalaryByNo(int sal_no, Model model) {
		
		Salary sal = service.selectSalaryByNo(sal_no);
		
		model.addAttribute("salary",sal);
		
		return "salary/salaryDetail";
	}
	
	@GetMapping("/updateSalaryDetail")
	public String updateSalaryDetailByNo(int sal_no, Model model) {
		
		Salary sal = service.selectSalaryByNo(sal_no);
		
		model.addAttribute("salary",sal);
		
		return "salary/updateSalaryDetail";
	}
	
	@PostMapping("/updateSalaryDetailEnd")
	public String updateSalaryDetailEnd(Salary s, Model model) {
		
		String msg, loc;
		
		try {
			int result = service.updateSalary(s);
			
			msg="업데이트 성공";
			loc="salary/salaryList";
			
			
		}catch(RuntimeException e) {
			msg="업데이트 실패";
			loc="salary/salaryList";
	
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@GetMapping("/salaryWrite")
	public String salaryWrite() {
		
		return "salary/salaryWrite";
	}
	
	@PostMapping("/SalaryWriteEnd")
	public String insertSalary(Salary s, Model model, Employee emp) {
		
		s.setEmployee(emp);
		
		String msg, loc;
		
		System.out.println(s);
		
		try {
			int result = service.insertSalary(s);
			
			msg="급여 추가 성공";
			loc="salary/salaryList";
			
			
		}catch(RuntimeException e) {
			msg="급여 추가 실패";
			loc="salary/salaryList";
	
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		
		return "common/msg";
	}
	
	
	@GetMapping("/calculateSalary")
	public @ResponseBody Map<String, Integer> calculateSalary(int total, int notax) {
		
		Map<String, Integer> data = new HashMap<>(); 
		
		data.put("o_total", null);
		data.put("o_actual", null);
		data.put("o_pension", null);
		data.put("o_insurance", null);
		data.put("o_nursing", null);
		data.put("o_employ", null);
		data.put("o_income", null);
		data.put("o_local", null);
		data.put("i_total", total);
		data.put("i_non_tax", notax);
		
		service.calculateSalary(data);
		
		return data;
	}
	
}
