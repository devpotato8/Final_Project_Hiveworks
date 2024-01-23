package com.dna.hiveworks.serviceimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.model.dao.QuartzDao;
import com.dna.hiveworks.service.QuartzService;

import lombok.RequiredArgsConstructor;

@Service("quartz")
@RequiredArgsConstructor
public class QuartzServiceImpl implements QuartzService {
	
	private final SqlSession session;
	private final QuartzDao dao;
	
	@Override
	@Transactional
	// 이미 들어가있으면 안들어가게 익셉션주기
	public int insertQuartzWork(int empNo) {
		String isPresent = dao.selectWorkByEmpNo(session, empNo);
		System.out.println(isPresent);
		if (isPresent == null || isPresent.isEmpty() || isPresent.equals(null)) {
			return dao.insertQuartzWork(session, empNo);
	    } else {
	    	throw new RuntimeException("익셉션");
	    }
		
	}

	@Override
	public int insertQuartzWorkRealTime() {
		// TODO Auto-generated method stub
		return dao.insertQuartzWorkRealTime(session);
	}

}
