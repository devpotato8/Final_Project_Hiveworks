package com.dna.hiveworks.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dna.hiveworks.model.dto.Message;
import com.dna.hiveworks.service.MsgService;

import jakarta.servlet.http.HttpServletRequest;
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
	
	//쪽지함 페이지
	@GetMapping("/messageview")
	public String messageView(@RequestParam int empNo, Model model) {
		
		List<Message> msgs = service.msgList(empNo);
		model.addAttribute("msgList",msgs);
		return "message/message";
	}
	
	//함께 쪽지받은 사람 list
	@PostMapping("/sharedEmp")
	public ResponseEntity<List<String>> sharedEmp(@RequestBody Map<String,String> msgSharedEmps){
	    List<String> sharedEmp = service.sharedEmp(msgSharedEmps);
	    System.out.println("결과 : " + sharedEmp);
	    return ResponseEntity.ok(sharedEmp);
	}
	
	//파일들만 보이는 페이지
	@GetMapping("/msgFileView")
	public String msgFileView() {
		return "message/messageFilePage";
	}
	
	//별표 표시하기
	@PostMapping("/starmark")
	@ResponseBody
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
	
	//별표 표시 해제
	@PostMapping("/starunmark")
	@ResponseBody
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
	
	//쪽지 보내기
	@PostMapping("/sendMsg")
    public ResponseEntity<?> sendMsg(
    					@RequestParam("receiverEmpNo") List<String> receiverEmpNo,
    					@RequestParam("senderEmpNo") String senderEmpNo,
                        @RequestParam("msgCategory") String msgCategory,
                        @RequestParam("sendMsgTitle") String sendMsgTitle,
                        @RequestParam("sendMsgContent") String sendMsgContent,
                        @RequestParam(value = "sendmsgFile", required = false) MultipartFile sendmsgFile,
                        HttpServletRequest request) throws IOException{
		
		
		//EmpNo 리스트를 Integer로 변환
	    List<Integer> empNos = receiverEmpNo.stream().map(Integer::parseInt).collect(Collectors.toList());

	    List<String> receiverNames = service.receiverNames(empNos);
	    
	    String msgCategoryName = service.categoryName(msgCategory);
	    
		//파일 업로드
		String savePath = request.getServletContext().getRealPath("/resources/msgupload/");
		
		// 디렉토리가 존재하지 않을 경우 생성
		File dir = new File(savePath);
		if(!dir.exists()){
		    dir.mkdirs();
		}
		
		String fileOriname = "";
		String fileRename = "";
		String fileSize = "";
		Map<String,String> response = new HashMap<>();
		
		// 파일이 첨부되었는지 확인
		if(sendmsgFile != null && !sendmsgFile.isEmpty()) {
			fileOriname = sendmsgFile.getOriginalFilename();
			String extension = fileOriname.substring(fileOriname.lastIndexOf(".")); // 확장자 추출

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String timePart = formatter.format(new Date()); // 현재 시간을 년월일시분초 형태로 변환

			fileRename = UUID.randomUUID().toString().replaceAll("-", "").substring(0,6) + timePart + extension; // UUID + 확장자
			
			File file = new File(savePath + "/" + fileRename);
			try {
				sendmsgFile.transferTo(file);
			} catch(IOException e) {
				e.printStackTrace();
		        response.put("status", "fail");
		        response.put("message", "파일 저장 중 오류 발생");
		        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
			}
			
			// 파일 크기 저장
			long fileSizeBytes = sendmsgFile.getSize();
			
			// 파일 크기를 byte에서 MB로 변환
			double fileSizeMb = fileSizeBytes / (1024.0 * 1024.0);

			// MB 단위의 파일 크기를 소수점 둘째 자리까지의 문자열로 변환
			fileSize = String.format("%.2f", fileSizeMb) + "MB";
			
		}
		
		Map<String,Object> params = new HashMap<>();
		
		params.put("receiverEmpNo", empNos);
		params.put("receiverNames", receiverNames);
		params.put("senderEmpNo", senderEmpNo);
		params.put("msgCategory", msgCategory);
		params.put("msgCategoryName", msgCategoryName);
		params.put("msgTitle", sendMsgTitle);
		params.put("msgContent", sendMsgContent);
		params.put("fileOriname", fileOriname);
		params.put("fileRename", fileRename);
		params.put("fileSize", fileSize);
		
		int result = service.sendMsg(params);	
		
		if (result > 0) {
            response.put("status", "success");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "fail");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
	
	//첨부파일 다운로드
	@GetMapping("/downfile")
	public ResponseEntity<Resource> downloadFile(@RequestParam String fn, HttpServletRequest request) {

	    try {
	        // 파일의 실제 경로를 지정
	    	String path = request.getServletContext().getRealPath("/resources/msgupload/");
	    	
	        Path filePath = Paths.get(path + fn).normalize();
	        Resource resource = new UrlResource(filePath.toUri());

	        if (resource.exists() || resource.isReadable()) {
	            return ResponseEntity.ok()
	                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
	                    .body(resource);
	        } else {
	            throw new RuntimeException("파일을 불러올 수 없습니다.");
	        }
	    } catch (Exception e) {
	        throw new RuntimeException("첨부파일다운로드Error: " + e.getMessage());
	    }
	}
	
	//쪽지 읽음처리
	@PostMapping("/readMsg")
	@ResponseBody
	public ResponseEntity<?> readMsg(@RequestParam int emp_no, @RequestParam int msg_no, HttpServletRequest request){
		
		Map<String,Integer> params = new HashMap<>();
		params.put("empNo", emp_no);
		params.put("msgNo", msg_no);
		
		int result = service.readMsg(params);
		
		Map<String,String> response = new HashMap<>();
		
		if (result > 0) {
            response.put("status", "success");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "fail");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
	}
	
	//별표 버튼처리
	@PostMapping("/starBtn")
	@ResponseBody
	public Map<String, Object> starChekedBtn(@RequestBody List<Map<String,Object>>data){

		Map<String, Object> response = new HashMap<>();

		int result = 0;

		try {
			for(Map<String,Object> row : data) {
				Integer emp_no = (Integer) row.get("emp_no");
				Integer msg_no = (Integer) row.get("msg_no");

				Map<String, Integer> params = new HashMap<>();
				params.put("empNo", emp_no);
				params.put("msgNo", msg_no);

				result += service.starChekedBtn(params);
			}
			if(result>0) response.put("status", "success");
			else response.put("status", "fail");

		}catch(Exception e){
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", e.getMessage());
		}

		return response;
	}
	
	//휴지통으로 버튼처리
	@PostMapping("/trashBtn")
	@ResponseBody
	public Map<String, Object> trashChekedBtn(@RequestBody List<Map<String,Object>>data){
		
		Map<String, Object> response = new HashMap<>();
		
		int result1 = 0,result2 = 0;

		try {
			for(Map<String,Object> row : data) {
				Integer emp_no = (Integer) row.get("emp_no");
				Integer msg_no = (Integer) row.get("msg_no");
				
				Map<String, Integer> params = new HashMap<>();
				params.put("empNo", emp_no);
				params.put("msgNo", msg_no);
				result1 += service.starUncheckedBtn(params); //선택한 항목이 별표된 쪽지라면 해제
				result2 += service.trashChekedBtn(params);
			}
			
			if(result1>0 && result2>0) response.put("status", "success");
			else response.put("status", "fail");
			
		}catch(Exception e){
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", e.getMessage());
		}
		
		return response;
	}
	
	@PostMapping("/goTrash")
	@ResponseBody
	public Map<String,String> goTrash(@RequestParam int emp_no, @RequestParam int msg_no){
		
		Map<String,Integer> params = new HashMap<>();
		params.put("empNo", emp_no);
		params.put("msgNo", msg_no);
		
		int result = service.trashChekedBtn(params);
		
		Map<String,String> response = new HashMap<>();

		if(result>0) response.put("status", "success");
		else response.put("status", "fail");
		
		return response;
	}
}
