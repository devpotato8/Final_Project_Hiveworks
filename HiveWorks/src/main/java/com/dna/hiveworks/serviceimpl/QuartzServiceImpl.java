package com.dna.hiveworks.serviceimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.QuartzDao;
import com.dna.hiveworks.service.QuartzService;

import lombok.RequiredArgsConstructor;

@Service("quartz")
@RequiredArgsConstructor
public class QuartzServiceImpl implements QuartzService {
	
	private final SqlSession session;
	private final QuartzDao dao;
	
	@Override
	public int insertQuartzWork(int empNo) {
		// TODO Auto-generated method stub
		return dao.insertQuartzWork(session, empNo);
	}

	@Override
	public int insertQuartzWorkRealTime() {
		// TODO Auto-generated method stub
		return dao.insertQuartzWorkRealTime(session);
	}

}
