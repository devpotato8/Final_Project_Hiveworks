/**
 * 
 */
package com.dna.hiveworks.model.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.EdocDao;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;

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
	
}
