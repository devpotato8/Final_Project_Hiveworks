package com.dna.hiveworks.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.EmpService;

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
	
	private final EmpService service;
	
	
	@GetMapping("/{empId}")
	public ResponseEntity<Employee> selectEmployeeById(@PathVariable String empId) {
		Employee e = service.selectEmployeeById(empId);
		return ResponseEntity.status(HttpStatus.OK).body(e);
	}
	
	@GetMapping("/employeeList")
	public String selectEmployeesListAll() {

		
		return "employees/employeeList";
	}
	
	
	@GetMapping("/searchEmployees")
	public void searchEmployeesByKeyword(String keyword, HttpServletResponse response) throws IOException {
		
		List<Employee> searchEmployee = service.searchEmployeesByKeyword(keyword);
		
		String csv="";
		for(int i=0;i<searchEmployee.size();i++) {
			if(i!=0) csv+=",";
			csv+=searchEmployee.get(i).getEmp_no();
		}
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(csv);
		
		
	}
	
	
}
