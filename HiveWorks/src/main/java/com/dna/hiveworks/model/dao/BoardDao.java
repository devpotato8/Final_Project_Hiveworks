package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.model.dto.Uploadfile;


public interface BoardDao {

	Board selectBoardByNo(SqlSession session, int boardNo);

	List<Board> selectAllBoard(SqlSession session);

	int insertBoard(SqlSession session, Board b);

	int boardUpdate(SqlSession session, Board b);

	Board boardDelete(SqlSession session, int boardNo);

	


}
