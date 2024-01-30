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
import org.springframework.web.bind.annotation.SessionAttribute;

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
	public String selectSalaryListAll(Model model){
		List<Salary> list = service.selectSalaryListAll();
		
		model.addAttribute("list",list);
		
		return "salary/salaryList";
	}
	
	@PostMapping("/salaryDetail")
	public String selectSalaryByNo(@RequestParam("sal_no")int sal_no, Model model) {
		
		
		Salary sal = service.selectSalaryByNo(sal_no);
		
		Map<String, Integer> data = new HashMap<>(); 
		
		int total = sal.getSal_base()+sal.getSal_bonus()+sal.getSal_meal()+sal.getPosition_pay()+sal.getOvertime_pay();
		int nontax = sal.getSal_meal();
		
		
		data.put("o_total", null);
		data.put("o_actual", null);
		data.put("o_pension", null);
		data.put("o_insurance", null);
		data.put("o_nursing", null);
		data.put("o_employ", null);
		data.put("o_income", null);
		data.put("o_local", null);
		data.put("i_total", total);
		data.put("i_non_tax", nontax);

		service.calculateSalary(data);
		
		model.addAttribute("salary",sal);
		model.addAttribute("dedution",data);
		
		return "salary/salaryDetail";
	}
	
	@PostMapping("/updateSalaryDetail")
	public String updateSalaryDetailByNo(int sal_no, Model model) {
		
		Salary sal = service.selectSalaryByNo(sal_no);
		Map<String, Integer> data = new HashMap<>(); 
		
		int total = sal.getSal_base()+sal.getSal_bonus()+sal.getSal_meal()+sal.getPosition_pay()+sal.getOvertime_pay();
		int nontax = sal.getSal_meal();
		
		
		data.put("o_total", null);
		data.put("o_actual", null);
		data.put("o_pension", null);
		data.put("o_insurance", null);
		data.put("o_nursing", null);
		data.put("o_employ", null);
		data.put("o_income", null);
		data.put("o_local", null);
		data.put("i_total", total);
		data.put("i_non_tax", nontax);

		service.calculateSalary(data);
		
		model.addAttribute("salary",sal);
		model.addAttribute("dedution",data);
		
		return "salary/updateSalaryDetail";
	}
	
	@PostMapping("/updateSalaryDetailEnd")
	public String updateSalaryDetailEnd(Salary s, Model model) {
		
		String msg, loc;
		
		System.out.println(s);
		
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
	
	@GetMapping("/deleteSalary")
	public String deleteSalary(int sal_no, Model model) {
		
		String msg, loc;
		
		
		try {
			int result = service.deleteSalary(sal_no);
			
			msg="급여 삭제 성공";
			loc="salary/salaryList";
			
			
		}catch(RuntimeException e) {
			msg="급여 삭제 실패";
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
	
	@GetMapping("/mySalaryList")
	public String selectMySalaryList(Model model, @SessionAttribute("loginEmp")Employee loginEmp ) {
		int emp_no = loginEmp.getEmp_no();
		
		List<Salary> list = service.selectMySalaryList(emp_no);
		
		model.addAttribute("list",list);
	
		return "salary/mySalaryList";
	}
	
}
