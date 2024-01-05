/**
 * 
 */
package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentList;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentSample;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 전자문서에 대한 Service
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public interface EdocService {
	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 3. 
	 * @Return : List<ElectronicDocument>
	 * 
	 * Description : 진행중인 문서 목록을 가져오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초 작성
	 *
	 * @param empId
	 * @param boxStatus
	 * @return
	 */
	List<ElectronicDocumentList> getEdocList(Map<String, Object> param);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 3. 
	 * @Return : List<ElectronicDocument>
	 * 
	 * Description : 문서 보관함 문서 목록을 가져오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초 작성
	 *
	 * @param empId
	 * @param boxStatus
	 * @return
	 */
	List<ElectronicDocumentList> getEdocBox(Map<String, Object> param);

	/**
	 * @param empNo 
	 * @Author : 이재연 
	 * @Since : 2024. 1. 4. 
	 * @Return : Map<String,Object>
	 * 
	 * Description : 임시로 사용자의 부서, 직위, 이름 정보를 가져오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 4., 설명 : 최초 작성
	 *
	 * @return
	 */
	Map<String, Object> getEmpData(int empNo);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 5. 
	 * @Return : List<ElectronicDocumentSample>
	 * 
	 * Description : DotCode에 해당하는 문서양식 목록을 가져오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 5., 설명 : 최초 작성
	 *
	 * @param edocDotCode
	 * @return
	 */
	List<ElectronicDocumentSample> getEdocSampleList(DotCode edocDotCode);
}
