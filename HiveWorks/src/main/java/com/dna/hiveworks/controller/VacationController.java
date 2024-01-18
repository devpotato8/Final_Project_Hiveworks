package com.dna.hiveworks.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.code.DsgCode;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.service.EdocService;
import com.dna.hiveworks.service.VacationService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/vacation")
public class VacationController {
	
	private final VacationService service;
	private final EdocService edocService;

	
	@GetMapping("vacationList")
	public String worksList(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		
		// 잔여연차 가져오기
		double leftVacation = service.selectLeftVacation(loginEmp.getEmp_no());
		
		m.addAttribute("leftVacation", leftVacation);
		
		return "vacation/vacationList";
	}
	
//	@GetMapping("selectvacation")
//	public String selectVacation(int no, Model m){
//		List<Vacation> vacations = service.selectVacationByNo(no);
//		m.addAttribute("vacations", vacations);
//		return "vacation/vacationList";
//	}
	
	@PostMapping("applyvacation")
	public String applyVacation(@SessionAttribute("loginEmp")Employee loginEmp,ElectronicDocument edoc, Vacation vacation, Model m, @RequestParam("dayAndAfter") String dayAndAfter) {
		// 잔여연차 가져오기
		double leftVacation = service.selectLeftVacation(loginEmp.getEmp_no());
		
		int empNo = loginEmp.getEmp_no();
		int result;
		String msg,loc;
			if(vacation.getVacOption().equals("반차")) {
				vacation.setVacCount(0.5);
				
				// 연차부족
				if(vacation.getVacCount()>leftVacation) {
					result = 0;
				} else {
					Map<String, Object> param = new HashMap<String, Object>();
					
					vacation.setVacOption(dayAndAfter+"반차");
					
					// 전자문서 insert로직 추가 
					edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
					edoc.setEdocTitle("타이틀");
					edoc.setEdocDsgCode(DsgCode.DSG003);
					edoc.setEdocContent("사유넣기");
					
					edoc.setEdocStartDate(vacation.getCreateDate());
					edoc.setEdocEndDate(vacation.getCreateDate());
					edoc.setEdocStatus(vacation.getVacPermit());
					
					edoc.setEdocStatus("DST100");
					edoc.setCreater(empNo);
					
					List<ElectronicDocumentApproval> approval = new ArrayList<>();					edoc.setApproval(null);
					edoc.setApproval(approval);
					edocService.insertEdoc(edoc);
					
					//ElectronicDocumentApproval => 결재자 정보
					//!! 결재자 정보가 없으면 에러남
					
					
					// 휴가테이블에 insert 전자문서번호도 추가해줘야함
					result = service.insertVacation(vacation);
					param.put("vacCount", vacation.getVacCount());
					param.put("empNo", empNo);
					
					// 잔여휴가에서 차감
					service.updateVacation(param);
				}
				
				
			} else if(vacation.getVacOption().equals("연차")||vacation.getVacOption().equals("병가")||vacation.getVacOption().equals("공가")) {
				vacation.setVacCount(1);
				vacation.setEmpNo(empNo);
				if(vacation.getVacCount()>leftVacation) {
					result = 0;
				} else {
					Map<String, Object> param = new HashMap<String, Object>();
					result = service.insertVacation(vacation);
					
					param.put("vacCount", vacation.getVacCount());
					param.put("empNo", vacation.getEmpNo());
					
					log.debug("{}",param.get("vacCount"));
					log.debug("{}",param.get("empNo"));
					
					service.updateVacation(param);
				}
				
			} else if(vacation.getVacOption().equals("조의 (부모 / 배우자 / 자녀)")){
				Map<String, Object> param = new HashMap<String, Object>();
				vacation.setVacCount(5);
				result = service.insertVacation(vacation);
				param.put("vacCount", vacation.getVacCount());
				param.put("empNo", empNo);
				service.updateVacation(param);
			} else if(vacation.getVacOption().equals("결혼자녀")) {
				Map<String, Object> param = new HashMap<String, Object>();
				vacation.setVacCount(1);
				result = service.insertVacation(vacation);
				param.put("vacCount", vacation.getVacCount());
				param.put("empNo", empNo);
				service.updateVacation(param);
			} else {
				Map<String, Object> param = new HashMap<String, Object>();
				vacation.setVacCount(3);
				result = service.insertVacation(vacation);
				param.put("vacCount", vacation.getVacCount());
				param.put("empNo", empNo);
				service.updateVacation(param);
			}
			
			if(result>0) {
				msg = "휴가 신청 완료  :)";
				loc = "vacation/vacationList";
			} else {
				msg = "휴가 신청 실패  :(";
				loc = "vacation/vacationList";
			}
			
			m.addAttribute("msg",msg);
			m.addAttribute("loc",loc);
			
			return "common/msg";
	}
	
	@GetMapping("vacationView")
	public String vacationView(@SessionAttribute("loginEmp")Employee loginEmp, Model m) {
		
		// 잔여연차 가져오기
		double leftVacation = service.selectLeftVacation(loginEmp.getEmp_no());
		
		int empNo = loginEmp.getEmp_no();
		List<Vacation> vacations = service.selectVacationByNo(empNo);
		
		m.addAttribute("leftVacation", leftVacation);
		m.addAttribute("vacations", vacations);
		return "vacation/vacationView";
	}
	
	
	
	
	
}
