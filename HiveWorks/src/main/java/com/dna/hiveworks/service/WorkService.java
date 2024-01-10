package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Work;

public interface WorkService {
	int workScheduled();
	
	List<Work> selectWorkListAllByEmp();
	
	String selectWorkByEmpNo(int empNo);
	
	int insertWork(int empNo);
	int updateWork(int empNo);
	int deleteWork(int empNo);
	
	Work selectCommute(int empNo);
	
	String avgStartWork();
	String avgEndWork();
	int lateWork();
	int fastEnd();
	int absence();
	int overWork();
}
