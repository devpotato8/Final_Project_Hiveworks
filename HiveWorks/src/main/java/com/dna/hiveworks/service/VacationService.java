package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Vacation;

public interface VacationService {
	
	List<Vacation> selectVacationListAll();
	
	List<Vacation> selectVacationByNo(int empNo);
	
	int insertVacation(Vacation v, int empNo);
	int updateVacation(Double vacCount, int empNo);
	int deleteVacation(int vacationNo);

	double selectLeftVacation(int empNo);
}
