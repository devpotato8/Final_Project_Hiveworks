package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @author : 강진하
 * @since : 2023. 12. 28.
 * Description : 휴가컨트롤러
 * 
 * History :
 * - 작성자 : 강진하, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("myprofile")
	public String myprofile() {
		return "mypage/mypage";
	}
	@GetMapping("myvacation")
	public String myvacation() {
		return "mypage/myvacation";
	}
	@GetMapping("editmyprofile")
	public String editmyprofile() {
		return "mypage/editmyprofile";
	}
	
	
	
	
}
	

