package com.dna.hiveworks.model.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.DeptDao;
import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;

/**
 * @author : 김태윤
 * @since : 2024. 01. 01.
 * Description : 부서정보 DAO 구현
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2024. 01. 01., 설명 : 최초작성
 * 
 */

@Repository
public class DeptDaoImpl implements DeptDao {

	@Override
	public List<Department> deptListAll(SqlSession session) {
		return session.selectList("department.deptListAll");
	}

	@Override
	public String searchDeptName(SqlSession session, String deptCode) {
		return session.selectOne("department.searchDeptName",deptCode);
	}

	@Override
	public int insertDept(SqlSession session, Department dept) {
		return session.insert("department.insertDept",dept);
	}

	@Override
	public int updateDept(SqlSession session, Map<String,String>response) {
		
		return session.update("department.updateDept",response);
	}

	@Override
	public int deleteDept(SqlSession session, Department dept) {
		
		return session.delete("department.deleteDept",dept);
	}

	@Override
	public List<Map<String, Object>> deptEmpList(SqlSession session, String deptCode) {
	    return session.selectList("department.deptEmpList", deptCode);
	}

	@Override
	public int changeEmpDept(SqlSession session, Map<String, Object> params) {
		return session.update("department.changeEmpDept",params);
	}

	@Override
	public int changeDeptLeader(SqlSession session, String id) {
		return session.update("department.changeDeptLeader",id);
	}
	
	@Override
	public int changeDeptLeaderOld(SqlSession session, String id) {
		return session.update("department.changeDeptLeaderOld",id);
	}

	@Override
	public int removeDeptLeader(SqlSession session, String id) {
		return session.update("department.removeDeptLeader",id);
	}

	@Override
	public int deptEmpOut(SqlSession session, Map<String, Object> params) {
		return session.update("department.deptEmpOut",params);
	}

	@Override
	public List<Employee> searchEmpByName(SqlSession session, String name) {
		return session.selectList("department.searchEmpByName",name);
	}

	@Override
	public int addEmpDept(SqlSession session, Employee emp) {
		return session.update("department.addEmpDept",emp);
	}

	
	
	
	
	
	
	

	

	

	
}
