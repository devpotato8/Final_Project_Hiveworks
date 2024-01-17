package com.dna.hiveworks.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dna.hiveworks.model.dto.Message;
import com.dna.hiveworks.service.MsgService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		System.out.println(msgs);
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
	
	@PostMapping("/sendMsg")
    public Map<String, String> sendMsg(@RequestParam("receiverEmpNo") List<String> receiverEmpNo,
                          @RequestParam("msgCategory") String msgCategory,
                          @RequestParam("sendMsgTitle") String sendMsgTitle,
                          @RequestParam("sendMsgContent") String sendMsgContent,
                          @RequestParam("sendmsgFile") MultipartFile sendmsgFile,
                          HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//파일 업로드
		String savePath = request.getServletContext().getRealPath("/resources/msgupload/");
		File file = new File(savePath+"/"+sendmsgFile.getOriginalFilename());
		sendmsgFile.transferTo(file);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String timePart = formatter.format(new Date()); // 현재 시간을 년월일시분초 형태로 변환
		
		String fileOriname = sendmsgFile.getOriginalFilename();
		String extension = fileOriname.substring(fileOriname.lastIndexOf(".")); // 확장자 추출
		String fileRename = UUID.randomUUID().toString().replaceAll("-", "").substring(0,6) +timePart+receiverEmpNo+ extension; // UUID + 확장자
		
		
		Map<String,String>response1 = new HashMap<>();
//		int result = service.sendMsg();		
		
//		if(result>0) {
//			response1.put("status","success");
//		}else {
//			response1.put("status", "fail");
//		}
		
		return response1;
    }
}
