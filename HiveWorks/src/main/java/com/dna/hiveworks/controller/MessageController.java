package com.dna.hiveworks.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dna.hiveworks.model.dto.Message;
import com.dna.hiveworks.service.MsgService;

import lombok.RequiredArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2023. 01. 14.
 * Description : 쪽지함 Controller
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 01. 14., 설명 : 최초작성
**/

@Controller
@RequiredArgsConstructor
public class MessageController {
	
	private final MsgService service; 
	
	@GetMapping("/messageview")
	public String messageView(@RequestParam int empNo, Model model) {
		
		List<Message> msgs = service.msgList(empNo);
		model.addAttribute("msgList",msgs);
		return "message/message";
	}
	
	@GetMapping("/msgFileView")
	public String msgFileView() {
		return "message/messageFilePage";
	}
	
	@PostMapping("/starmark")
	public Map<String, String> starMark(@RequestParam String msg_no){
		
		int msgNo = Integer.parseInt(msg_no);
		
		int result = service.starMark(msgNo);

		Map<String,String>response = new HashMap<>();
		
		if(result>0) {
			response.put("status","success");
		}else {
			response.put("status", "fail");
		}
		
		return response;
	}
	
	@PostMapping("/starunmark")
	public Map<String, String> starUnmark(@RequestParam String msg_no){
		
		int msgNo = Integer.parseInt(msg_no);
		
		int result = service.starUnmark(msgNo);

		Map<String,String>response = new HashMap<>();
		
		if(result>0) {
			response.put("status","success");
		}else {
			response.put("status", "fail");
		}
		
		return response;
	}
}
