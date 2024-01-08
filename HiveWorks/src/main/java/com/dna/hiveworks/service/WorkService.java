package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Work;

public interface WorkService {
	List<Work> selectWorkListAll();
	
	List<Work> selectWorkByNo(int no);
	
	int insertWork();
	int updateWork();
	int deleteWork(int empNo);
	
}
