package com.dna.hiveworks.model.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.DeptDao;
import com.dna.hiveworks.model.dto.Department;

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
	public Department selectDeptByName(SqlSession session, String deptName) {
		return session.selectOne("department.selectDeptByName",deptName);
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


	
}
