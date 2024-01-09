package com.dna.hiveworks.serviceimpl;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.WorkDao;
import com.dna.hiveworks.model.dto.Work;
import com.dna.hiveworks.model.dto.WorkRealtime;
import com.dna.hiveworks.service.WorkService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WorkServiceImpl implements WorkService {
	
	private final SqlSession session;
	private final WorkDao dao;
	
	@Override
	public int workScheduled() {
		return dao.workScheduled(session);
	}
	
	@Override
	public List<Work> selectWorkListAllByEmp() {
		// TODO Auto-generated method stub
		return dao.selectWorkListAllByEmp(session);
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
	public int updateWork() {
		// TODO Auto-generated method stub
		return dao.updateWork(session);
	}

	@Override
	public int deleteWork(int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Work selectRealtime() {
		// TODO Auto-generated method stub
		return dao.selectRealtime(session);
	}

	@Override
	public String avgStartWork() {
		// TODO Auto-generated method stub
		return dao.avgStartWork(session);
	}

	@Override
	public String avgEndWork() {
		// TODO Auto-generated method stub
		return dao.avgEndWork(session);
	}

	@Override
	public int lateWork() {
		// TODO Auto-generated method stub
		return dao.lateWork(session);
	}

	@Override
	public int fastEnd() {
		// TODO Auto-generated method stub
		return dao.fastEnd(session);
	}

	@Override
	public int absence() {
		// TODO Auto-generated method stub
		return dao.absence(session);
	}

	@Override
	public int overWork() {
		// TODO Auto-generated method stub
		return dao.overWork(session);
	}

	

	

}
