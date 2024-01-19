package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.board.Board;
import com.dna.hiveworks.model.dto.board.Survey;
import com.dna.hiveworks.model.dto.board.Uploadfile;


public interface BoardDao {

	Board selectBoardByNo(SqlSession session, int boardNo);

	List<Board> selectAllBoard(SqlSession session,String boardType);

	int insertBoard(SqlSession session, Board b);

	int boardUpdate(SqlSession session, Board b);
	

	Board boardDelete(SqlSession session, int boardNo);

	int insertUploadfile(SqlSession session, Uploadfile uploadfile);

	int updateBoardCount(SqlSession session, int boardNo);

}
