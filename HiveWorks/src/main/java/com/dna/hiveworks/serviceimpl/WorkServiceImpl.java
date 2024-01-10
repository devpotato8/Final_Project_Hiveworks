package com.dna.hiveworks.serviceimpl;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public String selectWorkByEmpNo(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectWorkByEmpNo(session, empNo);
	}

	@Override
	@Transactional
	public int insertWork(int empNo) {
		String isPresent = dao.selectWorkByEmpNo(session, empNo);
		if (isPresent != null) {
	        throw new RuntimeException("이미 눌렀습니다.");
	    }
		return dao.insertWork(session, empNo);
	}

	@Override
	public int updateWork(int empNo) {
		String isPresent = dao.selectWorkByEmpNoEND(session, empNo);
		if (isPresent != null) {
	        throw new RuntimeException("이미 눌렀습니다.");
	    }
		return dao.updateWork(session, empNo);
	}

	@Override
	public int deleteWork(int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Work selectCommute(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectCommute(session, empNo);
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
