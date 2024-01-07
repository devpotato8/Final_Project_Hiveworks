package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Work;

public interface WorkDao {
	List<Work> selectWorkListAll(SqlSession session);
	
	List<Work> selectWorkByNo(SqlSession session,int no);
	
	int insertWork(SqlSession session);
	int updateWork(SqlSession session,Work w);
	int deleteWork(SqlSession session,int empNo);
}
