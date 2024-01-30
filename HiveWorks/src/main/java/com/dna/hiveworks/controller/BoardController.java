package com.dna.hiveworks.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dna.hiveworks.model.dto.board.Board;
import com.dna.hiveworks.model.dto.board.Uploadfile;
import com.dna.hiveworks.service.BoardService;

import jakarta.servlet.http.HttpServletResponse;
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
	    List<Board> boardList = service.selectAllBoard("BRD001");
	    model.addAttribute("boardList", boardList);
	    
	    return "board/board";
	}
	
	@GetMapping("/suggestions")
	public String suggestions(Model model) {
		List<Board> boardList = service.selectAllBoard("BRD002");
	    model.addAttribute("boardList", boardList);
	    
		return "board/suggestions";
	}
	@GetMapping("/blind")
	public String blind(Model model) {
		List<Board> boardList = service.selectAllBoard("BRD003");
	    model.addAttribute("boardList", boardList);
	    
		return "board/blind";
	}
	@GetMapping("/boardWrite")
	public String boardWrite() {
	    return "board/boardWrite";
	}
	@RequestMapping("/boardView")
	public void selectBoardByNo(int boardNo, Model model) {
	    Board board = service.selectBoardByNo(boardNo);
	    model.addAttribute("board", board);
	}


	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("boardNo") int boardNo, Model model) {
	    int board = service.boardDelete(boardNo);
	    log.debug("보드 번호{}", boardNo);
	    
	    // 게시글 삭제가 성공적인지 확인
	    if (board > 0) {
	        // 성공적인 경우, "board/board" 페이지로 리디렉션
	        return "redirect:/board/board";
	    } else {
	        // 성공하지 않은 경우, 게시글 목록을 다시 가져와서 "board/board" 페이지로 이동
	        List<Board> boardList = service.selectAllBoard("");
	        model.addAttribute("boardList", boardList);
	        return "board/board";
	    }
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

	    int result = service.boardUpdate(b);
	    System.out.println(result);

	    if ("BRD002".equals(b.getBoardType())) {
	        // BRD002인 경우 suggestions 페이지로 이동
	        loc = "board/suggestions";
	    } else {
	        // 기본적으로는 board 페이지로 이동
	        loc = "board/board";
	    }

	    if (result > 0) {
	        msg = "게시글 수정 성공 :)";
	    } else {
	        msg = "게시글 수정 실패 :(";
	        loc = "board/boardUpdate";
	    }

	    model.addAttribute("msg", msg);
	    model.addAttribute("loc", loc);

	    return "board/msg";
	}


	@PostMapping("/insertBoard")
	public String insertBoard(@RequestParam("upFile") MultipartFile[] upFiles, Board b, Model model, HttpSession session) {
	    String boardType = b.getBoardType();
	    String path = session.getServletContext().getRealPath("/resources/upload/board/");
	    List<Uploadfile> files = new ArrayList<>();

	    if (upFiles != null) {
	        for (MultipartFile mf : upFiles) {
	            if (!mf.isEmpty()) {
	                String oriName = mf.getOriginalFilename();
	                String ext = oriName.substring(oriName.lastIndexOf("."));
	                Date today = new Date(System.currentTimeMillis());
	                int randomNum = (int) (Math.random() * 10000) + 1;
	                String rename = "DNA_" + (new SimpleDateFormat("yyyyMMddHHmmssSSS").format(today)) + "_" + randomNum + ext;
	                try {
	                    mf.transferTo(new File(path, rename));
	                    Uploadfile file = Uploadfile.builder()
	                            .originalFileName(oriName)
	                            .reNamefile(rename)
	                            .build();
	                    files.add(file);
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }
	    b.setFiles(files);

	    log.debug("{}", b);
	    String msg, loc;
	    int result = service.insertBoard(b);
	    b.getFiles().forEach(f -> {
	        f.setBoardNo(b.getBoardNo());
	    });
	    log.debug("Insert result: {}", result);
	    System.out.println(result);

	    if ("BRD002".equals(boardType)) {
	        // BRD002인 경우 suggestions 페이지로 이동
	        loc = "board/suggestions";
	    } else {
	        // 기본적으로는 board 페이지로 이동
	        loc = "board/board";
	    }

	    if (result > 0) {
	        msg = "게시글 등록 성공 :)";
	    } else {
	        msg = "게시글 등록 실패 :(";
	        loc = "board/boardWrite";
	    }

	    model.addAttribute("msg", msg);
	    model.addAttribute("loc", loc);

	    return "board/msg";
	}

	@RequestMapping("/filedownload")
	public void fileDownload(String oriname, String rename,
	        OutputStream out, HttpSession session, 
	        HttpServletResponse response,
	        @RequestHeader(value="user-agent") String header) {
		 log.debug("Download request - oriname: {}, rename: {}", oriname, rename);
	    String path=session.getServletContext().getRealPath("/resources/upload/board/");
	    File downloadFile=new File(path+rename);
	    try(FileInputStream fis=new FileInputStream(downloadFile);
	        BufferedInputStream bis=new BufferedInputStream(fis);
	        BufferedOutputStream bos=new BufferedOutputStream(out);){
	        
	        boolean isMS=header.contains("Trident")||header.contains("MSIE");
	        String encodeFileName="";
	        if(isMS) {
	            encodeFileName=URLEncoder.encode(oriname,"UTF-8");
	            encodeFileName=encodeFileName.replaceAll("\\+", "%20");
	        }else {
	            encodeFileName=new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
	        }
	        
	        response.setContentType("application/octet-stream;charset=utf-8");
	        response.setHeader("Content-Disposition", "attachment;filename=\""+encodeFileName+"\"");
	        int data=-1;
	        while((data=bis.read())!=-1) {
	            bos.write(data);
	        }
	        
	    }catch(IOException e) {
	        e.printStackTrace();
	    }
	}
	@PostMapping("/imgupload")
	public @ResponseBody ResponseEntity<Map<String,Object>> imgUpload(MultipartHttpServletRequest request){
		Map<String,Object> response = null;
		try {
		MultipartFile uploadFile = request.getFile("upload");
		
		String originalFileName = uploadFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		String renamedFileName = LocalDate.now().format(DateTimeFormatter.ofPattern("uuuuMMdd"))+UUID.randomUUID()+ext;
		
		String realPath = request.getServletContext().getRealPath("/resources/upload/board/");
		String uploadPath = request.getServletContext().getContextPath()+"/resources/upload/board/"+renamedFileName;
		
		File upFIle = new File(realPath+renamedFileName);
		
		uploadFile.transferTo(upFIle);
		
		response = Map.of("uploaded",true,"url",uploadPath);
		}catch(IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK).body(response);
		
	}
	

	
}
