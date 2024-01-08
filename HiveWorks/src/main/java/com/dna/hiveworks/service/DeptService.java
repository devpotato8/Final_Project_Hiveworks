package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;

/**
 * @author : 김태윤
 * @since : 2024. 01. 01.
 * Description : 부서정보 서비스
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2024. 01. 01., 설명 : 최초작성
 * 
 */

public interface DeptService {
	
	List<Department> deptListAll();
	int insertDept(Department dept);
	int deleteDept(Department dept);
	int updateDept(Map<String, String> response);
	List<Map<String, Object>> deptEmpList(String deptCode);
	int changeEmpDept(Map<String, Object> params);
	int changeDeptLeader(String id);
	int changeDeptLeaderOld(String id);
	int removeDeptLeader(String id);
	int deptEmpOut(Map<String, Object> params);
	String searchDeptName(String deptCode);
	List<Employee>searchEmpByName(String name);
	int addEmpDept(Employee emp);
}
