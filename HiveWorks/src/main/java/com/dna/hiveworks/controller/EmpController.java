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
import org.springframework.security.config.annotation.authentication.configurers.ldap.LdapAuthenticationProviderConfigurer.PasswordCompareConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.dna.hiveworks.common.ExcelEmployeeListConvert;
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
	
	private final BCryptPasswordEncoder passwordEncoder;
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
		
		param.put("type", "emp_no");
		param.put("keyword", keyword);
		
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
			Account ac,@RequestPart(value="upFile", required = false) MultipartFile upFile, HttpSession session, String email_id,@RequestParam(name="email_form" , required=true) String email_form,
			@RequestParam("creater_pre") String creater) {
		
		String path = session.getServletContext().getRealPath("/resources/upload/profile");
		
		File folder =  new File(path);
		
		if(!folder.exists()) {
			try {
				folder.mkdir();
			}catch(Exception e) {
				e.printStackTrace();
			}

		}

		if(upFile!=null && !upFile.isEmpty()) {
			String oriName = upFile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date today = new Date(System.currentTimeMillis());
			int randomNum = (int)(Math.random()*10000)+1;
			String reName = "HIVEWORKS_"+(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(today))+"_"+randomNum+ext;
			
			try {
				upFile.transferTo(new File(path,reName));
					emp.setEmp_profile_ori_name(oriName);
					emp.setEmp_profile_re_name(reName);
			}catch(IOException e){
				e.printStackTrace();
			}
			
		}

		String empEmail = email_id+"@"+email_form;
		emp.setEmp_email(empEmail);
		
		String encodePassword = passwordEncoder.encode(emp.getEmp_pw());
		System.out.println(encodePassword);
		
		emp.setEmp_pw(encodePassword);
		
		
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
			loc="employees/enrollEmployee";
			File delFile = new File(path,emp.getEmp_profile_re_name());
			delFile.delete();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@GetMapping("/searchEmployeeId")
	public @ResponseBody int searchemployeeId(String emp_id){
		
		int value =0;
		Map<String,Object> param = new HashMap<>();
		System.out.println(emp_id);
		
		param.put("type","emp_id");
		param.put("keyword",emp_id);
		
		List<Employee> result = service.searchEmployeesByKeyword(param);
		
		if(result.size()>0) {
			value=1;
		}else {
			value=0;
		}
		
		return value;
	}
	
	@GetMapping("/employeeDetail")
	public String employeeDetail(Model model, int emp_no) {
		
		Map<String,Object> value = new HashMap<>();
		
		value = service.selectEmployeeByEmpNo(emp_no);

		model.addAttribute("employee", value.get("employee"));
		model.addAttribute("account",value.get("account"));
		
		return "employees/employeeDetail";
	}
	
	@GetMapping("/updateEmployeeDetail")
	public String updateEmployeeDetail(Model model, int emp_no) {
		Map<String,Object> value = new HashMap<>();
		
		value = service.selectEmployeeByEmpNo(emp_no);
	
		Map<String,List<Map<String,Object>>> data = service.selectDataListForEmployee();
		model.addAttribute("data",data);
		model.addAttribute("employee", value.get("employee"));
		model.addAttribute("account",value.get("account"));
		
		return "employees/updateEmployeeDetail";
	
	}
	
	@GetMapping("/updateEmployeePassword")
	public String updateEmployeePassword(Model model, int emp_no) {
		
		Map<String,Object> value = new HashMap<>();
		
		value = service.selectEmployeeByEmpNo(emp_no);
	
		Map<String,List<Map<String,Object>>> data = service.selectDataListForEmployee();
		model.addAttribute("data",data);
		model.addAttribute("employee", value.get("employee"));
		
		
		return "employees/updateEmployeePassword";
	}
	
	@PostMapping("/updatePassword")
	public @ResponseBody int updatePassword(Model model,
			@RequestParam("empId") String empId,
			@RequestParam("empPassword") String empPassword,
			@RequestParam("empPasswordNew") String empPasswordNew,
			@RequestParam("modifier") int modifier) {
		
		Map<String,Object> IdAndPassword = new HashMap<>();
		
		
		
		IdAndPassword.put("empId", empId);
		IdAndPassword.put("empPassword", empPassword);
		IdAndPassword.put("empPasswordNew", empPasswordNew);
		IdAndPassword.put("modifier", modifier);
		
		int result =service.updatePassword(IdAndPassword);
		
		
		return result;
	}
	
	@PostMapping("updateEmployeeEnd.do")
	public String updateEmployeeEnd (Model model, Employee emp,
			Account ac,@RequestPart(value="upFile", required = false) MultipartFile upFile, HttpSession session, String email_id,
			@RequestParam(name="email_form" , required=true) String email_form, @RequestParam(name="pre_file", required = false) String pre_file) {
		
	
		String path = session.getServletContext().getRealPath("/resources/upload/profile");
		
		File folder =  new File(path);
		
		if(!folder.exists()) {
			try {
				folder.mkdir();
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
		
		//새로운 파일이 있다면
		if(upFile!=null && !upFile.isEmpty()) {
			//이전 파일 삭제
			if(pre_file!=null && pre_file!="") {
				File preFile = new File(path,pre_file);
				preFile.delete();				
			}
			
			//이름 부여
			String oriName = upFile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date today = new Date(System.currentTimeMillis());
			int randomNum = (int)(Math.random()*10000)+1;
			String reName = "HIVEWORKS_"+(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(today))+"_"+randomNum+ext;
			
			try {
				upFile.transferTo(new File(path,reName));
					emp.setEmp_profile_ori_name(oriName);
					emp.setEmp_profile_re_name(reName);
			}catch(IOException e){
				e.printStackTrace();
			}
			
		}

		String empEmail = email_id+"@"+email_form;
		emp.setEmp_email(empEmail);
		
		String msg, loc;
		Map<String,Object> empData = new HashMap<>();
		
		empData.put("employee", emp);
		empData.put("account", ac);
		
		
		try {
			int result = service.updateEmployee(empData);
			
			msg="정보 수정 성공";
			loc="employees/employeeList";

		}catch(RuntimeException e) {
			msg="정보 수정 실패";
			loc="employees/enrollEmployee";
			File delFile = new File(path,emp.getEmp_profile_re_name());
			delFile.delete();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	
	
	
	
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("emp_no") int emp_no, Model model) {
		
		
		//int empNo = Integer.parseInt(emp_no);
		
		String msg,loc;
		try {
			int result = service.deleteEmployee(emp_no);
			
			msg="직원 삭제 성공";
			loc="employees/employeeList";

		}catch(RuntimeException e) {
			msg="직원 삭제 실패";
			loc="employees/employeeList";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@GetMapping("/manageAuthority")
	public String manageAuthority(Model model) {
		
		List<Employee> employees = service.selectEmployeesListAll();
	
		Map<String, List<Map<String, Object>>> autCodeList = service.selectAuthorityList();
		
		model.addAttribute("employees",employees);
		model.addAttribute("autCodeList", autCodeList);
		
		return "employees/manageAuthority";
	}
	
	@PostMapping("/updateAuthorities")
	public @ResponseBody int updateAuthorities(@RequestBody Map<String, List<String>> data ) {

		int result = service.updateAuthorities(data);
		
		return result;
	
	}

	@GetMapping("excelEmployeeDownload")
	public View downloadEmployeesAndAccount(Model model) {
		
		Map<String, Object> employeesAndAccounts = service.downloadEmployeesAndAccount();
		
		model.addAttribute("employees", employeesAndAccounts.get("employees"));
		model.addAttribute("accounts", employeesAndAccounts.get("accounts"));
		
		return new ExcelEmployeeListConvert();
	}
	
}
