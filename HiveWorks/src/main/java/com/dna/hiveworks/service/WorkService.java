package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.Work;

public interface WorkService {
	
	List<Work> selectWorkListAllByEmp(int empNo);
	
	String selectWorkByEmpNo(int empNo);
	
	int updateStartWork(int empNo);
	int updateEndWork(int empNo);
	int deleteWork(int empNo);
	
	Work selectCommute(int empNo);
	
	String avgStartWork(int empNo);
	String avgEndWork(int empNo);
	int lateWork(int empNo);
	int fastEnd(int empNo);
	int absence(int empNo);
	int overWork(int empNo);
	
	String avgStartWorkFilter(Map<String, Integer>param);
	String avgEndWorkFilter(Map<String, Integer>param);
	int lateWorkFilter(Map<String, Integer>param);
	int fastEndFilter(Map<String, Integer>param);
	int absenceFilter(Map<String, Integer>param);
	int overWorkFilter(Map<String, Integer>param);
}
