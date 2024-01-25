package com.dna.hiveworks.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Message;
import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.status.EdocStatus;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;
import com.dna.hiveworks.service.EdocService;
import com.dna.hiveworks.service.MsgService;
import com.dna.hiveworks.service.WorkService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ViewController {
	private final EdocService edocService;
	private final WorkService service; 
	private final MsgService msgService;
	@GetMapping("/")
	public String loginPage() {
		return "common/loginPage";
	}
	
	@RequestMapping(value="/login/index",method= {RequestMethod.GET, RequestMethod.POST})
	public String index(HttpSession session, Model m) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication == null || authentication instanceof AnonymousAuthenticationToken) {
	        // 인증되지 않은 사용자일 경우 로그인 페이지로 리다이렉트
	        return "redirect:/";
	    }
		
		Employee loginEmp = (Employee) authentication.getPrincipal();
		int empNo = loginEmp.getEmp_no();
		session.setAttribute("loginEmp", loginEmp);
		
		// 직원 출퇴근기록 가져오기
		Work commute = service.selectCommute(loginEmp.getEmp_no());
		m.addAttribute("commute", commute);
		
		// 안읽은메시지개수 가져오기
		List<Message> msgList = msgService.msgList(empNo);
		msgList = msgList.stream().filter(msg->msg.getMsg_read_yn().equals("N")).toList();
		m.addAttribute("msgUnreadCount", msgList.size());
		
		// 전자문서상태 가져오기
		List<ElectronicDocumentList> docList = edocService.getEdocList(Map.of("emp_id",loginEmp.getEmp_id(),"status",ListStatus.ALL.name()));
		
		int countAll = 0;
		long countWait =  0;
		long countCheck = 0;
		long countExpect = 0;
		long countProcess = 0;
		
		if(docList != null && docList.size()>0) {
			countAll = docList.size();
			countWait =  docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.APV_W)).count();
			countCheck = docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.APV_C)).count();
			countExpect = docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.APV_P)).count();
			countProcess = docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.PROCESS)).count();
		}
		m.addAttribute("countAll", countAll);
		m.addAttribute("countWait", countWait);
		m.addAttribute("countCheck", countCheck);
		m.addAttribute("countExpect", countExpect);
		m.addAttribute("countProcess", countProcess);
		return "index";
	}
		
	
	@PostMapping("/loginfail")
	public String loginFailPage(HttpServletRequest request, Model model) {
		String referrer = request.getHeader("Referer");
	    model.addAttribute("url", referrer);  //이전 주소를 model에 담아서 보내기
		return "common/loginError";
	}
	
}
