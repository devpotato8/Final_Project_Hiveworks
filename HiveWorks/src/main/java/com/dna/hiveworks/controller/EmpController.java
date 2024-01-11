package com.dna.hiveworks.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dna.hiveworks.model.dto.Account;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.serviceimpl.EmpServiceImpl;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
	public String enrollEmployeeEnd(Model model, Employee emp,
			Account ac,@RequestPart(value="upFile", required = false) MultipartFile upFile, HttpSession session, String email_id, String email_form) {
		
//		String path = session.getServletContext().getRealPath("/resources/upload/profile");
//		
//		System.out.println("path : " +path);
//		
//		File folder =  new File(path);
//		
//		if(!folder.exists()) {
//			try {
//				folder.mkdir();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//
//		}
//
//		if(upFile!=null && !upFile.isEmpty()) {
//			String oriName = upFile.getOriginalFilename();
//			String ext = oriName.substring(oriName.lastIndexOf("."));
//			Date today = new Date(System.currentTimeMillis());
//			int randomNum = (int)(Math.random()*10000)+1;
//			String reName = "HIVEWORKS_"+(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(today))+"_"+randomNum+ext;
//			
//			try {
//				upFile.transferTo(new File(path,reName));
//					emp.setEmp_profile_ori_name(oriName);
//					emp.setEmp_profile_re_name(reName);
//			}catch(IOException e){
//				e.printStackTrace();
//			}
//			
//		}

		String empEmail = email_id+"@"+email_form;
		emp.setEmp_email(empEmail);
		
		String msg, loc;
		Map<String,Object> empData = new HashMap<>();
		
		empData.put("employee", emp);
		empData.put("account", ac);
		
		System.out.println(empData);
		
		try {
			int result = service.insertEmployee(empData);
			
			msg="직원 등록 성공";
			loc="employees/employeeList";

		}catch(RuntimeException e) {
			msg="직원 등록 실패";
			loc="employees/employeeList";
//			File delFile = new File(path,emp.getEmp_profile_re_name());
//			delFile.delete();
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
