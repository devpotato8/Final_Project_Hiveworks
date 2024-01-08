package com.dna.hiveworks.serviceimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.DeptDao;
import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.DeptService;

import lombok.RequiredArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2024. 01. 01.
 * Description : 부서정보 서비스 구현
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2024. 01. 01., 설명 : 최초작성
 * 
 */

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService {
	
	private final DeptDao dao;
	private final SqlSession session;

	@Override
	public List<Department> deptListAll() {
		return dao.deptListAll(session);
	}
	
	@Override
	public String searchDeptName(String deptCode) {
		String deptName = dao.searchDeptName(session,deptCode);
		return deptName;
	}

	@Override
	public int insertDept(Department dept) {
		int result = dao.insertDept(session,dept);
		return result;
	}

	@Override
	public int updateDept(Map<String,String>response) {
		int result = dao.updateDept(session,response);
		return result;
	}

	@Override
	public int deleteDept(Department dept) {
		int result = dao.deleteDept(session, dept);
		return result;
	}

	@Override
	public List<Map<String, Object>> deptEmpList(String deptCode) {
	    return dao.deptEmpList(session,deptCode);
	}

	@Override
	public int changeEmpDept(Map<String,Object>params) {
		int result = dao.changeEmpDept(session,params);
		return result;
	}

	@Override
	public int changeDeptLeader(String id) {
		int result = dao.changeDeptLeader(session,id);
		return result;
	}
	
	@Override
	public int changeDeptLeaderOld(String id) {
		int result = dao.changeDeptLeaderOld(session,id);
		return result;
	}

	@Override
	public int removeDeptLeader(String id) {
		int result = dao.removeDeptLeader(session,id);
		return result;
	}

	@Override
	public int deptEmpOut(Map<String, Object> params) {
		int result = dao.deptEmpOut(session,params);
		return result;
	}

	@Override
	public List<Employee> searchEmpByName(String name) {
		List<Employee> result = dao.searchEmpByName(session,name);
		return result;
	}

	@Override
	public int addEmpDept(Employee emp) {
		int result = dao.addEmpDept(session,emp);
		return result;
	}

	
	
	
	
	
	
	

	

	
	
	
	
}
