package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Account;
import com.dna.hiveworks.model.dto.Employee;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 DAO
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

public interface EmpDao {
	
	Employee selectEmployeeById(SqlSession session, String empId);
	
	List<Employee> selectEmployeesListAll(SqlSession session);
	
	int insertEmployee(SqlSession session,Employee e);
	int updateEmployee(SqlSession session,Employee e);
	int deleteEmployee(SqlSession session,Employee e);
	
	List<Employee> searchEmployeesByKeyword(SqlSession session, Map<String,Object> param);
	
	List<Map<String,Object>> selectDeptList(SqlSession session);
	List<Map<String,Object>> selectPositionList(SqlSession session);
	List<Map<String,Object>> selectJobList(SqlSession session);
	List<Map<String,Object>> selectWorkStatusList(SqlSession session);
	List<Map<String,Object>> selectWorkPatternList(SqlSession session);

	int insertAccount(SqlSession session, Account ac);
	int updateAccount(SqlSession session, Account ac);
	int deleteAccount(SqlSession session, Account ac);
	
	
}
