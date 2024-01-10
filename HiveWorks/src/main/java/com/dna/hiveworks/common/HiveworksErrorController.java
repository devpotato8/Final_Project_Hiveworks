package com.dna.hiveworks.common;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HiveworksErrorController implements ErrorController{
	
	@RequestMapping("/error")
	public String handleError(HttpServletRequest request, Model model) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		String referrer = request.getHeader("Referer");
		if(status != null) {
			int statusCode = Integer.valueOf(status.toString());
			HttpStatus httpStatus = HttpStatus.valueOf(statusCode);
			model.addAttribute("errorCode",statusCode);
			model.addAttribute("errorMsg",httpStatus.getReasonPhrase());
			model.addAttribute("url",referrer); //이전 주소를 model에 담아서 보내기
		}
		return "common/error";
	}
	
//	@RequestMapping("/not-found")
//	public String notFound() {
//		return "common/error/404";
//	}
//	@RequestMapping("/error-500")
//	public String notFound() {
//		return "common/error/500";
//	}
	
}
