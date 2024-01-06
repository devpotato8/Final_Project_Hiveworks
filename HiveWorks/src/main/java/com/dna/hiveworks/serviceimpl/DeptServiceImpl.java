package com.dna.hiveworks.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.DeptDao;
import com.dna.hiveworks.model.dto.Department;
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
	public Department selectDeptByName(String deptName) {
		return dao.selectDeptByName(session,deptName);
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
	public int deptLeaderOn(Map<String,String>response) {
		int result = dao.deptLeaderOn(session,response);
		return result;
	}

	@Override
	public int deptLeaderOff(String id) {
		int result = dao.deptLeaderOff(session,id);
		return result;
	}

	
	
	
	
}