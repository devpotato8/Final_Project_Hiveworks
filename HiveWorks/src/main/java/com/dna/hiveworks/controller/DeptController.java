package com.dna.hiveworks.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.util.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.DeptService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService service;

	@RequestMapping(value="/deptview",method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView tree(ModelAndView mav) {
		mav.setViewName("department/deptView");
		return mav;
	}
	
	//🔻🔻 조직도관리 controller 🔻🔻
	
	@RequestMapping(value="/deptlist",method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Department> deptList(Department dept, Model model) throws Exception{
		List<Department> deptList = service.deptListAll();
		return deptList;
	}
	
	@PostMapping("/insertdept")
	@ResponseBody
	public Map<String, String> insertDept(@RequestBody Department dept){
	    
	    int result = service.insertDept(dept);
	    
	    Map<String, String> response = new HashMap<>();
	    if(result > 0) {
	        response.put("status", "success");
	        response.put("deptCode", dept.getDeptCode());
	    } else {
	        response.put("status", "fail");
	    }
	    return response;
	}
	
	@PostMapping("/updatedept")
	@ResponseBody
	public Map<String, String> updateDept(@RequestBody Department dept){
		
		Map<String, String> response = new HashMap<>();
		response.put("code",dept.getDeptCode());
		response.put("name",dept.getDeptName());
		response.put("upstair",dept.getDeptUpstair());
		
		int result = service.updateDept(response);
		
		if(result > 0) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "fail");
	    }
	    
	    return response;
	}
	
	@PostMapping("/deletedept")
	@ResponseBody
	public Map<String, String> deleteDept(@RequestBody Department dept){
		
		Map<String, String> response = new HashMap<>();
		
		int result = service.deleteDept(dept);
		
		if(result > 0) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "fail");
	    }
	    
	    return response;
	}

	//🔻🔻 구성원관리 controller 🔻🔻	
	//구성원리스트
	@GetMapping("/deptemplist")
	@ResponseBody
	public List<Map<String, Object>> deptEmplist(@RequestParam String deptCode){
		List<Map<String, Object>> employees = service.deptEmpList(deptCode);
		
	    return employees;
	}
	
	//부서명 찾기
	@GetMapping("/searchDeptName")
	@ResponseBody
	public String searchDeptName(@RequestParam String deptCode) {
		String response = service.searchDeptName(deptCode);
		return response;
	}
	
	//부서이동
	@PostMapping("/changeEmpDept")
	@ResponseBody
	public Map<String, String> changeEmpDept(@RequestParam String deptCode, @RequestParam List<String> empIds ){
		Map<String,Object>params = new HashMap<>();
		params.put("empIds", empIds);
		params.put("deptCode", deptCode);
		int result = service.changeEmpDept(params);
		
		Map<String, String> response = new HashMap<>();
		if(result > 0) {
			response.put("status", "success");
	    } else {
	    	response.put("status", "fail");
	    }
	    
	    return response;
	}
	
	@PostMapping("/setleader")
	@ResponseBody
	public Map<String, String> setLeader(@RequestBody Map<String, String> leaderIds){
				
		String newLeaderId = leaderIds.get("newLeaderId");
		String oldLeaderId = leaderIds.get("oldLeaderId");
		
	    int resultNew = service.changeDeptLeader(newLeaderId);
	    int resultOld = 0;
	    if(oldLeaderId!=null) {
	    	resultOld = service.changeDeptLeaderOld(oldLeaderId);
	    }
		Map<String, String> response = new HashMap<>();
		if(resultNew > 0 || resultOld > 0) {
			response.put("status", "success");
	    } else {
	    	response.put("status", "fail");
	    }
	    
	    return response;
	}
	
	@PostMapping("/removeleader")
	@ResponseBody
	public Map<String, String> removeLeader(@RequestParam String id){
		
	    int result = service.removeDeptLeader(id);
		
		Map<String, String> response = new HashMap<>();
		if(result > 0) {
			response.put("status", "success");
	    } else {
	    	response.put("status", "fail");
	    }
	    
	    return response;
	}
	
	@PostMapping("/deptout")
	@ResponseBody
	public Map<String, String> deptEmpOut(@RequestBody List<String> ids){
		Map<String, Object> params = new HashMap<>();
	    params.put("ids", ids);

	    int result = service.deptEmpOut(params);
	    
	    Map<String, String> response = new HashMap<>();
	    if(result > 0) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "fail");
	    }
	    
	    return response;
	}
	
	@GetMapping("/searchEmp")
	@ResponseBody
	public List<Employee> searchEmpByName (@RequestParam String name){
		List<Employee> response = service.searchEmpByName(name);
		return response;
	}
	
	@PostMapping("/addEmpDept")
	@ResponseBody
	public Map<String, String> addEmpDept(@RequestBody Employee emp){
		
		int result = service.addEmpDept(emp);
		
		Map<String, String> response = new HashMap<>();
	    if(result > 0) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "fail");
	    }
	    
	    return response;
	}
	
	@GetMapping("/insertDeptList")
	public String insertDeptExcel(){
		return "department/deptExcelUpload";
	}
		
	@PostMapping("/deptExcelUpload")
	public String uploadExcel(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
	        // 엑셀 파일 파싱 및 DB 저장 서비스 호출
	        boolean isSuccessful = service.parseAndSaveExcel(file);
	        if (isSuccessful) {
	            redirectAttributes.addFlashAttribute("message", "엑셀 파일 처리 성공");
	    		return "redirect:/deptview";
	        } else {
	            redirectAttributes.addFlashAttribute("message", "엑셀 파일 처리 실패");
	    		return "redirect:/insertDeptList";
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("message", "에러 발생: " + e.getMessage());
	        e.printStackTrace();
			return "redirect:/insertDeptList";
	    }
	}
	
	@GetMapping("/sampleDownlaod")
    public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
		// 서버에 저장된 파일의 경로
		String realPath = request.getServletContext().getRealPath("/resources/upload/");
		
        String fileName = "sampleDept.xlsx";
		File sample = new File(realPath+fileName);

        try (FileInputStream fileInputStream = new FileInputStream(sample);
             OutputStream output = response.getOutputStream()) {
            response.reset();
            response.setContentType("application/vnd.ms-excel");
            URLEncoder encoder = new URLEncoder();
            response.setHeader("Content-Disposition", "attachment; filename=" +  encoder.encode(fileName, StandardCharsets.UTF_8));

            byte[] buffer = new byte[1024];
            int b;

            while ((b = fileInputStream.read(buffer)) != -1) {
                output.write(buffer, 0, b);
            }

            output.flush();
        }
    }
	
	//쪽지함에서 모달창에 jstree구현 로직
	@GetMapping("/modalDeptEmp")
	@ResponseBody
	public Map<String,List<?>> modaldeptList(Department dept, Model model) throws Exception{
		List<Department> deptList = service.deptListAll();
		List<Map<String, Object>> empList = service.modalDeptEmpList();
		
		Map<String,List<?>> deptEmpList = new HashMap<>();
		
		deptEmpList.put("deptList", deptList);
		deptEmpList.put("empList", empList);
		
		return deptEmpList;
	}
}
