package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Vacation;

public interface VacationService {
	
	List<Vacation> selectVacationListAll();
		
	List<Vacation> selectVacationByNo(int no);
		
	int insertVacation(Vacation v);
	int updateVacation(Vacation v);
	int deleteVacation(int vacationNo);
}
