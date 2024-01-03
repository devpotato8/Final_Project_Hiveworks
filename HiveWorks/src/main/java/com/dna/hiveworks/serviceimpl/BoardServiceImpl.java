package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	@Transactional(rollbackFor = Exception.class)  // 던지는 예외에 따라 롤백 설정
	public int insertBoard(Board b) {
	    // 게시글, 첨부파일을 저장하기!
	    int result = dao.insertBoard(session, b);
	    if (result < 1) {
	        throw new RuntimeException("게시글 등록 실패");
	    }
	    return result;
	}
}

	
	

