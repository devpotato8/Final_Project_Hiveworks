/**
 * 
 */
package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentApproval;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocumentAttachFile;
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
	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 5. 
	 * @Return : List<ElectronicDocumentSample>
	 * 
	 * Description : 모든 문서양식 목록을 가져오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 5., 설명 : 최초 작성
	 *
	 * @return
	 */
	List<ElectronicDocumentSample> getEdocSampleList();
	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 8. 
	 * @Return : String
	 * 
	 * Description : 선택한 샘플양식을 불러오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 8., 설명 : 최초 작성
	 *
	 * @param formatNo
	 * @return
	 */
	ElectronicDocumentSample getSample(String formatNo);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 8. 
	 * @Return : ElectronicDocument
	 * 
	 * Description : 전자문서를 등록하는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 8., 설명 : 최초 작성
	 *
	 * @param edoc
	 * @return
	 */
	int insertEdoc(ElectronicDocument edoc);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 9. 
	 * @Return : Map<String,Object>
	 * 
	 * Description : 결재선 설정시, 결재 부서 선택 했을 때 선택 부서 및 하위 부서에 속한 사원 목록을 가져오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 9., 설명 : 최초 작성
	 *
	 * @param deptCode
	 * @return
	 */
	List<Map<String, Object>> selectEmployeeInSubDepartmentByDeptCode(String deptCode);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 12. 
	 * @Return : ElectronicDocument
	 * 
	 * Description : 전자문서번호로 전자문서를 불러오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 12., 설명 : 최초 작성
	 *
	 * @param edocNo
	 * @return
	 */
	ElectronicDocument selectElectronicDocument(String edocNo, int empNo);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 15. 
	 * @Return : ElectronicDocumentApproval
	 * 
	 * Description : 메소드에 대한 설명을 적어주세요
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 15., 설명 : 최초 작성
	 *
	 * @param aprvl
	 * @param loginEmp
	 * @return
	 */
	ElectronicDocumentApproval processApproval(ElectronicDocumentApproval aprvl, Employee loginEmp);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 16. 
	 * @Return : ElectronicDocumentAttachFile
	 * 
	 * Description : edocNo와 renamedFilename으로 해당 파일 정보를 불러오는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 16., 설명 : 최초 작성
	 *
	 * @param param
	 * @return
	 */
	ElectronicDocumentAttachFile getAttachFile(Map<String, Object> param);

	/**
	 * @Author : 이재연 
	 * @Since : 2024. 1. 16. 
	 * @Return : int
	 * 
	 * Description : 사용자의 서명을 설정하는 메소드
	 * 
	 * History : 
	 * - 작성자 : 이재연, 날짜 : 2024. 1. 16., 설명 : 최초 작성
	 *
	 * @param param
	 * @return
	 */
	int updateAuto(Map<String, Object> param);
}
