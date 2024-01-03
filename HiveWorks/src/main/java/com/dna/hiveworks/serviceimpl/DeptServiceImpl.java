package com.dna.hiveworks.serviceimpl;

import java.util.List;

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
	public int deleteDept(Department dept) {
		return 0;
	}

	@Override
	public int updateDept(Department dept) {
		return 0;
	}

	
	
}
