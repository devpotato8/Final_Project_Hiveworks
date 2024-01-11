package com.dna.hiveworks.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		// 평균 출근시간
		String avgStartWork = service.avgStartWork();
		m.addAttribute("avgStartWork",avgStartWork);
		
		// 평균 퇴근시간
		String avgEndWork = service.avgEndWork();
		m.addAttribute("avgEndWork",avgEndWork);
		
		// 근무 시간 초과
		int overWork = service.overWork();
		m.addAttribute("overWork",overWork);
		
		// 지각
		int lateWork = service.lateWork();
		m.addAttribute("lateWork",lateWork);
		
		// 조퇴
		int fastEnd = service.fastEnd();
		m.addAttribute("fastEnd",fastEnd);
		
		// 결근
		int absence = service.absence();
		m.addAttribute("absence",absence);
		
		return "work/workList";
	}
	
	@GetMapping("workListWeek")
	@ResponseBody
	public Map<String, Object> workListWeek(Model m) {
		Map<String, Object> response = new HashMap<>();
		String avgStartWork = service.avgStartWork();
		String avgEndWork = service.avgEndWork();
		int overWork = service.overWork();
		int lateWork = service.lateWork();
		int fastEnd = service.fastEnd();
		int absence = service.absence();
		
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
	public Map<String, Object> workListMonth(Model m) {
		Map<String, Object> response = new HashMap<>();
		String avgStartWork = service.avgStartWork();
		String avgEndWork = service.avgEndWork();
		int overWork = service.overWork();
		int lateWork = service.lateWork();
		int fastEnd = service.fastEnd();
		int absence = service.absence();
		
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
	public Map<String, Object> workListYear(Model m) {
		Map<String, Object> response = new HashMap<>();
		String avgStartWork = service.avgStartWork();
		String avgEndWork = service.avgEndWork();
		int overWork = service.overWork();
		int lateWork = service.lateWork();
		int fastEnd = service.fastEnd();
		int absence = service.absence();
		
		response.put("avgStartWork", avgStartWork);
		response.put("avgEndWork", avgEndWork);
		response.put("overWork", overWork);
		response.put("lateWork", lateWork);
		response.put("fastEnd", fastEnd);
		response.put("absence", absence);
		
		return response;
	}
	
	@GetMapping("workView")
	public String workView(Model m) {
		List<Work> selectWorkListAllByEmp = service.selectWorkListAllByEmp();
		m.addAttribute("workView", selectWorkListAllByEmp);
		return "work/workView";
	}
	
	@RequestMapping("updateStartWork")
	public String updateStartWork(Model m) {
		int empNo = 1;
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
	public String updateEndWork(Model m) {
		int empNo = 1;
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
	
	
	
}
