package com.dna.hiveworks.model.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.WorkDao;
import com.dna.hiveworks.model.dto.Work;

@Repository
public class WorkDaoImpl implements WorkDao {
	
	@Override
	public List<Work> selectWorkListAllByEmp(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectList("work.selectWorkListAllByEmp", empNo);
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

	@Override
	public String avgStartWorkFilter(SqlSession session, Map<String, Integer>param) {
		return session.selectOne("work.avgStartWorkFilter", param);
	}

	@Override
	public String avgEndWorkFilter(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.avgEndWorkFilter", empNo);
	}

	@Override
	public int lateWorkFilter(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.lateWorkFilter", empNo);
	}

	@Override
	public int fastEndFilter(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.fastEndFilter", empNo);
	}

	@Override
	public int absenceFilter(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.absenceFilter", empNo);
	}

	@Override
	public int overWorkFilter(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("work.overWorkFilter", empNo);
	}
	
	

}
