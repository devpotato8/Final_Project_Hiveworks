/**
 * 
 */
package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dto.edoc.CompanySetting;
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
 * Description : 전자문서 관련 DB와 연결되는 기능들을 모아놓은 인터페이스
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 29., 설명 : 최초작성
 * 
 */
public interface EdocDao {

	List<ElectronicDocumentList> getEdocList(SqlSession session, Map<String, Object> param);

	List<ElectronicDocumentList> getEdocBox(SqlSession session, Map<String, Object> param);
	
	Map<String, Object> getEmpData(SqlSession session, int empNo);
	
	List<ElectronicDocumentSample> getSampleAll(SqlSession session);
	
	List<ElectronicDocumentSample> getEdocSampleList(SqlSession session, DotCode edocDotCode);

	ElectronicDocumentSample getSample(SqlSession session, String sampleNo);
	
	int insertEdoc(SqlSession session, ElectronicDocument edoc);

	List<Map<String, Object>> selectEmployeeInSubDepartmentByDeptCode(SqlSession session, String deptCode);
	
	int insertEdocApproval(SqlSession session, List<ElectronicDocumentApproval> approval);

	int insertEdocReference(SqlSession session, List<ElectronicDocumentReference> reference);

	int insertEdocAttachFile(SqlSession session, List<ElectronicDocumentAttachFile> attachFile);

	ElectronicDocument selectElectronicDocument(SqlSession session, String edocNo);

	List<ElectronicDocumentApproval> selectElectronicDocumentApproval(SqlSession session, String edocNo);
	
	List<ElectronicDocumentAttachFile> selectElectronicDocumentAttachFiles(SqlSession session, String edocNo);

	List<ElectronicDocumentComment> selectElectronicDocumentComments(SqlSession session, String edocNo);

	int processApproval(SqlSession session, ElectronicDocumentApproval aprvl);
	
	int edocFinalize(SqlSession session, ElectronicDocument edoc);
	
	int setNextApprovalStatus(SqlSession session, ElectronicDocumentApproval nextApproval);
	
	ElectronicDocumentAttachFile getAttachFile(SqlSession session, Map<String, Object> param);

	int updateAuto(SqlSession session, Map<String, Object> param);

	int cancleApproval(SqlSession session, List<ElectronicDocumentApproval> leftApproval);
	
	int revokeDocument(SqlSession session, ElectronicDocument edoc);

	List<ElectronicDocumentReference> selectElectronicDocumentReference(SqlSession session, String edocNo);

	int referenceCheck(SqlSession session, int refperNo);
	
	int insertSample(SqlSession session, ElectronicDocumentSample sample);
	
	int copySample(SqlSession session, Map<String, Object> param);
	
	int updateSample(SqlSession session, ElectronicDocumentSample sample);
	
	int deleteSample(SqlSession session, Map<String, Object> param);

	String getPosCodeByDsgCode(SqlSession session, String name);

	CompanySetting getEdocManagerSetting(SqlSession session);

	List<Map<String, Object>> getAccessGrantSetting(SqlSession session);

	int updateEdocManagerSetting(SqlSession session, CompanySetting cs);

	int updateEdocAccessGrant(SqlSession session, Map<String, Object> param);
	
}
