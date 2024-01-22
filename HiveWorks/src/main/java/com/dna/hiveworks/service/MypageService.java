package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;

public interface MypageService {
	
	Employee selectMyInfo(int empNo);
	
	int updateProfile(Map<String, Object> param);
	
	List<Search> integratedSearch(String keyword);
	
}
