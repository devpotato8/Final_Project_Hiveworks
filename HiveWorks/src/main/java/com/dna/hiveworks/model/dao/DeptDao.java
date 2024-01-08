package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;

/**
 * @author : 김태윤
 * @since : 2024. 01. 01.
 * Description : 부서정보 dao
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2024. 01. 01., 설명 : 최초작성
 * 
 */

public interface DeptDao {
	
	List<Department> deptListAll(SqlSession session);
	int insertDept(SqlSession session, Department dept);
	int deleteDept(SqlSession session, Department dept);
	int updateDept(SqlSession session, Map<String, String> response);
	List<Map<String, Object>> deptEmpList (SqlSession session, String deptCode);
	int changeEmpDept(SqlSession session, Map<String, Object> params);
	int changeDeptLeader(SqlSession session, String id);
	int changeDeptLeaderOld(SqlSession session, String id);
	int removeDeptLeader(SqlSession session, String id);
	int deptEmpOut(SqlSession session, Map<String, Object> params);
	String searchDeptName(SqlSession session, String deptCode);
	List<Employee>searchEmpByName(SqlSession session, String name);
	int addEmpDept(SqlSession session, Employee emp);
}
