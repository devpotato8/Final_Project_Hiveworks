package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.VacationDao;
import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.service.VacationService;

@Service
public class VacationServiceImpl implements VacationService {
	
	private SqlSession session;
	private VacationDao dao;

	@Override
	public List<Vacation> selectVacationListAll() {
		// TODO Auto-generated method stub
		return dao.selectVacationListAll(session);
	}

	@Override
	public List<Vacation> selectVacationByNo(int VacationNo) {
		// TODO Auto-generated method stub
		return dao.selectVacationByNo(session, VacationNo);
	}

	@Override
	public int insertVacation(Vacation v) {
		// TODO Auto-generated method stub
		return dao.insertVacation(session, v);
	}

	@Override
	public int updateVacation(Vacation v) {
		// TODO Auto-generated method stub
		return dao.updateVacation(session, v);
	}

	@Override
	public int deleteVacation(int vacationNo) {
		// TODO Auto-generated method stub
		return dao.deleteVacation(session, vacationNo);
	}

}
