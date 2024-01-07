package com.dna.hiveworks.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.service.WorkService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/work")
public class WorkController {
	
	private final WorkService service;
	
	@GetMapping("workList")
	public String workList() {
		return "work/workList";
	}
	@GetMapping("workView")
	public String workView() {
		return "work/workView";
	}
	
	@PostMapping("insertStartWork")
	public String insertStartWork(Model m) {
		
		int result = service.insertWork();
		
		String msg,loc;
		if(result>0) {
			msg = "오늘 하루도 힘내세요! :)";
			loc = "";
		} else {
			msg = "실패 :(";
			loc = "";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
//	@PutMapping("updateEndWork")
//	public String updateEndWork(Model m) {
//		
//		int result = service.insertWork();
//		
//		String msg,loc;
//		if(result>0) {
//			msg = "오늘 하루도 고생하셨습니다! :)";
//			loc = "/";
//		} else {
//			msg = "실패 :(";
//			loc = "/";
//		}
//		m.addAttribute(msg);
//		m.addAttribute(loc);
//		return "common/msg";
//	}
	
	
	
	
	
}
