/**
 * 
 */
package com.dna.hiveworks.serviceimpl;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.common.SessionUserMap;
import com.dna.hiveworks.common.exception.HiveworksException;
import com.dna.hiveworks.model.code.ApvCode;
import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.code.DsgCode;
import com.dna.hiveworks.model.code.PosCode;
import com.dna.hiveworks.model.dao.EdocDao;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.CompanySetting;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentReference;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;
import com.dna.hiveworks.service.EdocService;
import com.dna.hiveworks.service.MsgService;
import com.dna.hiveworks.service.VacationService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletContext;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 전자문서에 관한 Service Interface 의 구현체
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
@Service
public class EdocServiceImpl implements EdocService{
	
	@Autowired
	//전자문서 Dao
	private EdocDao dao;
	
	@Autowired
	// Sql Session Factory
	private SqlSession session;
	
	@Autowired
	// ServletContext
	private ServletContext context;
	
	@Autowired
	//메세지 서비스(쪽지)
	private MsgService msgService;
	
	@Autowired
	//휴가 서비스
	private VacationService vacService;
	
	@Autowired
	// 알림용 Websocket Session Map
	private SessionUserMap sessionUserMap;
	
	@Autowired
	private SimpMessagingTemplate template;
	
	@Override
	public List<ElectronicDocumentList> getEdocList(Map<String, Object> param) {
		
		return dao.getEdocList(session, param);
	}

	@Override
	public List<ElectronicDocumentList> getEdocBox(Map<String, Object> param) {
		
		return dao.getEdocBox(session, param);
	}
	
	@Override
	public Map<String, Object> getEmpData(int empNo) {
		return dao.getEmpData(session, empNo);
	}
	
	@Override
	public List<ElectronicDocumentSample> getEdocSampleList(DotCode edocDotCode) {
		return dao.getEdocSampleList(session, edocDotCode);
	}
	
	@Override
	public ElectronicDocumentSample getSample(String formatNo) {
		ElectronicDocumentSample sample = dao.getSample(session, formatNo);
		if(sample.getSampleFormat() != null) {
			sample.setFullSample(sample.getSampleContent().replace("{{상세내용}}", sample.getSampleFormat()));
		}else {
			sample.setFullSample(sample.getSampleContent());
		}
		return sample; 
	}
	
	@Transactional
	@Override
	public int insertEdoc(ElectronicDocument edoc) {
		if(edoc.getEdocPreservePeriod() == null && edoc.getPeriod()>0) {
			edoc.setEdocPreservePeriod(
					Date.valueOf(
							LocalDate.of(LocalDate.now().getYear()+edoc.getPeriod()+1, 1, 1))
					);
		}
		
		int result = 0;
		
		result = dao.insertEdoc(session,edoc);
		
		if(result >0) {
			List<ElectronicDocumentApproval> approval = edoc.getApproval();
			approval.forEach((e)->e.setAprvlEdocNo(edoc.getEdocNo()));
			dao.insertEdocApproval(session, approval);
			if(approval.size() < 2) {
				dao.edocFinalize(session, edoc);
			}else {
				ElectronicDocumentApproval apv = approval.stream().filter(t -> t.getAprvlStatus().equals("W")).findAny().get();
				msgService.sendMsg(makeMsg(apv.getAprvlEmpNo(),edoc.getCreater(), apv.getAprvlEdocNo()));
			}
			
			List<ElectronicDocumentReference> reference = edoc.getReference();
			if(reference != null && reference.size()>0) {
				reference.forEach((e)->e.setRefperEdocNo(edoc.getEdocNo()));
				result *= dao.insertEdocReference(session, reference);
			}
			
			List<ElectronicDocumentAttachFile> attachFile = edoc.getAttachFiles();
			if(attachFile != null && attachFile.size()>0) {
				attachFile.forEach((e)->e.setAttachEdocRef(edoc.getEdocNo()));
				result *= dao.insertEdocAttachFile(session,attachFile);
			}
			return result;
		}else return result;
	}
	
	@Override
	public List<Map<String, Object>> selectEmployeeInSubDepartmentByDeptCode(String deptCode) {
		return dao.selectEmployeeInSubDepartmentByDeptCode(session, deptCode);
	}
	
