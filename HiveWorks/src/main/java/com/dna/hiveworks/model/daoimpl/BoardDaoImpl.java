package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.BoardDao;
import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.model.dto.Uploadfile;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Override
	public Board selectBoardByNo(SqlSession session, int boardNo) {
		return session.selectOne("selectBoardByNo",boardNo);
	}
	@Override
	public List<Board> selectAllBoard(SqlSession session) {
	    return session.selectList("board.selectAllBoard");
	}
	@Override
	public int insertBoard(SqlSession session, Board b) {
		System.out.println(b);
		return session.insert("board.insertBoard",b);
	}
	
}
