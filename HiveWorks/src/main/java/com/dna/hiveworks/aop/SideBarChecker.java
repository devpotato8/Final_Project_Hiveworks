/**
 * 
 */
package com.dna.hiveworks.aop;

import java.util.List;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;
import com.dna.hiveworks.service.EdocService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/**
 * @author : 이재연
 * @since : 2024. 1. 15.
 * Description : sidebar에 표시하려 할 때 사용되는 Aspect 
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 15., 설명 : 최초작성
 * 
 */

@Aspect
@Slf4j
@Component
public class SideBarChecker {
	
	@Autowired
	EdocService edocService;
	
	@AfterReturning("execution(String com.dna.hiveworks.controller.*Controller.*(..))")
	public void setEdocCountAll(JoinPoint joinPoint) {
		log.info(" AOP  진입");
		
		// request 가져옴
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// session 가져옴
		HttpSession session = request.getSession();
		
		// 현재 로그인 한 사람 정보 가져옴
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		// 만약 로그인 한 사람이 없으면 그냥 종료
		if(loginEmp == null) {
			log.info("로그인 정보 없음");
			log.info("AOP 종료");
			return;
		}
		
		List<ElectronicDocumentList> docList = edocService.getEdocList(Map.of("emp_id",loginEmp.getEmp_id(),"status",ListStatus.WAIT.name()));
		int countWait = docList.size();
		
		// 전자문서에 결재 대기 항목이 있을경우 전자문서에 알림을 띄우는 항목 추가
		request.setAttribute("edocCountWait", countWait);
		
		log.info(" AOP  종료");
	}
}