	@Override
	@Transactional
	public ElectronicDocument selectElectronicDocument(String edocNo, int empNo) {
		
		ElectronicDocument edoc = dao.selectElectronicDocument(session, edocNo);
		edoc.setApproval(dao.selectElectronicDocumentApproval(session, edocNo));
		edoc.setAttachFiles(dao.selectElectronicDocumentAttachFiles(session,edocNo));
		List<ElectronicDocumentReference> refList =dao.selectElectronicDocumentReference(session, edocNo); 
		edoc.setReference(refList);
		
		Map<String,Object> empData = dao.getEmpData(session, edoc.getCreater());
		edoc.setCreaterEmpName((String)empData.get("EMPNAME"));
		edoc.setCreaterDeptName((String)empData.get("DEPTNAME"));
		edoc.setCreaterJobName((String)empData.get("JOBNAME"));
		
		ElectronicDocumentReference target  = ElectronicDocumentReference.builder().refperEdocNo(edocNo).refperEmpNo(empNo).build(); 
		if(refList != null && refList.contains(target)) {
			ElectronicDocumentReference ref = refList.get(refList.indexOf(target));
			if(ref.getRefperStatus().equals("N")) {
				dao.referenceCheck(session, ref.getRefperNo());
			}
		}
		return edoc;
	}
	
	@Override
	@Transactional
	public ElectronicDocumentApproval processApproval(ElectronicDocumentApproval aprvl, Employee loginEmp) throws HiveworksException{
		
		// 받아온 결재정보의 결재자정보에 현재 로그인한 사람의 사번을 저장
		aprvl.setAprvlEmpNo(loginEmp.getEmp_no());
		
		// DB에서 결재가 될 문서를 불러옴
		ElectronicDocument edoc = dao.selectElectronicDocument(session, aprvl.getAprvlEdocNo());
		
		//해당 결재문서의 결재정보를 가져옴
		List<ElectronicDocumentApproval> approvalList = dao.selectElectronicDocumentApproval(session, aprvl.getAprvlEdocNo());
		
		// 전자문서의 결재정보를 담을 변수 생성
		ElectronicDocumentApproval dbAprvlData = null;
		
		// 해당 결재정보의 index값
		int approvalIndex = -1;
		
		// 전자문서의 현재 정보가 DST100(진행중)인지 검사
		if(!edoc.getEdocStatus().equals("DST100")) {
			throw new HiveworksException("이미 처리된 문서입니다.");
			
		// 받아온 결재정보의 '문서번호','결재번호','사번' 정보로 유효한 요청인지 검사
		} else if(approvalList== null || approvalList.isEmpty()||!approvalList.contains(aprvl)) {
			throw new HiveworksException("해당 결재건이 존재하지 않습니다.\\n 문서번호 나 결재번호 혹은 결재자 정보가 일치하지 않습니다.");
			
		// 유효한 요청이라면 결재정보를 담을 변수에 해당 정보를 저장
		}else {
			approvalIndex = approvalList.indexOf(aprvl);
			dbAprvlData = approvalList.get(approvalIndex);
		}
		// DB에 해당 결재가 이미 처리된 결재인지 검사
		if(!dbAprvlData.getAprvlApvCode().equals(ApvCode.APV000)) {
			throw new HiveworksException("이미 결재처리 되어있습니다.");
		}
		
		// 결재처리
		int approvalResult = dao.processApproval(session, aprvl);
		
		// 결재처리가 성공 && 결재코드가 'APV001'(결재)일 때 
		if(approvalResult > 0 && aprvl.getAprvlApvCode().equals(ApvCode.APV001)) {
			// 현재 처리된 결재가 마지막 결재였을 때
				if(approvalList.size()-1 == approvalIndex) {
					// 전자문서 완료처리
					dao.edocFinalize(session, edoc);
					if(edoc.getEdocDotCode().equals(DotCode.DOT004)) {
						// 완료처리된 문서가 휴가/연가 신청서 일때, 휴가/연가 완료처리
						vacService.confirmVacation(edoc.getEdocNo());
					}
				}else {
					// 다음차례 결재자의 상태를 P에서 W로 변경
					ElectronicDocumentApproval nextApproval = approvalList.get(approvalIndex+1);
					dao.setNextApprovalStatus(session, nextApproval);
					
					// 다음차례 결재자에게 쪽지전송
					msgService.sendMsg(makeMsg(nextApproval.getAprvlEmpNo(),edoc.getCreater(), aprvl.getAprvlEdocNo()));
					
					// 쪽지 알람 발송
					Map<String, Object> nextEmpId = dao.getEmpData(session, nextApproval.getAprvlEmpNo());
					sendAlarm((String)nextEmpId.get("EMPID"),"결재가 필요한 전자문서가 도착하였습니다.");
				}
		// 결재코드가 'APV002(반려)'일때
		}else if(approvalResult > 0 && aprvl.getAprvlApvCode().equals(ApvCode.APV002)){
			// 내 뒤로 남은 결재자가 남았을 때
			List<ElectronicDocumentApproval> leftApproval = null;
			if(approvalList.size()  > approvalIndex+1) {
				leftApproval = approvalList.subList(approvalIndex+1, approvalList.size());
			}
			if(leftApproval != null) {
				// 남은 결재자들의 결재를 취소처리
				dao.cancleApproval(session,leftApproval);
			}
			// 문서의 반려처리
			dao.revokeDocument(session, edoc);
			//반려된 문서가 휴가 / 연가 신청서라면
			if(edoc.getEdocDotCode().equals(DotCode.DOT004)) {
				vacService.revokeVacation(edoc.getEdocNo());
			}
		}else {
			throw new HiveworksException("결재처리중 에러가 발생하였습니다");
		}
		
		dbAprvlData.setAprvlApvCode(aprvl.getAprvlApvCode());
		dbAprvlData.setAprvlComment(aprvl.getAprvlComment());
		dbAprvlData.setAprvlStatus("A");
		dbAprvlData.setAprvlDate(Date.valueOf(LocalDate.now()));
		return dbAprvlData;
	}
	
