/**
 * 
 */
package com.dna.hiveworks.serviceimpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dao.EdocDao;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentReference;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;
import com.dna.hiveworks.service.EdocService;

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
	
	@Override
	public List<ElectronicDocumentList> getEdocList(Map<String, Object> param) {
		
		return dao.getEdocList(session, param);
	}

	@Override
	public List<ElectronicDocumentList> getEdocBox(Map<String, Object> param) {
		
		return dao.getEdocBox(session,param);
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
	public ElectronicDocument insertEdoc(ElectronicDocument edoc) {
		edoc.setEdocPreservePeriod(
				Date.valueOf(
						LocalDate.of(LocalDate.now().getYear()+edoc.getPeriod()+1, 1, 1)));
		
		int result = 0;
		result = dao.insertEdoc(session,edoc);
		if(result >0) {
			List<ElectronicDocumentApproval> approval = edoc.getApproval();
			approval.forEach((e)->e.setAprvlEdocNo(edoc.getEdocNo()));
			result *= dao.insertEdocApproval(session, approval);
			
			List<ElectronicDocumentReference> reference = edoc.getReference();
			if(reference.size()>0) {
				reference.forEach((e)->e.setRefperEdocNo(edoc.getEdocNo()));
				result *= dao.insertEdocReference(session, reference);
			}
			if(result >0) {
				return dao.getEdoc(session,edoc.getEdocNo());
			}else return null;
		}
		else return null;
	}
	
	@Override
	public List<Map<String, Object>> selectEmployeeInSubDepartmentByDeptCode(String deptCode) {
		return dao.selectEmployeeInSubDepartmentByDeptCode(session, deptCode);
	}
}
