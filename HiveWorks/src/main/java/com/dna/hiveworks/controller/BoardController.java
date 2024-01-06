package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@AllArgsConstructor
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/board")
	public String board(Model model) {
	    List<Board> boardList = service.selectAllBoard();
	    model.addAttribute("boardList", boardList);
	    return "board/board";
	}

	@GetMapping("/suggestions")
	public String suggestions() {
		return "board/suggestions";
	}
	@GetMapping("/blind")
	public String blind() {
		return "board/blind";
	}
	@GetMapping("/boardWrite")
	public String boardWrite() {
	    return "board/boardWrite";
	}
	@RequestMapping("/boardView")
	public void selectBoardByNo(int boardNo, Model model) {
		model.addAttribute("board",service.selectBoardByNo(boardNo));
	}
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("boardNo") int boardNo,Model model) {
		Board board = service.boardDelete(boardNo);
		log.debug("보드 번호{}",boardNo);
		List<Board> boardList = service.selectAllBoard();
	    model.addAttribute("boardList", boardList);
	    return "board/board";
	}
	@GetMapping("/boardUpdate")
	public String boardUpdate(@RequestParam("boardNo") int boardNo,Model model){
		log.debug("보드 번호{}",boardNo);
		Board board =  service.selectBoardByNo(boardNo);
		log.debug("보드 정보{}",board);		
		model.addAttribute("board",board);
		return "board/boardUpdate";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate(Board b, Model model, HttpSession session) {
	    log.debug("{}", b);
	    
	    String msg, loc;
	   
	    int result=service.boardUpdate(b);
	    System.out.println(result);
	    if(result>0) {
	    	msg = "게시글 수정 성공 :)";
	    	loc = "board/board";
	    } else {
	    	msg = "게시글 수정 실패 :(";
	    	loc = "board/boardUpdate";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("loc", loc);

	    return "board/msg";
	}

	@PostMapping("/insertBoard")
	public String insertBoard(Board b, Model model, HttpSession session) {
	    log.debug("{}", b);
	    String msg, loc;
	   
	    int result=service.insertBoard(b);
	    System.out.println(result);
	    if(result>0) {
	    	msg = "게시글 등록 성공 :)";
	    	loc = "board/board";
	    } else {
	    	msg = "게시글 등록 실패 :(";
	    	loc = "board/boardWrite";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("loc", loc);

	    return "board/msg";
	}



	
}
