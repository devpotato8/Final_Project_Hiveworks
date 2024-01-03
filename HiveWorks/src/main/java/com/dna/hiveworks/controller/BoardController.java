package com.dna.hiveworks.controller;



import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	@RequestMapping("/insertBoard.do")
	public String insertBoard(MultipartFile[] upFile, Board b, String boardWriter, Model model, HttpSession session) {

		String path=session.getServletContext().getRealPath("/resources/upload/board");

		List<Uploadfile> files = new ArrayList<>();
		
		if(upFile!=null) {
			for(MultipartFile mf:upFile) {
				if(!mf.isEmpty()) {
					String oriName=mf.getOriginalFilename();
					String ext=oriName.substring(oriName.lastIndexOf("."));
					Date today=new Date(System.currentTimeMillis());
					int randomNum=(int)(Math.random()*10000)+1;
					String rename
						="DNA"+(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(today))+"_"+randomNum+ext;
					try {
						mf.transferTo(new File(path,rename));
						Uploadfile file=Uploadfile.builder()
								.originalFileName(oriName)
								.reNamefile(rename)
								.build();
						files.add(file);
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		b.setFiles(files);

		String msg,loc;
		try {
			service.insertBoard(b);
			msg="게시글등록성공 :)";
			loc="board/board";
		}catch(RuntimeException e) {
			msg="게시글등록실패 :(";
			loc="board/boardWrite";
			for(Uploadfile a : files) {
				File delFile =new File(path,a.getReNamefile());
				delFile.delete();
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
}
