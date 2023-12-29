package com.dna.hiveworks.model.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.BoardDao;
import com.dna.hiveworks.model.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Override
	public Board selectBoardByNo(SqlSession session, int boardNo) {
		return session.selectOne("selectBoardByNo",boardNo);
	}
}
