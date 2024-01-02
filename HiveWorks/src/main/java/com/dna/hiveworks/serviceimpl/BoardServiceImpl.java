package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.BoardDao;
import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.service.BoardService;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final SqlSession session;
	
	private final BoardDao dao;
	
	@Override
	public Board selectBoardByNo(int boardNo) {
		return dao.selectBoardByNo(session, boardNo);
	}
	@Override
	public List<Board> selectAllBoard() {
	    return dao.selectAllBoard(session);
	}
	
}
