package com.dna.hiveworks.common.exception;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author : 김태윤
 * @since : 2024. 1. 9.
 * Description : 예외상황 처리용 Exception Contoller
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2024. 1. 9., 설명 : exception controller생성
 */

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(NotFoundException.class)
	public String handleException() {
		return "common/error/404";
	}
}
