/**
 * 
 */
package com.dna.hiveworks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author : 이재연
 * @since : 2023. 12. 28.
 * Description : 전자문서 접근 컨트롤러
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */
@Controller
@RequestMapping("/edoc")
public class EdocController {
	
	@GetMapping("/lists/{status}")
	public String pendingList(@PathVariable String status, Model model) {
		model.addAttribute("status",status);
		return "edoc/lists";
	}
}
