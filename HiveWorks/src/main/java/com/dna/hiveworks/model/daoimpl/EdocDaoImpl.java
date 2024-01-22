/**
 * 
 */
package com.dna.hiveworks.model.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dao.EdocDao;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentComment;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentReference;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;

/**
 * @author : 이재연
 * @since : 2023. 12. 29.
 * Description : ElectronicDocumentDao의 구현체
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 29., 설명 : 최초작성
 * 
 */
@Repository
public class EdocDaoImpl implements EdocDao{

	@Override
	public List<ElectronicDocumentList> getEdocList(SqlSession session, Map<String, Object> param) {
		return session.selectList("edoc.getEdocList", param);
	}

	@Override
	public List<ElectronicDocumentList> getEdocBox(SqlSession session, Map<String, Object> param) {
		if(param.get("status").equals("ALL")) {
			return session.selectList("edoc.getEdocBoxAll",param);
		}else {
			return session.selectList("edoc.getEdocBox", param);
		}
	}
	
	@Override
	public Map<String, Object> getEmpData(SqlSession session, int empNo) {
		return session.selectOne("edoc.getEmpData", empNo);
	}
	
	@Override
	public List<ElectronicDocumentSample> getSampleAll(SqlSession session) {
		return session.selectList("edoc.getSampleAll");
	}
	
	
	@Override
	public List<ElectronicDocumentSample> getEdocSampleList(SqlSession session, DotCode edocDotCode) {
		return session.selectList("edoc.getEdocSampleList", edocDotCode);
	}
	
	@Override
	public ElectronicDocumentSample getSample(SqlSession session, String sampleNo) {
		return session.selectOne("edoc.getSample",sampleNo);
	}

	@Override
	public int insertEdoc(SqlSession session, ElectronicDocument edoc) {
		return session.insert("edoc.insertEdoc", edoc);
	}
	
	@Override
	public List<Map<String, Object>> selectEmployeeInSubDepartmentByDeptCode(SqlSession session, String deptCode) {
		return session.selectList("department.searchEmployeeInSubDepartmentByDeptCode",deptCode);
	}
	
	@Override
	public int insertEdocApproval(SqlSession session, List<ElectronicDocumentApproval> approval) {
		final int[] result = {0};
		approval.forEach(apv->{result[0] += session.insert("edoc.insertEdocApproval",apv);});
		return result[0];
	}

	@Override
	public int insertEdocReference(SqlSession session, List<ElectronicDocumentReference> reference) {
		final int[] result = {0};
		reference.forEach(ref ->{result[0] += session.insert("edoc.insertEdocReference",ref);});
		return result[0];
	}
	
	@Override
	public int insertEdocAttachFile(SqlSession session, List<ElectronicDocumentAttachFile> attachFile) {
		final int[] result = {0};
		attachFile.forEach(file ->{result[0]+= session.insert("edoc.insertEdocAttachFile",file);});
		return result[0];
	}

	@Override
	public ElectronicDocument selectElectronicDocument(SqlSession session, String edocNo) {
		return session.selectOne("edoc.selectElectronicDocument", edocNo);
	}

	@Override
	public List<ElectronicDocumentApproval> selectElectronicDocumentApproval(SqlSession session, String edocNo) {
		return session.selectList("edoc.selectElectronicDocumentApproval", edocNo);
	}

	@Override
	public List<ElectronicDocumentAttachFile> selectElectronicDocumentAttachFiles(SqlSession session, String edocNo) {
		return session.selectList("edoc.selectElectronicDocumentAttachFiles", edocNo);
	}

	@Override
	public List<ElectronicDocumentComment> selectElectronicDocumentComments(SqlSession session, String edocNo) {
		return session.selectList("edoc.selectElectronicDocumentComments", edocNo);
	}
	
	@Override
	public List<ElectronicDocumentReference> selectElectronicDocumentReference(SqlSession session, String edocNo) {
		return session.selectList("edoc.selectElectronicDocumentReference", edocNo);
	}
	
	@Override
	public int processApproval(SqlSession session, ElectronicDocumentApproval aprvl) {
		return session.update("edoc.processApproval", aprvl);
	}
	
	@Override
	public int referenceCheck(SqlSession session, int refperNo) {
		return session.update("edoc.referenceCheck", refperNo);
	}
	
	@Override
	public int edocFinalize(SqlSession session, ElectronicDocument edoc) {
		return session.update("edoc.edocFinalize", edoc);
	}
	
	@Override
	public int setNextApprovalStatus(SqlSession session, ElectronicDocumentApproval nextApproval) {
		return session.update("edoc.setNextApprovalStatus", nextApproval);
	}
	
	@Override
	public ElectronicDocumentAttachFile getAttachFile(SqlSession session, Map<String, Object> param) {
		return session.selectOne("edoc.getAttachFile", param);
	}
	
	@Override
	public int updateAuto(SqlSession session, Map<String, Object> param) {
		return session.update("edoc.updateAuto", param);
	}
	
	@Override
	public int cancleApproval(SqlSession session, List<ElectronicDocumentApproval> leftApproval) {
		int[] result = {0};
			leftApproval.forEach(apv->{ result[0] += session.update("edoc.cancleApproval",apv); });
		return result[0];
	}
	
	@Override
	public int revokeDocument(SqlSession session, ElectronicDocument edoc) {
		return session.update("edoc.revokeDocument", edoc);
	}
}
