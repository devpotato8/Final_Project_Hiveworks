package com.dna.hiveworks.model.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.MypageDao;
import com.dna.hiveworks.model.dto.Employee;

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
	
}
