/**
 * 
 */
package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;

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

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 3. 
	 * @Return : List<ElectronicDocument>
	 * 
	 * Description : DB에서 전자문서 목록을 받아오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초 작성
	 *
	 * @param session
	 * @param param
	 * @return
	 */
	List<ElectronicDocumentList> getEdocList(SqlSession session, Map<String, Object> param);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 3. 
	 * @Return : List<ElectronicDocument>
	 * 
	 * Description : DB에서 전자문서 목록을 받아오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초 작성
	 *
	 * @param session
	 * @param param
	 * @return
	 */
	List<ElectronicDocumentList> getEdocBox(SqlSession session, Map<String, Object> param);

	/**
	 * @Author : qrien 
	 * @Since : 2024. 1. 4. 
	 * @Return : Map<String,Object>
	 * 
	 * Description : 메소드에 대한 설명을 적어주세요
	 * 
	 * History : 
	 * - 작성자 : qrien, 날짜 : 2024. 1. 4., 설명 : 최초 작성
	 *
	 * @param session
	 * @param empNo 
	 * @return
	 */
	Map<String, Object> getEmpData(SqlSession session, int empNo);
	
}
