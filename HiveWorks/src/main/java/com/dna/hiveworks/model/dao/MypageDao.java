package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;

public interface MypageDao {
	
	Employee selectMyInfo(SqlSession session, int empNo);
	
	int updateMyProfile(SqlSession session, int empNo);
	
	List<Search> integratedSearch(SqlSession session, String keyword);
}
