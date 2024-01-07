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
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
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
		return session.selectList("edoc.getEdocBox", param);
	}
	
	@Override
	public Map<String, Object> getEmpData(SqlSession session, int empNo) {
		return session.selectOne("edoc.getEmpData", empNo);
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
	public ElectronicDocument getEdoc(SqlSession session, String edocNo) {
		return session.selectOne("edoc.getEdoc",edocNo);
	}
	
	@Override
	public int insertEdoc(SqlSession session, ElectronicDocument edoc) {
		return session.insert("edoc.insertEdoc", edoc);
	}
}
