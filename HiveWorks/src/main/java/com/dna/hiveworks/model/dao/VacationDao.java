package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Vacation;

public interface VacationDao {
	
	List<Vacation> selectVacationListAll(SqlSession session);
	
	List<Vacation> selectVacationByNo(SqlSession session, int empNo);
		
	int insertVacation(SqlSession session, Vacation v);
	int updateVacation(SqlSession session, Map<String, Object> param);
	int deleteVacation(SqlSession session, int vacationNo);
	
	double selectLeftVacation(SqlSession session, int empNo);
	
	int confirmVacation(SqlSession session, String edocNo);
	int revokeVacation(SqlSession session, String edocNo);
	
	Vacation selectVacation(SqlSession session, String edocNo);
	int rollbackVacation(SqlSession session, Map<String, Object>param);
}
