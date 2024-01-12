/**
 * 
 */
package com.dna.hiveworks.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dna.hiveworks.common.exception.HiveworksException;
import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.code.DsgCode;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;
import com.dna.hiveworks.model.dto.edoc.status.BoxStatus;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;
import com.dna.hiveworks.service.EdocService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletContext;

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
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private EdocService edocService;
	
	@GetMapping("/lists/{status}")
	public String pendingList(@PathVariable String status, Model model, @SessionAttribute Employee loginEmp) {
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
	public String documentBox(@PathVariable String status, Model model, @SessionAttribute Employee loginEmp) {
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
	public String personalSetting() {
		return "edoc/personalSetting";
	}
	@GetMapping("/formatList")
	public @ResponseBody ResponseEntity<List<ElectronicDocumentSample>> getEdocSampleList(@RequestParam String edocDotCode){
		DotCode dotCode = null;
		
		try {
			dotCode = DotCode.valueOf(edocDotCode);
		}catch(IllegalArgumentException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK).body(edocService.getEdocSampleList(dotCode));
	}
	
	@GetMapping("/formatData")
	public @ResponseBody ResponseEntity<ElectronicDocumentSample> getFormatData(@RequestParam String formatNo){
		ElectronicDocumentSample result = edocService.getSample(formatNo);
		if(result == null) {
			System.out.println(result);
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK).body(result);
		
		
	}
	
	
	@PostMapping(value = "/write")
	public @ResponseBody ResponseEntity<Object> writeEdoc(@RequestParam String edoc, @RequestPart(required = false) List<MultipartFile> uploadFiles ) {
		 ElectronicDocument edocInstance;
		 try {
			 ObjectMapper objectMapper = new ObjectMapper();
			 edocInstance = objectMapper.readValue(edoc, ElectronicDocument.class);
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error","전자문서파싱중에러"));
			 //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
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
//		return ResponseEntity.status(HttpStatus.OK).body(Map.of("status","500","error"," 관리자가 처리하지 않음"));
	}
	
	@PostMapping("/imgupload")
	public @ResponseBody ResponseEntity<Map<String,Object>> imgUpload(MultipartHttpServletRequest request){
		Map<String,Object> response = null;
		try {
		MultipartFile uploadFile = request.getFile("upload");
		
		String originalFileName = uploadFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		String renamedFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"))+UUID.randomUUID()+ext;
		
		String realPath = request.getServletContext().getRealPath("/resources/upload/edoc/image");
		
		File path = new File(realPath);
		
		if(!path.exists()) path.mkdirs();
		
		String uploadPath = request.getServletContext().getContextPath()+"/resources/upload/edoc/image0/"+renamedFileName;
		
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
	public @ResponseBody ResponseEntity<List<Map<String,Object>>> selectEmplyeeInSubDepartmentByDeptCode(@RequestParam String deptCode){
		System.out.println(deptCode);
		List<Map<String,Object>> employees = edocService.selectEmployeeInSubDepartmentByDeptCode(deptCode);
		if(employees == null) employees = new ArrayList<>();
		return ResponseEntity.status(HttpStatus.OK).body(employees);
	}
	
	@GetMapping("/read")
	public String readElectronicDocument(@RequestParam String edocNo, @SessionAttribute Employee loginEmp, Model model) {
		
		ElectronicDocument edoc  = edocService.selectElectronicDocument(edocNo);
		
		System.out.println("edoc: " + edoc);
		
		model.addAttribute("edoc",edoc);
		
		return "edoc/read";
	}
	
	@GetMapping("/format/lists")
	public String formatLists(Model model) {
		return "edoc/formatList";
	}
	
	@GetMapping("/format/write")
	public String formatWrite(Model model) {
		return "edoc/formatWrite";
	}
}
