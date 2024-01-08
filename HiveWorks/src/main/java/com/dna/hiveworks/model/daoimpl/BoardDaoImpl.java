package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.BoardDao;
import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.model.dto.Uploadfile;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardDaoImpl implements BoardDao{
	
	@Override
	public Board selectBoardByNo(SqlSession session, int boardNo) {
		return session.selectOne("board.selectBoardByNo",boardNo);
	}
	@Override
	public List<Board> selectAllBoard(SqlSession session) {
	    return session.selectList("board.selectAllBoard");
	}
	@Override
	public int insertBoard(SqlSession session, Board b) {
		return session.insert("board.insertBoard",b);
	}
	@Override
	public int boardUpdate(SqlSession session,Board b) {
		return session.update("board.boardUpdate",b);
	}
	@Override
	public Board boardDelete(SqlSession session, int boardNo) {
		return session.selectOne("board.boardDelete",boardNo);
	}
	@Override
	public int insertUploadfile(SqlSession session, Uploadfile uploadfile) {
		log.debug("Inserting upload file: {}", uploadfile);
		return session.insert("board.insertUploadfile",uploadfile);
	}
}