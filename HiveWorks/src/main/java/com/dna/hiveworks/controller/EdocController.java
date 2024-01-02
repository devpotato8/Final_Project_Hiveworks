/**
 * 
 */
package com.dna.hiveworks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dna.hiveworks.common.exception.HiveworksException;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.EdocService;

/**
 * @author : 이재연
 * @since : 2023. 12. 28.
 * Description : 전자문서 접근 컨트롤러
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */
@Controller
@RequestMapping("/edoc")
public class EdocController {
	
	@Autowired
	private EdocService service;
	
	@GetMapping("/lists/{status}")
	public String pendingList(@PathVariable String status, Model model, @SessionAttribute Employee loginEmp) {
		if(loginEmp == null) {
			throw new HiveworksException();
		}
		
		
		
		model.addAttribute("status",status);
		model.addAttribute("currentPage","lists");
		return "edoc/lists";
	}
	@GetMapping("/box/{status}")
	public String documentBox(@PathVariable String status, Model model) {
		
		model.addAttribute("status",status);
		model.addAttribute("currentPage","box");
		return "edoc/lists";
	}
}
