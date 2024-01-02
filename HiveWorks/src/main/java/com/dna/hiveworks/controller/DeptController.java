package com.dna.hiveworks.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.service.DeptService;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService service;
	
	@RequestMapping(value="/deptview",method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView tree(ModelAndView mav) {
		mav.setViewName("department/deptView");
		return mav;
	}
	
	@RequestMapping(value="/deptlist",method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Department> deptList(Department dept, Model model) throws Exception{
		List<Department> deptList = service.deptListAll();
		
		return deptList;
	}
	
//	@PostMapping("/insertdept")
//	public ResponseEntity<Map<String,Object>> insertDept(@RequestBody Department dept){
//		int result = service.insertDept(dept);
//		
//		
//		
//		Map<String, Object> response = new HashMap<>();
//		response.put("id", newDept.getDeptCode());
//		response.put("parent", newDept.getDeptUpstair());
//		response.put("text", newDept.getDeptName());
//		
//		return ResponseEntity.ok(response);
//	}
	
}
