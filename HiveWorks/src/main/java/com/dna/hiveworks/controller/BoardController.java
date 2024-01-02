package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private BoardService service;
	
	
	 public BoardController(BoardService service) {
	       this.service = service;
	    }

	@GetMapping("/board")
	public String board(Model model) {
	    List<Board> boardList = service.selectAllBoard();
	    model.addAttribute("boardList", boardList);
	    System.out.println(model);
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
}
