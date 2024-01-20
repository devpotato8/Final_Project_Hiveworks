package com.dna.hiveworks.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.core.AprStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dna.hiveworks.model.code.ApvCode;
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
				vacation.setEmpNo(empNo);
				// 연차부족
				if(vacation.getVacCount()>leftVacation) {
					result = 0;
				} else {
					Map<String, Object> param = new HashMap<String, Object>();
					
					vacation.setVacOption(dayAndAfter+"반차");
					if (vacation.getVacOption().equals("오전반차")) {
						// 신청한 날짜를가져와서 반차신청시간을 더해줌 보류..
						// vacation.setCreateDate(vacation.getCreateDate());
					}
					// 전자문서 insert로직 추가 
					edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
					edoc.setEdocTitle("반차신청");
					
					edoc.setEdocDsgCode(DsgCode.DSG003);
					edoc.setEdocContent("<p>반차신청</p>");
					
					edoc.setEdocStartDate(vacation.getCreateDate());
					edoc.setEdocEndDate(vacation.getCreateDate());
					edoc.setEdocVacationCount(vacation.getVacCount());
					edoc.setEdocStatus(vacation.getVacPermit());
					
					edoc.setCreater(empNo);
					
					//ElectronicDocumentApproval => 결재자 정보
					//!! 결재자 정보가 없으면 에러남
					ElectronicDocumentApproval approvalEmp = new ElectronicDocumentApproval();
					approvalEmp.setAprvlEmpNo(empNo);
					approvalEmp.setAprvlApvCode(ApvCode.APV001);
					approvalEmp.setAprvlStatus("A");
					approvalEmp.setAprvlRank(1);
					
					ElectronicDocumentApproval approval1 = new ElectronicDocumentApproval();
					approval1.setAprvlEmpNo(8); // 김팀장
					approval1.setAprvlApvCode(ApvCode.APV000);
					approval1.setAprvlStatus("W");
					approval1.setAprvlRank(2);
					
					List<ElectronicDocumentApproval> approvalList = new ArrayList<>();
					approvalList.add(approvalEmp);
					approvalList.add(approval1);
					
					// approval에 리스트 넣기
					edoc.setApproval(approvalList);
					
					// 전자문서에 INSERT
					edocService.insertEdoc(edoc);
					
					vacation.setEdocNo(edoc.getEdocNo());
					// 휴가테이블에 insert 전자문서번호도 추가해줘야함
					result = service.insertVacation(vacation);
					param.put("vacCount", vacation.getVacCount());
					param.put("empNo", empNo);
					
					// 잔여휴가에서 차감
					service.updateVacation(param);
				}
				
				
			} else if(vacation.getVacOption().equals("연차")) {
				vacation.setVacCount(1);
				vacation.setEmpNo(empNo);
				if(vacation.getVacCount()>leftVacation) {
					result = 0;
				} else {
					Map<String, Object> param = new HashMap<String, Object>();
					
					// 전자문서 insert로직 추가 
					edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
					
					if (vacation.getVacOption().equals("병가")) {
						edoc.setEdocTitle("병가신청");
						edoc.setEdocContent("<p>병가신청</p>");
					} else if (vacation.getVacOption().equals("공가")) {
						edoc.setEdocTitle("공가신청");
						edoc.setEdocContent("<p>공가신청</p>");
					} else {
						edoc.setEdocTitle("연차신청");
						edoc.setEdocContent("<p>연차신청</p>");
					}
					
					edoc.setEdocDsgCode(DsgCode.DSG003);
					
					
					edoc.setEdocStartDate(vacation.getCreateDate());
					edoc.setEdocEndDate(vacation.getCreateDate());
					edoc.setEdocVacationCount(vacation.getVacCount());
					edoc.setEdocStatus(vacation.getVacPermit());
					
					edoc.setCreater(empNo);
					
					//ElectronicDocumentApproval => 결재자 정보
					//!! 결재자 정보가 없으면 에러남
					ElectronicDocumentApproval approvalEmp = new ElectronicDocumentApproval();
					approvalEmp.setAprvlEmpNo(empNo);
					approvalEmp.setAprvlApvCode(ApvCode.APV001);
					approvalEmp.setAprvlStatus("A");
					approvalEmp.setAprvlRank(1);
					
					ElectronicDocumentApproval approval1 = new ElectronicDocumentApproval();
					approval1.setAprvlEmpNo(8); // 팀장
					approval1.setAprvlApvCode(ApvCode.APV000);
					approval1.setAprvlStatus("W");
					approval1.setAprvlRank(2);
					
					List<ElectronicDocumentApproval> approvalList = new ArrayList<>();
					approvalList.add(approvalEmp);
					approvalList.add(approval1);
					
					// approval에 리스트 넣기
					edoc.setApproval(approvalList);
					
					// 전자문서에 INSERT
					edocService.insertEdoc(edoc);
					
					vacation.setEdocNo(edoc.getEdocNo());
					result = service.insertVacation(vacation);
					
					param.put("vacCount", vacation.getVacCount());
					param.put("empNo", vacation.getEmpNo());
					
					service.updateVacation(param);
				}
				
			}else if(vacation.getVacOption().equals("병가")||vacation.getVacOption().equals("공가")) {
				vacation.setVacCount(1);
				vacation.setEmpNo(empNo);
				if(vacation.getVacCount()>leftVacation) {
					result = 0;
				} else {
					//Map<String, Object> param = new HashMap<String, Object>();
					
					// 전자문서 insert로직 추가 
					edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
					
					if (vacation.getVacOption().equals("병가")) {
						edoc.setEdocTitle("병가신청");
						edoc.setEdocContent("<p>병가신청</p>");
					} else if (vacation.getVacOption().equals("공가")) {
						edoc.setEdocTitle("공가신청");
						edoc.setEdocContent("<p>공가신청</p>");
					} else {
						edoc.setEdocTitle("연차신청");
						edoc.setEdocContent("<p>연차신청</p>");
					}
					
					edoc.setEdocDsgCode(DsgCode.DSG003);
					
					
					edoc.setEdocStartDate(vacation.getCreateDate());
					edoc.setEdocEndDate(vacation.getCreateDate());
					edoc.setEdocVacationCount(vacation.getVacCount());
					edoc.setEdocStatus(vacation.getVacPermit());
					
					edoc.setCreater(empNo);
					
					//ElectronicDocumentApproval => 결재자 정보
					//!! 결재자 정보가 없으면 에러남
					ElectronicDocumentApproval approvalEmp = new ElectronicDocumentApproval();
					approvalEmp.setAprvlEmpNo(empNo);
					approvalEmp.setAprvlApvCode(ApvCode.APV001);
					approvalEmp.setAprvlStatus("A");
					approvalEmp.setAprvlRank(1);
					
					ElectronicDocumentApproval approval1 = new ElectronicDocumentApproval();
					approval1.setAprvlEmpNo(8); // 팀장
					approval1.setAprvlApvCode(ApvCode.APV000);
					approval1.setAprvlStatus("W");
					approval1.setAprvlRank(2);
					
					List<ElectronicDocumentApproval> approvalList = new ArrayList<>();
					approvalList.add(approvalEmp);
					approvalList.add(approval1);
					
					// approval에 리스트 넣기
					edoc.setApproval(approvalList);
					
					// 전자문서에 INSERT
					edocService.insertEdoc(edoc);
					
					vacation.setEdocNo(edoc.getEdocNo());
					result = service.insertVacation(vacation);
				}
				
			} else if(vacation.getVacOption().equals("조의 (부모 / 배우자 / 자녀)")){
				
				vacation.setVacCount(5);
				vacation.setEmpNo(empNo);
				// 전자문서 insert로직 추가 
				edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
				edoc.setEdocTitle("휴가신청 - 조의 (부모 / 배우자 / 자녀) 신청");
				
				edoc.setEdocDsgCode(DsgCode.DSG003);
				edoc.setEdocContent("<p>휴가신청 - 조의 (부모 / 배우자 / 자녀) 신청</p>");
				
				edoc.setEdocStartDate(vacation.getCreateDate());
				edoc.setEdocEndDate(vacation.getCreateDate());
				edoc.setEdocVacationCount(vacation.getVacCount());
				edoc.setEdocStatus(vacation.getVacPermit());
				
				edoc.setCreater(empNo);
				
				//ElectronicDocumentApproval => 결재자 정보
				//!! 결재자 정보가 없으면 에러남
				ElectronicDocumentApproval approvalEmp = new ElectronicDocumentApproval();
				approvalEmp.setAprvlEmpNo(empNo);
				approvalEmp.setAprvlApvCode(ApvCode.APV001);
				approvalEmp.setAprvlStatus("A");
				approvalEmp.setAprvlRank(1);
				
				ElectronicDocumentApproval approval1 = new ElectronicDocumentApproval();
				approval1.setAprvlEmpNo(8); // 팀장
				approval1.setAprvlApvCode(ApvCode.APV000);
				approval1.setAprvlStatus("W");
				approval1.setAprvlRank(2);
				
				List<ElectronicDocumentApproval> approvalList = new ArrayList<>();
				approvalList.add(approvalEmp);
				approvalList.add(approval1);
				
				// approval에 리스트 넣기
				edoc.setApproval(approvalList);
				
				// 전자문서에 INSERT
				edocService.insertEdoc(edoc);
								
				vacation.setEdocNo(edoc.getEdocNo());
				result = service.insertVacation(vacation);
			} else if(vacation.getVacOption().equals("결혼 (자녀)")) {
				
				vacation.setVacCount(1);
				vacation.setEmpNo(empNo);
				// 전자문서 insert로직 추가 
				edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
				edoc.setEdocTitle("휴가신청 - 결혼(자녀)");
				
				edoc.setEdocDsgCode(DsgCode.DSG003);
				edoc.setEdocContent("<p>휴가신청 - 결혼(자녀)</p>");
				
				edoc.setEdocStartDate(vacation.getCreateDate());
				edoc.setEdocEndDate(vacation.getCreateDate());
				edoc.setEdocVacationCount(vacation.getVacCount());
				edoc.setEdocStatus(vacation.getVacPermit());
				
				edoc.setCreater(empNo);
				
				//ElectronicDocumentApproval => 결재자 정보
				//!! 결재자 정보가 없으면 에러남
				ElectronicDocumentApproval approvalEmp = new ElectronicDocumentApproval();
				approvalEmp.setAprvlEmpNo(empNo);
				approvalEmp.setAprvlApvCode(ApvCode.APV001);
				approvalEmp.setAprvlStatus("A");
				approvalEmp.setAprvlRank(1);
				
				ElectronicDocumentApproval approval1 = new ElectronicDocumentApproval();
				approval1.setAprvlEmpNo(8); // 팀장
				approval1.setAprvlApvCode(ApvCode.APV000);
				approval1.setAprvlStatus("W");
				approval1.setAprvlRank(2);
				
				List<ElectronicDocumentApproval> approvalList = new ArrayList<>();
				approvalList.add(approvalEmp);
				approvalList.add(approval1);
				
				// approval에 리스트 넣기
				edoc.setApproval(approvalList);
				
				// 전자문서에 INSERT
				edocService.insertEdoc(edoc);
				
				vacation.setEdocNo(edoc.getEdocNo());
				result = service.insertVacation(vacation);
			} else {
				
				vacation.setVacCount(3);
				vacation.setEmpNo(empNo);
				// 전자문서 insert로직 추가 
				edoc.setEdocDotCode(DotCode.DOT004); // 휴가신청서 코드 DOT004, 연장근무신청서 DOT005
				
				if (vacation.getVacOption().equals("조의 (조부모 / 형제 / 자매)")) {
					edoc.setEdocTitle("휴가신청 - 조의 (조부모 / 형제 / 자매)");
					edoc.setEdocContent("<p>휴가신청 - 조의 (조부모 / 형제 / 자매)</p>");
				} else {
					edoc.setEdocTitle("휴가신청 - 결혼(본인)");
					edoc.setEdocContent("<p>휴가신청 - 결혼(본인)</p>");
				}
				
				edoc.setEdocDsgCode(DsgCode.DSG003);
				
				
				edoc.setEdocStartDate(vacation.getCreateDate());
				edoc.setEdocEndDate(vacation.getCreateDate());
				edoc.setEdocVacationCount(vacation.getVacCount());
				edoc.setEdocStatus(vacation.getVacPermit());
				
				edoc.setCreater(empNo);
				
				//ElectronicDocumentApproval => 결재자 정보
				//!! 결재자 정보가 없으면 에러남
				ElectronicDocumentApproval approvalEmp = new ElectronicDocumentApproval();
				approvalEmp.setAprvlEmpNo(empNo);
				approvalEmp.setAprvlApvCode(ApvCode.APV001);
				approvalEmp.setAprvlStatus("A");
				approvalEmp.setAprvlRank(1);
				
				ElectronicDocumentApproval approval1 = new ElectronicDocumentApproval();
				approval1.setAprvlEmpNo(8); // 팀장
				approval1.setAprvlApvCode(ApvCode.APV000);
				approval1.setAprvlStatus("W");
				approval1.setAprvlRank(2);
				
				List<ElectronicDocumentApproval> approvalList = new ArrayList<>();
				approvalList.add(approvalEmp);
				approvalList.add(approval1);
				
				// approval에 리스트 넣기
				edoc.setApproval(approvalList);
				
				// 전자문서에 INSERT
				edocService.insertEdoc(edoc);
				
				vacation.setEdocNo(edoc.getEdocNo());
				result = service.insertVacation(vacation);
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
