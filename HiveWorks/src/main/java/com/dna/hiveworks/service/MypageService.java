package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;

public interface MypageService {
	
	Employee selectMyInfo(int empNo);
	
	int updateMyProfile(int empNo);
	
	List<Search> integratedSearch(String keyword);
}
