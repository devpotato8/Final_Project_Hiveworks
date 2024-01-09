package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Work;

public interface WorkService {
	int workScheduled();
	
	List<Work> selectWorkListAllByEmp();
	
	List<Work> selectWorkByNo(int no);
	
	int insertWork();
	int updateWork();
	int deleteWork(int empNo);
	
	Work selectRealtime();
	
	String avgStartWork();
	String avgEndWork();
	int lateWork();
	int fastEnd();
	int absence();
	int overWork();
}
