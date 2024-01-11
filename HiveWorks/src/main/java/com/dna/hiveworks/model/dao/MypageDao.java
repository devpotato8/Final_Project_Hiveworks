package com.dna.hiveworks.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Employee;

public interface MypageDao {
	
	Employee selectMyInfo(SqlSession session, int empNo);
	
	int updateMyProfile(SqlSession session, int empNo);
}
