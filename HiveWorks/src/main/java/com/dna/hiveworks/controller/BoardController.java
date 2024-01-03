package com.dna.hiveworks.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.dna.hiveworks.model.dto.Board;
import com.dna.hiveworks.model.dto.Uploadfile;
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
	@GetMapping("/boardView")
	public String boardView() {
	    return "board/boardView";
	}
	@RequestMapping("/insertBoard")
	public String insertBoard(String boardWriter, Board b, Model model, HttpSession session) {
	    log.debug("{}", b);
	    String msg, loc;
	    try {
	        // boardWriter 값을 board 객체에 설정
	        b.setCreater(Integer.parseInt(boardWriter));
	        // boardNo 설정 제거
	        service.insertBoard(b);
	        msg = "게시글 등록 성공 :)";
	        loc = "board/board";
	    } catch (RuntimeException e) {
	        msg = "게시글 등록 실패 :(";
	        loc = "board/boardWrite";
	    }

	    model.addAttribute("msg", msg);
	    model.addAttribute("loc", loc);

	    return "board/msg";
	}


	
}
