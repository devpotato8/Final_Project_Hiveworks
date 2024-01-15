package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.WorkDao;
import com.dna.hiveworks.model.dto.Work;

@Repository
public class WorkDaoImpl implements WorkDao {
	
	@Override
	public List<Work> selectWorkListAllByEmp(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("work.selectWorkListAllByEmp");
	}

	@Override
	public String selectWorkByEmpNo(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.selectWorkByEmpNo", empNo);
	}
	public String selectWorkByEmpNoEND(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.selectWorkByEmpNoEND", empNo);
	}

	@Override
	public int updateStartWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.update("work.updateStartWork", empNo);
	}

	@Override
	public int updateEndWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.update("work.updateEndWork", empNo);
	}

	@Override
	public int deleteWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Work selectCommute(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.selectCommute", empNo);
	}

	@Override
	public String avgStartWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.avgStartWork", empNo);
	}

	@Override
	public String avgEndWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.avgEndWork", empNo);
	}

	@Override
	public int lateWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fastEnd(SqlSession session , int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int absence(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int overWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
