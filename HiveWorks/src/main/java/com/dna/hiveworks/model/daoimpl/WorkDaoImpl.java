package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.WorkDao;
import com.dna.hiveworks.model.dto.Work;

@Repository
public class WorkDaoImpl implements WorkDao {

	@Override
	public List<Work> selectWorkListAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList(null);
	}

	@Override
	public List<Work> selectWorkByNo(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertWork(SqlSession session) {
		// TODO Auto-generated method stub
		return session.insert("work.insertStartWork");
	}

	@Override
	public int updateWork(SqlSession session, Work w) {
		// TODO Auto-generated method stub
		return session.update("work.updateEndWork", w);
	}

	@Override
	public int deleteWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
