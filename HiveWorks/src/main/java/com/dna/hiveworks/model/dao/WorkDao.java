package com.dna.hiveworks.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Work;

public interface WorkDao {
	
	int workScheduled(SqlSession session);
	
	List<Work> selectWorkListAllByEmp(SqlSession session);
	
	String selectWorkByEmpNo(SqlSession session, int empNo);
	String selectWorkByEmpNoEND(SqlSession session, int empNo);
	
	int insertWork(SqlSession session, int empNo);
	int updateWork(SqlSession session, int empNo);
	int deleteWork(SqlSession session, int empNo);
	
	Work selectCommute(SqlSession session, int empNo);
	
	String avgStartWork(SqlSession session);
	String avgEndWork(SqlSession session);
	int lateWork(SqlSession session);
	int fastEnd(SqlSession session);
	int absence(SqlSession session);
	int overWork(SqlSession session);

}
