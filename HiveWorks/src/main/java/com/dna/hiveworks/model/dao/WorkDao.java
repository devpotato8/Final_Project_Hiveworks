package com.dna.hiveworks.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Work;

public interface WorkDao {
	
	int workScheduled(SqlSession session);
	
	List<Work> selectWorkListAllByEmp(SqlSession session);
	
	List<Work> selectWorkByNo(SqlSession session, int no);
	
	int insertWork(SqlSession session);
	int updateWork(SqlSession session);
	int deleteWork(SqlSession session, int empNo);
	
	Work selectRealtime(SqlSession session);
	
	String avgStartWork(SqlSession session);
	String avgEndWork(SqlSession session);
	int lateWork(SqlSession session);
	int fastEnd(SqlSession session);
	int absence(SqlSession session);
	int overWork(SqlSession session);
}
