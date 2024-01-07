package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.WorkDao;
import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.service.WorkService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WorkServiceImpl implements WorkService {
	
	private final SqlSession session;
	private final WorkDao dao;
	
	@Override
	public List<Work> selectWorkListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Work> selectWorkByNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertWork() {
		
		return dao.insertWork(session);
	}

	@Override
	public int updateWork(Work w) {
		// TODO Auto-generated method stub
		return dao.updateWork(session, w);
	}

	@Override
	public int deleteWork(int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
