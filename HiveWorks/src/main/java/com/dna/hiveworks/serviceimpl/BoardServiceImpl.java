package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.model.dao.BoardDao;
import com.dna.hiveworks.model.dto.board.Board;
import com.dna.hiveworks.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j
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
	@Transactional
	public int insertBoard(Board b) {
		
		log.debug("Board files: {}", b.getFiles());
		int result=dao.insertBoard(session,b);
		if(result>0) {
			if(b.getFiles().size()>0) {
				b.getFiles().forEach(file->{
					file.setBoardNo(b.getBoardNo());
					int fileResult=dao.insertUploadfile(session,file);
					if(fileResult==0) throw new RuntimeException("첨부파일등록실패!");
				});
			}
		}else {
			throw new RuntimeException("첨부파일등록실패!");
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
	
	

