package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/MyloginPage")
	public String loginPage() {
		return "common/loginPage";
	}
	
}
