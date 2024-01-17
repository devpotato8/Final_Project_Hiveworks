package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Vacation;

public interface VacationDao {
	
	List<Vacation> selectVacationListAll(SqlSession session);
	
	List<Vacation> selectVacationByNo(SqlSession session, int empNo);
		
	int insertVacation(SqlSession session, Vacation v, int empNo);
	int updateVacation(SqlSession session, Double vacCount, int empNo);
	int deleteVacation(SqlSession session, int vacationNo);
	
	double selectLeftVacation(SqlSession session, int empNo);
}
