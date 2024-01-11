package com.dna.hiveworks.model.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.QuartzDao;

@Repository
public class QuartzDaoImpl implements QuartzDao {

	@Override
	public int insertQuartzWork(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.insert("work.insertQuartzWork", empNo);
	}

	@Override
	public int insertQuartzWorkRealTime(SqlSession session) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
