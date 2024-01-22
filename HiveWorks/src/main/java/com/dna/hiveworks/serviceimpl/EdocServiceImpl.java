/**
 * 
 */
package com.dna.hiveworks.serviceimpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.common.exception.HiveworksException;
import com.dna.hiveworks.model.code.ApvCode;
import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dao.EdocDao;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentReference;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;
import com.dna.hiveworks.service.EdocService;
import com.dna.hiveworks.service.MsgService;
import com.dna.hiveworks.service.VacationService;

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
	private EdocDao dao;
	@Autowired
	private SqlSession session;
	@Autowired
	ServletContext context;
	@Autowired
	MsgService msgService;
	@Autowired
	VacationService vacService;

	
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
		return dao.getSample(session, formatNo);
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
		edoc.setComments(dao.selectElectronicDocumentComments(session, edocNo));
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
//					else if(edoc.getEdocDotCode().equals(DotCode.DOT005)) {
//						// TODO 완료처리된 문서가 연장근무신청서일때 처리로직
//					}
				}else {
					// 다음차례 결재자의 상태를 P에서 W로 변경
					ElectronicDocumentApproval nextApproval = approvalList.get(approvalIndex+1);
					dao.setNextApprovalStatus(session, nextApproval);
					
					// 다음차례 결재자에게 쪽지전송
					msgService.sendMsg(makeMsg(nextApproval.getAprvlEmpNo(),edoc.getCreater(), aprvl.getAprvlEdocNo()));
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
//			else if(edoc.getEdocDotCode().equals(DotCode.DOT005)) {
//				// TODO 완료처리된 문서가 연장근무신청서일때 처리로직
//			}
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
}