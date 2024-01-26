package com.dna.hiveworks.serviceimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.MypageDao;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Search;
import com.dna.hiveworks.service.MypageService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {

	private final SqlSession session;
	private final MypageDao dao;
	
	@Override
	public Employee selectMyInfo(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectMyInfo(session,empNo);
	}

	@Override
	public int updateProfile(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.updateProfile(session,param);
	}

	@Override
	public List<Search> integratedSearch(String keyword) {
		// TODO Auto-generated method stub
		return dao.integratedSearch(session, keyword);
	}

	@Override
	public Employee indexProfile(int empNo) {
		// TODO Auto-generated method stub
		return dao.indexProfile(session, empNo);
	}

}