	@Override
	public ElectronicDocumentAttachFile getAttachFile(Map<String, Object> param) {
		return dao.getAttachFile(session, param);
	}
	
	@Override
	public int updateAuto(Map<String, Object> param) {
		return dao.updateAuto(session, param);
	}
	
	private Map<String,Object> makeMsg(int receiverEmpNo,int senderEmpNo, String edocNo) {
		
		Map<String,Object> msg = new HashMap<>();
			msg.put("receiverEmpNo", List.of(receiverEmpNo));
			msg.put("receiverNames", List.of(dao.getEmpData(session, receiverEmpNo).get("EMPNAME")));
			msg.put("senderEmpNo",senderEmpNo);
			msg.put("msgCategory", "MCT001");
			msg.put("msgCategoryName", "업무연락");
			msg.put("msgTitle", "결재 요망");
			msg.put("msgContent", "문서번호 : "+edocNo+"<br><a href=\""+ context.getContextPath() +"/edoc/read?edocNo="+edocNo+"\">바로가기</a>");
			
		return msg;
	}

	@Override
	public List<ElectronicDocumentSample> getEdocSampleList() {
		return dao.getSampleAll(session);
	}
	
	@Override
	public int insertSample(ElectronicDocumentSample sample) {
		return dao.insertSample(session, sample);
	}
	
	@Override
	@Transactional
	public Map<String, Object> copySample(Map<String, Object> param) {
		ElectronicDocumentSample sample = dao.getSample(session, (String)param.get("sampleNo"));
		param.put("newSampleNo", 0);
		if(sample != null && sample.isUseYn()) {
			int result = dao.copySample(session, param);
			sample.setSampleNo((int)param.get("newSampleNo"));
			sample.setDotCodeName(sample.getSampleDotCode().getCode());
			if(result>0) {
				return Map.of("status","200","data",sample);
			}else {
				return Map.of("status","500","error","복사실패");
			}
		}else {
			return Map.of("status","500","error","해당번호의 양식이 존재하지 않습니다.");
		}
	}
	
	@Override
	public int updateSample(ElectronicDocumentSample sample) {
		return dao.updateSample(session, sample);
	}
	
	@Override
	@Transactional
	public Map<String, Object> deleteSample(Map<String, Object> param) {
		
		ElectronicDocumentSample sample = dao.getSample(session, (String)param.get("sampleNo"));
		
		if(sample != null && sample.isUseYn()) {
			int result = dao.deleteSample(session, param);
			if(result>0) {
				return Map.of("status","200","data","삭제성공");
			}else {
				return Map.of("status","500","error","삭제실패");
			}
		}else {
			return Map.of("status","500","error","해당번호의 양식이 존재하지 않습니다.");
		}
	}
	
