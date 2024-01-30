package com.dna.hiveworks.serviceimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Work> selectWorkListAllByEmp(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectWorkListAllByEmp(session, empNo);
	}

	@Override
	public String selectWorkByEmpNo(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectWorkByEmpNo(session, empNo);
	}

	@Override
	@Transactional
	public int updateStartWork(int empNo) {
		String isPresent = dao.selectWorkByEmpNo(session, empNo);
		//if (isPresent == null || isPresent.isEmpty() || isPresent.equals(null)) {
		if (isPresent == null) {
			return dao.updateStartWork(session, empNo);
	    } else {
	    	throw new RuntimeException("익셉션");
	    }
	}

	@Override
	@Transactional
	public int updateEndWork(int empNo) {
		String isPresent = dao.selectWorkByEmpNoEND(session, empNo);
		if (isPresent == null) {
			return dao.updateEndWork(session, empNo);
	    } else {
	    	 throw new RuntimeException("익셉션");
	    }
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
	public String avgStartWork(int empNo) {
		// TODO Auto-generated method stub
		return dao.avgStartWork(session, empNo);
	}

	@Override
	public String avgEndWork(int empNo) {
		// TODO Auto-generated method stub
		return dao.avgEndWork(session, empNo);
	}
	
	@Override
	public int lateWork(int empNo) {
		// TODO Auto-generated method stub
		return dao.lateWork(session, empNo);
	}

	@Override
	public int fastEnd(int empNo) {
		// TODO Auto-generated method stub
		return dao.fastEnd(session, empNo);
	}

	@Override
	public int absence(int empNo) {
		// TODO Auto-generated method stub
		return dao.absence(session, empNo);
	}

	@Override
	public String avgStartWorkFilter(Map<String, Integer>param) {
		// TODO Auto-generated method stub
		return dao.avgStartWorkFilter(session, param);
	}

	@Override
	public String avgEndWorkFilter(Map<String, Integer>param) {
		// TODO Auto-generated method stub
		return dao.avgEndWorkFilter(session, param);
	}

	@Override
	public int lateWorkFilter(Map<String, Integer>param) {
		// TODO Auto-generated method stub
		return dao.lateWorkFilter(session, param);
	}

	@Override
	public int fastEndFilter(Map<String, Integer>param) {
		// TODO Auto-generated method stub
		return dao.fastEndFilter(session, param);
	}

	@Override
	public int absenceFilter(Map<String, Integer>param) {
		// TODO Auto-generated method stub
		return dao.absenceFilter(session, param);
	}


	

	

}
