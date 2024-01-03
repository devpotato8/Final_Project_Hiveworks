package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Vacation;

public interface VacationDao {
	
	List<Vacation> selectVacationListAll(SqlSession session);
	
	List<Vacation> selectVacationByNo(SqlSession session, int no);
		
	int insertVacation(SqlSession session, Vacation v);
	int updateVacation(SqlSession session, Vacation v);
	int deleteVacation(SqlSession session, int vacationNo);
}
