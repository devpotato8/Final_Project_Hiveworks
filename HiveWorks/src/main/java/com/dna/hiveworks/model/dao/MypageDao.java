package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;

public interface MypageDao {
	
	Employee selectMyInfo(SqlSession session, int empNo);
	
	int updateProfile(SqlSession session, Map<String, Object> param);
	
	List<Search> integratedSearch(SqlSession session, String keyword);
	
	Employee indexProfile(SqlSession session, int empNo);
}
