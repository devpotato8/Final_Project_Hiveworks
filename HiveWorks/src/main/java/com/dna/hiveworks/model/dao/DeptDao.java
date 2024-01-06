package com.dna.hiveworks.model.dao;

import java.sql.ResultSet;
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
	Department selectDeptByName(SqlSession session, String deptName);
	int insertDept(SqlSession session, Department dept);
	int deleteDept(SqlSession session, Department dept);
	int updateDept(SqlSession session, Map<String, String> response);
	List<Map<String, Object>> deptEmpList (SqlSession session, String deptCode);
	int deptLeaderOn(SqlSession session, Map<String, String> response);
	int deptLeaderOff(SqlSession session, String id);
}