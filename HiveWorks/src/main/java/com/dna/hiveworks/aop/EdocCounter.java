/**
 * 
 */
package com.dna.hiveworks.aop;

import java.util.List;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.status.EdocStatus;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;
import com.dna.hiveworks.service.EdocService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/**
 * @author : 이재연
 * @since : 2024. 1. 15.
 * Description : edoc 컨트롤러에 접근하는 요청에 대해 현재 진행중 문서 갯수를 세어서 추가하는 로직
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 15., 설명 : 최초작성
 * 
 */
@Aspect
@Slf4j
@Component
public class EdocCounter {
	
	@Autowired
	EdocService service;
	
	@After("execution(* com.dna.hiveworks.controller.EdocController.*(..)) && args(model, ..)")
	public void addCounts(JoinPoint joinPoint, Model model) {
		log.info("AOP 진입");
		
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		List<ElectronicDocumentList> docList = service.getEdocList(Map.of("emp_id",loginEmp.getEmp_id(),"status",ListStatus.ALL.name()));
		
		int countAll = docList.size();
		long countWait =  docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.APV_W)).count();
		long countCheck = docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.APV_C)).count();
		long countExpect = docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.APV_P)).count();
		long countProcess = docList.stream().filter(t -> t.getEdocStatus().equals(EdocStatus.PROCESS)).count();
		
		model.addAttribute("countAll", countAll);
		model.addAttribute("countWait", countWait);
		model.addAttribute("countCheck", countCheck);
		model.addAttribute("countExpect", countExpect);
		model.addAttribute("countProcess", countProcess);
		
		log.info("AOP 종료");
	}
	
}
