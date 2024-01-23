package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.Employee;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 서비스
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * - 수정자 : 김태하, 날짜 : 2023. 12. 29., 설명 : 추가 메소드 작성
 * 
 */

public interface EmpService {
	
	Employee selectEmployeeById(String empId);
	
	Map<String,Object> selectEmployeeByEmpNo(int empNo);
	
	List<Employee> selectEmployeesListAll();
	
	int insertEmployee(Map<String,Object> empData);
	int updateEmployee(Map<String,Object> empData);
	int deleteEmployee(int no);
	List<Employee> searchEmployeesByKeyword(Map<String,Object> param);
	
	Map<String,List<Map<String,Object>>> selectDataListForEmployee();
	
	int updatePassword(Map<String,Object> IdAndPassword);
	
	Map<String, List<Map<String, Object>>> selectAuthorityList();
	
	int updateAuthorities(Map<String, List<String>> data);
	
	Map<String, Object> downloadEmployeesAndAccount();
	
	int insertEmployeeByExcel(Map<String,Object> empData);
}
