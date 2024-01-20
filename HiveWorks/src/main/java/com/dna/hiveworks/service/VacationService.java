package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.Vacation;

public interface VacationService {
	
	List<Vacation> selectVacationListAll();
	
	List<Vacation> selectVacationByNo(int empNo);
	
	int insertVacation(Vacation v);
	int updateVacation(Map<String, Object> param);
	int deleteVacation(int vacationNo);

	double selectLeftVacation(int empNo);
	
	int confirmVacation(String edocNo);
	int revokeVacation(String edocNo);
}
