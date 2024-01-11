package com.dna.hiveworks.service;

import com.dna.hiveworks.model.dto.Employee;

public interface MypageService {
	
	Employee selectMyInfo(int empNo);
	
	int updateMyProfile(int empNo);
}
