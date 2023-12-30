package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * @author : 강진하
 * @since : 2023. 12. 28.
 * Description : 근태컨트롤러
 * 
 * History :
 * - 작성자 : 강진하, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */
@RestController
@Controller
@RequestMapping("/works")
public class WorksController {
	
	@GetMapping
	public String worksList() {
		return "works/worksList";
	}
	
	
	
	
	
	
}