	@Override
	@Transactional
	public Map<String, Object> edocPrint(Map<String, Object> param) {
		
		ElectronicDocument document = dao.selectElectronicDocument(session, (String)param.get("edocNo"));
		if(document == null) return Map.of("status","404","error","해당문서가 존재하지 않습니다");
		document.setApproval(dao.selectElectronicDocumentApproval(session, document.getEdocNo()));
		document.setAttachFiles(dao.selectElectronicDocumentAttachFiles(session, document.getEdocNo()));
		document.setReference(dao.selectElectronicDocumentReference(session, document.getEdocNo()));
		
		PosCode documentAccessGrant = PosCode.valueOf(dao.getPosCodeByDsgCode(session, document.getEdocDsgCode().name()));
		int empNo  = (int)param.get("empNo");
		boolean isApprovalContainsEmp = document.getApproval().stream().anyMatch(apv -> apv.getAprvlEmpNo()==empNo);
		boolean isReferenceContainsEmp = document.getReference().stream().anyMatch(ref -> ref.getRefperEmpNo()==empNo);
		boolean isUserPosCodeLowerThenAccessGrant = PosCode.valueOf((String)param.get("posCode")).compareTo(documentAccessGrant)<0;
		
		
		if(!isApprovalContainsEmp && !isReferenceContainsEmp&& !isUserPosCodeLowerThenAccessGrant) return Map.of("status","403","error","권한이 부족합니다.");
		ElectronicDocumentSample sample = dao.getSample(session, String.valueOf(document.getEdocSampleNo()));
		
		String content = makePrint(sample, document);
		
		return Map.of("status","200","data",content);
	}
	
	@Override
	public Map<String, Object> edocPrintPreview(Map<String, Object> param) {
		
		ElectronicDocumentSample sample = dao.getSample(session, (String)param.get("sampleNo"));
		if(sample == null) return Map.of("status","404","error","해당번호의 서식을 찾을 수 없습니다.");
		
		String content = makePrint(sample, null);
		
		return Map.of("status","200","data",content);
	}
	

