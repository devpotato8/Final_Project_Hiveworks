/**
 * 
 */
package com.dna.hiveworks.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dna.hiveworks.common.exception.HiveworksException;
import com.dna.hiveworks.model.code.ApvCode;
import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.code.DsgCode;
import com.dna.hiveworks.model.code.PosCode;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;
import com.dna.hiveworks.model.dto.edoc.status.BoxStatus;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;
import com.dna.hiveworks.service.EdocService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

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
@Slf4j
@RequestMapping("/edoc")
public class EdocController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private EdocService edocService;
	
	@GetMapping("/lists/{status}")
	public String pendingList(Model model, @PathVariable String status, @SessionAttribute Employee loginEmp) {
		ListStatus listStatus;
		try {
			listStatus = ListStatus.valueOf(status.toUpperCase());
		}catch(IllegalArgumentException e) {
			throw new HiveworksException("부적절한 접근입니다.");
		}
		if(loginEmp == null) {
			throw new HiveworksException("로그인 정보가 없습니다.");
		}
		Map<String,Object> param = new HashMap<>();
		
		param.put("emp_id", loginEmp.getEmp_id());
		param.put("status", listStatus.name());
		
		
		List<ElectronicDocumentList> lists = edocService.getEdocList(param);
		if(listStatus == ListStatus.ALL) {
			model.addAttribute("category",ListStatus.values());
		}else {
			model.addAttribute("category",DotCode.values());
		}
		model.addAttribute("title","진행중-"+listStatus.getStatus());
		model.addAttribute("currentPage","lists");
		model.addAttribute("lists",lists);
		
		return "edoc/lists";
	}
	
	@GetMapping("/box/{status}")
	public String documentBox(Model model, @PathVariable String status, @SessionAttribute Employee loginEmp) {
		BoxStatus boxStatus;
		try {
			boxStatus = BoxStatus.valueOf(status.toUpperCase());
		}catch(IllegalArgumentException e) {
			throw new HiveworksException("부적절한 접근입니다.");
		}
		
		if(loginEmp == null) {
			throw new HiveworksException("로그인 정보가 없습니다.");
		}
		Map<String, Object> param = new HashMap<>();
		
		param.put("emp_id", loginEmp.getEmp_id());
		param.put("status", boxStatus.name());
		param.put("posCode", PosCode.valueOf(loginEmp.getPosition_code()));
		
		List<ElectronicDocumentList> lists = edocService.getEdocBox(param);
		
		if(boxStatus == BoxStatus.ALL) {
			model.addAttribute("category",BoxStatus.values());
		}else {
			model.addAttribute("category",DotCode.values());
		}
		model.addAttribute("title","보관함-"+boxStatus.getStatus());
		model.addAttribute("currentPage","box");
		model.addAttribute("lists",lists);
		
		return "edoc/lists";
	}
	
	@GetMapping("/write")
	public String writeDocument(Model model, @SessionAttribute Employee loginEmp) {
		Map<String,Object> emp = edocService.getEmpData(loginEmp.getEmp_no());
		
		model.addAttribute("emp",emp);
		model.addAttribute("dsgcode", DsgCode.values());
		model.addAttribute("dotcode", DotCode.values());
		
		return "edoc/write";
	}
	
	@GetMapping("/personalSetting")
	public String personalSetting(Model model) {
		return "edoc/personalSetting";
	}
	
	@GetMapping("/read")
	public String readElectronicDocument(Model model, @RequestParam String edocNo, @SessionAttribute Employee loginEmp) {
		
		ElectronicDocument edoc  = edocService.selectElectronicDocument(edocNo, loginEmp.getEmp_no());
		
		System.out.println("edoc: " + edoc);
		
		model.addAttribute("edoc",edoc);
		model.addAttribute("apvCode",ApvCode.values());
		
		return "edoc/read";
	}
	
	@GetMapping("/format/lists")
	public String formatLists(Model model) {
		//TODO 양식 목록 페이지
		model.addAttribute("title","양식 목록");
		model.addAttribute("formatList", edocService.getEdocSampleList());
		return "edoc/formatList";
	}
	
	@GetMapping("/format/write")
	public String formatWrite(Model model) {
		model.addAttribute("dotcode",DotCode.values());
		return "edoc/formatWrite";
	}
	
	@GetMapping("/format/view")
	public String formatView(Model model, @RequestParam String formatNo) {
		//TODO 양식 보기 페이지
		
		model.addAttribute("format", edocService.getSample(formatNo));
		
		return "edoc/format";
	}
	
	@GetMapping("/formatList")
	public ResponseEntity<List<ElectronicDocumentSample>> getEdocSampleList(@RequestParam String edocDotCode){
		DotCode dotCode = null;
		
		try {
			dotCode = DotCode.valueOf(edocDotCode);
		}catch(IllegalArgumentException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK).body(edocService.getEdocSampleList(dotCode));
	}
	
	@GetMapping("/formatData")
	public ResponseEntity<ElectronicDocumentSample> getFormatData(@RequestParam String formatNo){
		ElectronicDocumentSample result = edocService.getSample(formatNo);
		if(result == null) {
			System.out.println(result);
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
	
	@PostMapping(value = "/write")
	public  ResponseEntity<Object> writeEdoc(@RequestParam String edoc, @RequestPart(required = false) List<MultipartFile> uploadFiles ) {
		 ElectronicDocument edocInstance;
		 try {
			 ObjectMapper objectMapper = new ObjectMapper();
			 edocInstance = objectMapper.readValue(edoc, ElectronicDocument.class);
			 log.debug(edocInstance.toString());
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","전자문서파싱중에러"));
		 }
		try {
			if(uploadFiles==null || uploadFiles.size()<=0) {
				throw new HiveworksException();
			}
			List<ElectronicDocumentAttachFile> attachFiles = new ArrayList<>();
			
			String realPath = context.getRealPath("/resources/upload/edoc");
			
			File path = new File(realPath);
			if(!path.exists()) path.mkdirs();
			
			for(MultipartFile uploadFile : uploadFiles) {
				String originalFilename = uploadFile.getOriginalFilename();
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				String renamedFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"))+UUID.randomUUID()+ext;
				
				File upFile = new File(path+"/"+renamedFileName);
				
				uploadFile.transferTo(upFile);
				attachFiles.add(ElectronicDocumentAttachFile.builder()
						.attachOriginalFilename(originalFilename)
						.attachRenamedFilename(renamedFileName)
						.creater(edocInstance.getCreater())
						.build());
			}
			edocInstance.setAttachFiles(attachFiles);
			
		}catch(HiveworksException e) {
			edocInstance.setAttachFiles(null);
		}catch(IOException e) {
			e.printStackTrace();
		}
		int result = edocService.insertEdoc(edocInstance);
		System.out.println(edocInstance);
		if(result >0) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","200","edocNo",edocInstance.getEdocNo()));
		}else {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","DB입력중 에러발생"));
		}
	}
	
	@PostMapping("/imgupload")
	public  ResponseEntity<Map<String,Object>> imgUpload(MultipartHttpServletRequest request){
		Map<String,Object> response = null;
		try {
		MultipartFile uploadFile = request.getFile("upload");
		
		String originalFileName = uploadFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		String renamedFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"))+UUID.randomUUID()+ext;
		
		String realPath = context.getRealPath("/resources/upload/edoc/image");
		
		File path = new File(realPath);
		
		if(!path.exists()) path.mkdirs();
		
		String uploadPath = context.getContextPath()+"/resources/upload/edoc/image/"+renamedFileName;
		
		File upFIle = new File(realPath+"/"+renamedFileName);
		
		uploadFile.transferTo(upFIle);
		
		response = Map.of("uploaded",true,"url",uploadPath);
		}catch(IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK).body(response);
		
	}
	
	@GetMapping("/approvalList")
	public ResponseEntity<List<Map<String,Object>>> selectEmplyeeInSubDepartmentByDeptCode(@RequestParam String deptCode){
		System.out.println(deptCode);
		List<Map<String,Object>> employees = edocService.selectEmployeeInSubDepartmentByDeptCode(deptCode);
		if(employees == null) employees = new ArrayList<>();
		return ResponseEntity.status(HttpStatus.OK).body(employees);
	}
	
	@PostMapping("/processapproval")
	public ResponseEntity<Map<String, Object>> processApproval(@RequestBody ElectronicDocumentApproval aprvl, @SessionAttribute Employee loginEmp){
		ElectronicDocumentApproval approvalResult = null;
		try {
			approvalResult = edocService.processApproval(aprvl,loginEmp);
		}catch(HiveworksException e) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error",e.getMessage()));
		}
		
		return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","200","data",approvalResult));
	}
	
	@GetMapping("/downloadFile")
	public void downloadFile(@RequestParam(name = "filename") String attachRenamedFilename,@RequestParam String edocNo,
			HttpServletResponse response, @RequestHeader(name="user-agent") String userAgent) {
		
		ElectronicDocumentAttachFile attachFile = edocService.getAttachFile(Map.of("attachRenamedFileName",attachRenamedFilename,"attachEdocNo",edocNo));
		
		String path = context.getRealPath("/resources/upload/edoc/");
		File targetFile = new File(path+"/"+attachFile.getAttachRenamedFilename());
		try {
			if(!targetFile.exists()) {
				log.warn("@없는 파일에 대한 접근 /첨부파일 번호 : "+attachFile.getAttachNo()+" 문서번호 : "+attachFile.getAttachEdocRef()+" 변경전 파일이름 : "+ attachFile.getAttachOriginalFilename() +" 변경 후 파일이름 : "+ attachFile.getAttachRenamedFilename());
				response.sendError(HttpStatus.NOT_FOUND.value(), "해당 파일이 존재하지 않습니다.");
				return;
			}			
		}catch(IOException e) {
			e.printStackTrace();
		}
		try(FileInputStream fis = new FileInputStream(targetFile);
				BufferedInputStream bis = new BufferedInputStream(fis);
				BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream())) {
				boolean isMs = userAgent.contains("Trident") || userAgent.contains("MSIE");
				String encodedFilename = "";
				if(isMs) {
					encodedFilename = URLEncoder.encode(attachFile.getAttachOriginalFilename(),"UTF-8");
					encodedFilename = encodedFilename.replaceAll("\\+","%20");
				}else {
					encodedFilename = new String(attachFile.getAttachOriginalFilename().getBytes("UTF-8"),"ISO-8859-1");
				}
				
				response.setContentType("application/octet-stream;charset=utf-8");
				response.setHeader("Content-Disposition","attachment;filename=\""+encodedFilename+"\"");
				
				int data = -1;
				while((data=bis.read()) != -1) {
					bos.write(data);
				}
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/autoupload")
	public  ResponseEntity<Map<String,Object>> autoUpload(@RequestPart(required = false) MultipartFile autograph, @SessionAttribute Employee loginEmp){
		Map<String,Object> response = null;
		File target = null;
		try {
			if(autograph != null) {
				String originalFileName = autograph.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				String renamedFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"))+UUID.randomUUID()+ext;
				
				String realPath = context.getRealPath("/resources/upload/edoc/autograph");
				
				File path = new File(realPath);
				
				if(!path.exists()) path.mkdirs();
				
				String uploadPath = context.getContextPath()+"/resources/upload/edoc/autograph/"+renamedFileName;
				
				target = new File(realPath+"/"+renamedFileName);
				
				autograph.transferTo(target);
				
				response = Map.of("uploaded",true,"url",uploadPath);
				
				int updateResult = edocService.updateAuto(Map.of("empNo",loginEmp.getEmp_no(),"renamedFilename",renamedFileName));
				
				if(updateResult <= 0) {
					throw new HiveworksException("DB입력중 에러");
				}
				loginEmp.setEmp_auto_fileName(renamedFileName);
			} else {
				int updateResult = edocService.updateAuto(Map.of("empNo",loginEmp.getEmp_no()));
				String uploadPath = context.getContextPath()+"/resources/upload/edoc/autograph/defaultApprove.png";
				response = Map.of("uploaded",true,"url",uploadPath);
				if(updateResult <= 0) {
					throw new HiveworksException("DB입력중 에러");
				}
				loginEmp.setEmp_auto_fileName(null);
			}
		}catch(Exception e) {
			e.printStackTrace();
			if(target != null && target.exists()) target.delete();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK).body(response);
	}
	
	@PostMapping("/format/write")
	public ResponseEntity<Map<String,Object>> insertSample(@RequestParam String sample, @SessionAttribute Employee loginEmp){
		
		if(!loginEmp.getAut_code().equals("AUT004")) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","권한이 부족합니다."));
		}
		
		ElectronicDocumentSample sampleInstance = null;
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			sampleInstance = mapper.readValue(sample, ElectronicDocumentSample.class);
			sampleInstance.setCreater(loginEmp.getEmp_no());
		}catch (JsonProcessingException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","양식파싱중 에러"));
		}
		int result = edocService.insertSample(sampleInstance);
		if(result>0) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","200","data",""));
		}else {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","DB입력중 에러발생"));
		}
	}
	
	@PostMapping("/format/copy")
	public ResponseEntity<Map<String,Object>> copySample(@RequestParam String sampleNo, @SessionAttribute Employee loginEmp){
		if(!loginEmp.getAut_code().equals("AUT004")) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","권한이 부족합니다."));
		}
		Map<String, Object> param = new HashMap<>();
		param.put("creater",loginEmp.getEmp_no());
		param.put("sampleNo", sampleNo);
		Map<String, Object> result = edocService.copySample(param);
		
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
	
	@PatchMapping("/format/update")
	public ResponseEntity<Map<String,Object>> updateSample(@RequestParam String sample, @SessionAttribute Employee loginEmp){

		if(!loginEmp.getAut_code().equals("AUT004")) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","권한이 부족합니다."));
		}
		ElectronicDocumentSample sampleInstance = null;
			
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			sampleInstance = mapper.readValue(sample, ElectronicDocumentSample.class);
			sampleInstance.setModifier(loginEmp.getEmp_no());
		}catch (JsonProcessingException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","양식파싱중 에러"));
		}
		int result = edocService.updateSample(sampleInstance);
		if(result>0) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","200","data",""));
		}else {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","DB 수정 중 에러발생"));
		}
	}
	
	@DeleteMapping("/format/delete")
	public ResponseEntity<Map<String,Object>> deleteSample(@RequestParam String sampleNo, @SessionAttribute Employee loginEmp){
		if(!loginEmp.getAut_code().equals("AUT004")) {
			return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","권한이 부족합니다."));
		}

		Map<String, Object> result = edocService.deleteSample(Map.of("modifier",loginEmp.getEmp_no(),"sampleNo", sampleNo));
		
		return ResponseEntity.status(HttpStatus.OK).body(result);
		
	}
	

}
