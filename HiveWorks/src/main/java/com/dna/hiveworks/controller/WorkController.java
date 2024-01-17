package com.dna.hiveworks.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.View;

import com.dna.hiveworks.common.ExcelWorkListConvert;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.service.WorkService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/work")
public class WorkController {
	
	private final WorkService service;
	
	@GetMapping("workList")
		public String workList(Model m) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		// 평균 출근시간
		String avgStartWork = service.avgStartWork(empNo);
		m.addAttribute("avgStartWork",avgStartWork);
		
		// 평균 퇴근시간
		String avgEndWork = service.avgEndWork(empNo);
		m.addAttribute("avgEndWork",avgEndWork);
		
		// 근무 시간 초과
		int overWork = service.overWork(empNo);
		m.addAttribute("overWork",overWork);
		
		// 지각
		int lateWork = service.lateWork(empNo);
		m.addAttribute("lateWork",lateWork);
		
		// 조퇴
		int fastEnd = service.fastEnd(empNo);
		m.addAttribute("fastEnd",fastEnd);
		
		// 결근
		int absence = service.absence(empNo);
		m.addAttribute("absence",absence);
		
		return "work/workList";
	}
	
	@GetMapping("workListWeek")
	@ResponseBody
	public Map<String, Object> workListWeek(Model m, @RequestParam("week") Integer week) {
		Map<String, Object> response = new HashMap<>();
		Map<String, Integer> param = new HashMap<>();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		param.put("empNo", empNo);
		param.put("week", week);
		
		String avgStartWork = service.avgStartWorkFilter(param);
		String avgEndWork = service.avgEndWork(empNo);
		int overWork = service.overWork(empNo);
		int lateWork = service.lateWork(empNo);
		int fastEnd = service.fastEnd(empNo);
		int absence = service.absence(empNo);
		
		response.put("avgStartWork", avgStartWork);
		response.put("avgEndWork", avgEndWork);
		response.put("overWork", overWork);
		response.put("lateWork", lateWork);
		response.put("fastEnd", fastEnd);
		response.put("absence", absence);
		
		return response;
	}
	
	@GetMapping("workListMonth")
	@ResponseBody
	public Map<String, Object> workListMonth(Model m, @RequestParam("week") Integer week) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		Map<String, Object> response = new HashMap<>();
		String avgStartWork = service.avgStartWork(empNo);
		String avgEndWork = service.avgEndWork(empNo);
		int overWork = service.overWork(empNo);
		int lateWork = service.lateWork(empNo);
		int fastEnd = service.fastEnd(empNo);
		int absence = service.absence(empNo);
		
		response.put("avgStartWork", avgStartWork);
		response.put("avgEndWork", avgEndWork);
		response.put("overWork", overWork);
		response.put("lateWork", lateWork);
		response.put("fastEnd", fastEnd);
		response.put("absence", absence);
		
		return response;
	}
	
	@GetMapping("workListYear")
	@ResponseBody
	public Map<String, Object> workListYear(Model m, @RequestParam("week") Integer week) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		Map<String, Object> response = new HashMap<>();
		String avgStartWork = service.avgStartWork(empNo);
		String avgEndWork = service.avgEndWork(empNo);
		int overWork = service.overWork(empNo);
		int lateWork = service.lateWork(empNo);
		int fastEnd = service.fastEnd(empNo);
		int absence = service.absence(empNo);
		
		response.put("avgStartWork", avgStartWork);
		response.put("avgEndWork", avgEndWork);
		response.put("overWork", overWork);
		response.put("lateWork", lateWork);
		response.put("fastEnd", fastEnd);
		response.put("absence", absence);
		
		return response;
	}
	
	@GetMapping("workView")
	public String workView(@SessionAttribute("loginEmp")Employee loginEmp , Model m) {
		//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		//Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		
		List<Work> selectWorkListAllByEmp = service.selectWorkListAllByEmp(empNo);
		m.addAttribute("workView", selectWorkListAllByEmp);
		return "work/workView";
	}
	
	@RequestMapping("updateStartWork")
	public String updateStartWork(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		int empNo = loginEmp.getEmp_no();
		
		String msg,loc;
		try {
			service.updateStartWork(empNo);
			msg = "오늘 하루도 힘내세요! :)";
			loc = "";
		} catch (RuntimeException e) {
			msg = "이미 누르셨습니다 :(";
			loc = "";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("updateEndWork")
	public String updateEndWork(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		int empNo = loginEmp.getEmp_no();
		
		String msg,loc;
		try {
			service.updateEndWork(empNo);
			msg = "오늘 하루도 고생하셨습니다! :)";
			loc = "";
		} catch (RuntimeException e) {
			msg = "이미 누르셨습니다 :(";
			loc = "";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("exceldownload")
	public View exceldownload(@SessionAttribute("loginEmp")Employee loginEmp , Model m) {
		
		int empNo = loginEmp.getEmp_no();
		
		List<Work> selectWorkListAllByEmp = service.selectWorkListAllByEmp(empNo);
		m.addAttribute("workView", selectWorkListAllByEmp);
		return new ExcelWorkListConvert();
	}
	
	
}
