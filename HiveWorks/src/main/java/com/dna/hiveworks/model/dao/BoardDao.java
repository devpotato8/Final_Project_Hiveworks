package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Board;

public interface BoardDao {

	Board selectBoardByNo(SqlSession session, int boardNo);

	List<Board> selectAllBoard(SqlSession session);

	
}
