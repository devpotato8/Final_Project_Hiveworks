package com.dna.hiveworks.model.daoimpl;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.MypageDao;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public Employee selectMyInfo(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("mypage.selectMyInfo", empNo);
	}

	@Override
	public int updateProfile(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updateProfile", param);
	}

	@Override
	public List<Search> integratedSearch(SqlSession session, String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("mypage.integratedSearch", keyword);
	}

	@Override
	public Employee indexProfile(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("mypage.indexProfile", empNo);
	}
	
	
	
}
