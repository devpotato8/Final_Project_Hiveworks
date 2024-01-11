/**
 * 
 */
package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
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
	
	List<ElectronicDocumentSample> getEdocSampleList(SqlSession session, DotCode edocDotCode);

	ElectronicDocumentSample getSample(SqlSession session, String sampleNo);
	
	int insertEdoc(SqlSession session, ElectronicDocument edoc);

	ElectronicDocument getEdoc(SqlSession session, String edocNo);
	
	List<Map<String, Object>> selectEmployeeInSubDepartmentByDeptCode(SqlSession session, String deptCode);
	
	int insertEdocApproval(SqlSession session, List<ElectronicDocumentApproval> approval);

	int insertEdocReference(SqlSession session, List<ElectronicDocumentReference> reference);

	int insertEdocAttachFile(SqlSession session, List<ElectronicDocumentAttachFile> attachFile);
	
}
