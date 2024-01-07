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
	public int insertBoard(Board b) {
	  if (b.getFiles().size() > 0) {
	    b.getFiles().forEach(file -> {
	      file.setUploadfileBoardNo(b.getBoardNo()); // 게시글 번호 설정
	      int fileResult = dao.insertUploadfile(session, file);
	      if (fileResult == 0) {
	        session.rollback();
	        throw new RuntimeException("첨부파일 등록 실패!");
	      }
	    });
	  }
	  int result = dao.insertBoard(session, b);
	  if (result <= 0) {
	    session.rollback();
	    throw new RuntimeException("게시글 등록 실패!");
	  } else {
	  }

	  return result;
	}

	@Override
	public int boardUpdate(Board b) {
		return dao.boardUpdate(session,b);
	}
	@Override
	public Board boardDelete(int boardNo) {
		return dao.boardDelete(session, boardNo);
		
	}

	
}

	
	

