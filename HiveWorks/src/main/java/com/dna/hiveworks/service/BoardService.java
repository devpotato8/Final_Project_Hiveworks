package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Board;

public interface BoardService {

	Board selectBoardByNo(int boardNo);
	
	List<Board> selectAllBoard();
	
	int insertBoard(Board b);
}