	private String makePrint(ElectronicDocumentSample sample, ElectronicDocument document) {
		boolean isEdocNull = document == null;
		StringBuilder content = new StringBuilder();
		content.append(sample.getSampleContent());
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yy.MM.dd");
		DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yy.MM.dd HH:mm");
		
		String createDate = isEdocNull ? LocalDate.now().format(dateFormat) : document.getCreateDate().toLocalDate().format(dateFormat);
		String createDateTime = isEdocNull ? LocalDateTime.now().format(dateTimeFormat) : new java.util.Date(document.getCreateDate().getTime()).toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime().format(dateTimeFormat);
		
		String startDate = !isEdocNull &&document.getEdocStartDate() != null ? document.getEdocStartDate().toLocalDate().format(dateFormat):"";
		String startDateTime = !isEdocNull &&document.getEdocStartDate()!= null ? new java.util.Date(document.getEdocStartDate().getTime()).toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime().format(dateTimeFormat):"";
		
		String endDate = !isEdocNull &&document.getEdocEndDate() != null? document.getEdocEndDate().toLocalDate().format(dateFormat):"";
		String endDateTime = !isEdocNull &&document.getEdocEndDate() != null ? new java.util.Date(document.getEdocEndDate().getTime()).toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime().format(dateTimeFormat):"";
		
		while(content.indexOf("{{문서번호}}")!= -1) {
			int startIndex = content.indexOf("{{문서번호}}");
			int endIndex = startIndex + 8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"edocNo\">문서번호</span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"edocNo\">"+document.getEdocNo()+"</span>");
			}
		}
		while(content.indexOf("{{기안자}}")!= -1) {
			int startIndex = content.indexOf("{{기안자}}");
			int endIndex = startIndex + 7;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"createrName\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"createrName\">"+document.getApproval().get(0).getAprvlEmpName()+"</span>");
			}
		}
		while(content.indexOf("{{기안일자}}")!= -1) {
			int startIndex = content.indexOf("{{기안일자}}");
			int endIndex = startIndex + 8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"createDate\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"createDate\">"+ createDate+"</span>");
			}
		}
		while(content.indexOf("{{기안일시}}")!= -1) {
			int startIndex = content.indexOf("{{기안일시}}");
			int endIndex = startIndex + 8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"createDateTime\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"createDateTime\">"+createDateTime+"</span>");
			}
		}
		while(content.indexOf("{{기안자사번}}")!= -1) {
			int startIndex = content.indexOf("{{기안자사번}}");
			int endIndex = startIndex +9;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"createrNo\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"createrNo\">"+document.getApproval().get(0).getAprvlEmpNo()+"</span>");
			}
		}
		while(content.indexOf("{{기안자부서}}")!= -1) {
			int startIndex = content.indexOf("{{기안자부서}}");
			int endIndex = startIndex +9;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"createrDeptName\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"createrDeptName\">"+document.getApproval().get(0).getAprvlDeptName()+"</span>");
			}
		}
		while(content.indexOf("{{기안자직급}}")!= -1) {
			int startIndex = content.indexOf("{{기안자직급}}");
			int endIndex = startIndex +9;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"createrPosName\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"createrPosName\">"+document.getApproval().get(0).getAprvlPosName()+"</span>");
			}
		}
		while(content.indexOf("{{제목}}")!= -1) {
			int startIndex = content.indexOf("{{제목}}");
			int endIndex = startIndex +6;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"edocTitle\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"edocTitle\">"+document.getEdocTitle()+"</span>");
			}
		}
		while(content.indexOf("{{상세내용}}")!= -1) {
			int startIndex = content.indexOf("{{상세내용}}");
			int endIndex = startIndex +8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<div class=\"edocContent\"></div>");
			}else {
				content.replace(startIndex, endIndex, "<div class=\"edocContent\">"+document.getEdocContent()+"</div>");
			}
		}
		while(content.indexOf("{{시작일자}}")!= -1) {
			int startIndex = content.indexOf("{{시작일자}}");
			int endIndex = startIndex +8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"edocStartDate\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"edocStartDate\">"+startDate+"</span>");
			}
		}
		while(content.indexOf("{{시작일시}}")!= -1) {
			int startIndex = content.indexOf("{{시작일시}}");
			int endIndex = startIndex +8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"edocStartDateTime\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"edocStartDateTime\">"+startDateTime+"</span>");
			}
		}
		while(content.indexOf("{{종료일자}}")!= -1) {
			int startIndex = content.indexOf("{{종료일자}}");
			int endIndex = startIndex +8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"edocEndDate\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"edocEndDate\">"+endDate+"</span>");
			}
		}
		while(content.indexOf("{{종료일시}}")!= -1) {
			int startIndex = content.indexOf("{{종료일시}}");
			int endIndex = startIndex +8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<span  class=\"edocEndDateTime\"></span>");
			}else {
				content.replace(startIndex, endIndex, "<span  class=\"edocEndDateTime\">"+endDateTime+"</span>");
			}
		}
		while(content.indexOf("{{결재선}}")!= -1) {
			int startIndex = content.indexOf("{{결재선}}");
			int endIndex = startIndex +7;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<figure class=\"table approval-container\" style=\"width:100%;height:100%\"></figure>");
			}else {
				StringBuilder sb = new StringBuilder();
				List<ElectronicDocumentApproval> approvalList = document.getApproval();
				sb.append("<figure class=\"table approval-container\" style=\"width:100%;height:100%;\">");
				sb.append("<table class=\"ck-table-resized\" style=\"border 1px solid black\">");
				sb.append("<colgroup>");
				for(int i=0; i<approvalList.size(); i++) {
					sb.append("<col style=\"width:"+(Math.round(10000/approvalList.size())/100)+"%\">");
				}
				sb.append("</colgroup>");
				sb.append("<tbody>");
				sb.append("<tr>");
				for(ElectronicDocumentApproval apv : approvalList) {
					sb.append("<td style=\"border:1px solid hsl(0, 0%, 0%);padding:0px;text-align:center; height:20%;\">");
					sb.append(apv.getAprvlEmpName());
					sb.append("</td>");
				}
				sb.append("</tr>");
				sb.append("<tr>");
				for(ElectronicDocumentApproval apv : approvalList) {
					sb.append("<td style=\"border:1px solid hsl(0, 0%, 0%);padding:0px;text-align:center;min-height:48px\">");
					if(!apv.getAprvlApvCode().equals(ApvCode.APV000)) {
						sb.append("<img class=\"img-autograph\" src=\""+context.getContextPath()+"/resources/upload/edoc/autograph/"+apv.getAprvlAutoFilename()+"\">");
					}
					sb.append("</td>");
				}
				sb.append("</tr>");
				sb.append("<tr>");
				for(ElectronicDocumentApproval apv : approvalList) {
					sb.append("<td style=\"border:1px solid hsl(0, 0%, 0%);padding:0px;text-align:center;height:20%;\">");
					if(!apv.getAprvlApvCode().equals(ApvCode.APV000)) {
						sb.append(apv.getAprvlDate().toLocalDate().format(dateFormat));
					}
					sb.append("</td>");
				}
				sb.append("</tr>");
				sb.append("</tbody>");
				sb.append("</table>");
				sb.append("</figure>");
				content.replace(startIndex, endIndex, sb.toString());
			}
		}
		while(content.indexOf("{{첨부목록}}")!= -1) {
			int startIndex = content.indexOf("{{첨부목록}}");
			int endIndex = startIndex +8;
			if(isEdocNull) {
				content.replace(startIndex, endIndex, "<ol class=\"attach-file-container\"></ol>");
			}else {
				StringBuilder sb = new StringBuilder();
				List<ElectronicDocumentAttachFile> attachFileList = document.getAttachFiles();
				sb.append("<ol class=\"attach-file-container\">");
				for(ElectronicDocumentAttachFile attachFile : attachFileList) {
					sb.append("<li>");
					sb.append(attachFile.getAttachOriginalFilename());
					sb.append("</li>");
				}
				sb.append("</ol>");
				content.replace(startIndex, endIndex, sb.toString());
			}
		}
		
		return content.toString();
	}
	
	@Override
	public CompanySetting getEdocManagerSetting() {
		return dao.getEdocManagerSetting(session);
	}
	@Override
	public List<Map<String, Object>> getAccessGrantSetting() {
		return dao.getAccessGrantSetting(session);
	}
	
	@Override
	@Transactional
	public Map<String, Object> updateManagerStting(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		try {
			CompanySetting cs = CompanySetting.builder().edocPrefix((String)param.get("edocPrefix"))
																										.edocDateFormat((String)param.get("edocDateFormat"))
																										.edocNumFormat((String)param.get("edocNumFormat"))
																										.build();
			List<Map<String, Object>> accessGrant = new ArrayList<>();
			param.entrySet().forEach(t -> {
				for(DsgCode code : DsgCode.values()) {
					if(code.name().equals(t.getKey())) {
						accessGrant.add(Map.of("dsgCode",t.getKey(),"posCode",t.getValue()));
						break;
					}
				}
			});
			int[] updateResult = {1};
			updateResult[0] *= dao.updateEdocManagerSetting(session,cs);
			accessGrant.forEach(t -> {
				updateResult[0] *= dao.updateEdocAccessGrant(session,t);
			});
			if(updateResult[0] != 0) {
				result.put("status", 200);
				result.put("data", "정상적으로 업데이트 되었습니다.");
			}else {
				result.put("status", 500);
				result.put("error", "DB입력중 오류가 발생하였습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", 500);
			result.put("error", "설정 수정 중 오류가 발생하였습니다.");
		}
		
		return result;
	}
	
	private void sendAlarm(String receiverEmpid, String title){
		 if (sessionUserMap.containsValue(receiverEmpid)) {
	        	
	        	Map<String, Object> msg = new HashMap<>();  //웹소켓 클라이언트로 전달할 정보들 담기
	            msg.put("senderName", "관리자");
	            msg.put("senderDeptName", "");
	            msg.put("senderJobName", "");
	            msg.put("title", title);
	            msg.put("receiverId",receiverEmpid);
	            String jsonMsg = "";
	            try {
	            //ObjectMapper로 map에 담긴 데이터를 Json방식으로 변환하여 전달한다
	            ObjectMapper objectMapper = new ObjectMapper();
		        jsonMsg = objectMapper.writeValueAsString(msg);
	            }catch(IOException e) {
	            	e.printStackTrace();
	            }
	            
		        template.convertAndSend(
	                //receiverUserId, // 받는 사람의 사용자 아이디
	                "/topic/messages",
	                jsonMsg
	            );
	        }
	}
}