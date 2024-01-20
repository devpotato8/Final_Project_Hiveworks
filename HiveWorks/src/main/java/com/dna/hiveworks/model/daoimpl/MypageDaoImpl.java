package com.dna.hiveworks.model.daoimpl;


import java.util.List;

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
	public int updateMyProfile(SqlSession session, int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Search> integratedSearch(SqlSession session, String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("mypage.integratedSearch", keyword);
	}

	
}
