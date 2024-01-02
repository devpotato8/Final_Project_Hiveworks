package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.VacationDao;
import com.dna.hiveworks.model.dto.Vacation;

@Repository
public class VacationDaoImpl implements VacationDao {

	@Override
	public List<Vacation> selectVacationListAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList(null);
	}

	@Override
	public List<Vacation> selectVacationByNo(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("vacation.selectVacationByNo", no);
	}

	@Override
	public int insertVacation(SqlSession session, Vacation v) {
		// TODO Auto-generated method stub
		return session.insert("vacation.insertVacation",v);
	}

	@Override
	public int updateVacation(SqlSession session, Vacation v) {
		// TODO Auto-generated method stub
		return session.update("vacation.updateVacation", v);
	}

	@Override
	public int deleteVacation(SqlSession session, int vacationNo) {
		// TODO Auto-generated method stub
		return session.delete(null);
	}

}
