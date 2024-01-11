package com.dna.hiveworks.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dna.hiveworks.model.dto.Account;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.serviceimpl.EmpServiceImpl;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 접근 컨트롤러(rest)
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

@Controller
@RequestMapping("/employees")
@RequiredArgsConstructor
public class EmpController {
	
	private final EmpServiceImpl service;
	
	
	@GetMapping("/{empId}")
	public ResponseEntity<Employee> selectEmployeeById(@PathVariable String empId) {
		Employee e = service.selectEmployeeById(empId);
		return ResponseEntity.status(HttpStatus.OK).body(e);
	}
	
	@GetMapping("/employeeList")
	public String selectEmployeesListAll(Model model) {

		
		List<Employee> employees = service.selectEmployeesListAll();
		
		
		model.addAttribute("employees",employees);
		
		
		return "employees/employeeList";
	}
	
	
	@GetMapping("/searchEmployees")
	public void searchEmployeesByKeyword(String keyword, HttpServletResponse response) throws IOException {
		
		Map<String,Object> param = new HashMap<>();
		
		param.put("type","emp_no");
		param.put("keyword", keyword);
		
		List<Employee> searchEmployee = service.searchEmployeesByKeyword(param);
		
		String csv="";
		for(int i=0;i<searchEmployee.size();i++) {
			if(i!=0) csv+=",";
			csv+=searchEmployee.get(i).getEmp_no();
		}
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(csv);
		
		
	}
	
	@PostMapping("/searchEmployees")
	public @ResponseBody List<Employee> searchEmployeesByKeywordSeach(String keyword){
		
		Map<String,Object> param = new HashMap<>();
		
		param.put("emp_no", keyword);
		
		List<Employee> searchEmployee = service.searchEmployeesByKeyword(param);
		
		return searchEmployee;
	}
	
	@GetMapping("/enrollEmployee")
	public String enrollEmployee(Model model) {
		
				
		Map<String,List<Map<String,Object>>> data = service.selectDataListForEmployee();
		model.addAttribute("data",data);

		return "employees/enrollEmployee";
	}
	
	@PostMapping("/enrollEmployeeEnd.do")
	public String enrollEmployeeEnd(Model model, Employee emp, Account ac) {
		
		String msg, loc;
		Map<String,Object> empData = new HashMap<>();
		
		empData.put("employee", emp);
		empData.put("account", ac);

		try {
			int result = service.insertEmployee(empData);
			
			msg="직원 등록 성공";
			loc="employees/employeeList";
			
			
		}catch(RuntimeException e) {
			msg="직원 등록 실패";
			loc="employees/employeeList";
	
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@GetMapping("/searchEmployeeId")
	public @ResponseBody String searchemployeeId(String emp_id){
		
		String msg ="";
		Map<String,Object> param = new HashMap<>();
		
		param.put("type","emp_id");
		param.put("keyword",emp_id);
		
		List<Employee> result = service.searchEmployeesByKeyword(param);
		
		if(result.size()>0) {
			msg="중복된 아이디입니다.";
		}else {
			msg="사용할 수 있는 아이디입니다.";
		}
		
		return msg;
	}
	
	
}
