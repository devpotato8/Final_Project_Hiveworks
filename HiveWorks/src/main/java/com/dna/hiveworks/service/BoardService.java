package com.dna.hiveworks.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.board.Board;

public interface BoardService {

	Board selectBoardByNo(int boardNo);
	
	List<Board> selectAllBoard();
	
	int insertBoard(Board b);
	
	int boardUpdate(Board b);

	Board boardDelete(int boardNo);



}
