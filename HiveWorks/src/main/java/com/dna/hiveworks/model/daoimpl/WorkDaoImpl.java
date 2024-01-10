package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.WorkDao;
import com.dna.hiveworks.model.dto.Work;

@Repository
public class WorkDaoImpl implements WorkDao {
	
	@Override
	public int workScheduled(SqlSession session) {
		return session.insert("work.workScheduled");
	}

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
	public int insertWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.insert("work.insertStartWork", empNo);
	}

	@Override
	public int updateWork(SqlSession session, int empNo) {
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
	public String avgStartWork(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("work.avgStartWork");
	}

	@Override
	public String avgEndWork(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("work.avgEndWork");
	}

	@Override
	public int lateWork(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("work.lateWork");
	}

	@Override
	public int fastEnd(SqlSession session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int absence(SqlSession session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int overWork(SqlSession session) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
