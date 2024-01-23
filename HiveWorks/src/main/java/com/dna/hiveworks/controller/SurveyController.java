package com.dna.hiveworks.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dna.hiveworks.model.dto.board.Survey;
import com.dna.hiveworks.model.dto.board.SurveyQuestion;
import com.dna.hiveworks.service.SurveyService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@AllArgsConstructor
@RequestMapping("/survey")
@Slf4j
public class SurveyController {

	private SurveyService service;
	
	@GetMapping("/survey")
	   public String surveyList(Model model) {
	      List<Survey> surveyList = service.selectAllSurvey();
	      model.addAttribute("surveyList", surveyList);
	      return "survey/survey";
	}
	@RequestMapping("/surveying")
	public void selectBoardByNo(int surveyNo, Model model) {
		Survey survey = service.selectSurveyByNo(surveyNo);
		   log.debug("survey Object: {}", survey);	   
		   model.addAttribute("survey", survey);
	}
	@GetMapping("/surveyWrite")
	public String surveyWrite(Model model) {
		List<Survey> surveyList = service.selectAllSurvey();
	     model.addAttribute("surveyList", surveyList);
		return "survey/surveyWrite";
	}
	@ResponseBody
	@RequestMapping("/surveyresult")
	public String surveyresult(@RequestParam(value="checkboxValues[]")List<String>checkboxValues,HttpSession session) {
		return "survey/surveyresult";
	}
	@RequestMapping("/surveyDelete")
	public String surveyDelete(@RequestParam("surveyNo") int surveyNo,Model model) {
		Survey survey = service.surveyDelete(surveyNo);
		log.debug("보드 번호{}",surveyNo);
		List<Survey> surveyList = service.selectAllSurvey();
	    model.addAttribute("surveyList", surveyList);
	    return "survey/survey";
	}
	
	@GetMapping("/surveyUpdate")
	public String surveyUpdate(@RequestParam("surveyNo")int surveyNo,Model model){
		Survey survey = service.selectSurveyByNo(surveyNo);
		log.debug("보드 정보{}",survey);		
		model.addAttribute("survey",survey);
		return "survey/surveyUpdate";
	}
	@PostMapping("/surveyUpdate")
	public String surveyUpdate(Survey s, Model model, HttpSession session) {
	    log.debug("{}", s);
	    
	    String msg, loc;
	   
	    int result=service.surveyUpdate(s);
	    s.setSurveyData((String) model.getAttribute("surveyData"));
	    
	    System.out.println(result);
	    if(result>0) {
	    	msg = "게시글 수정 성공 :)";
	    	loc = "survey/survey";
	    } else {
	    	msg = "게시글 수정 실패 :(";
	    	loc = "survey/surveyUpdate";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("loc", loc);
	    model.addAttribute("surveyData", s.getSurveyData());
	    return "board/msg";
	}
	@RequestMapping("/insertSurvey")
	public String insertSurvey(Survey s, Model model, @RequestParam String surveyData) {
		List<Map> data=new ArrayList<>();		
		try {
			data=new ObjectMapper().readValue(surveyData, List.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		String msg, loc;
		s.setSurveyData(surveyData);
		int result=service.insertSurvey(s);

		if(result>0) {
			msg = "게시글 등록 성공 :)";
			loc = "survey/survey";
		} else {
			msg = "게시글 등록 실패 :(";
			loc = "survey/surveyWrite";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "board/msg";
	}
	@RequestMapping("/insertQuestion")
	public String insertQuestion(SurveyQuestion question, Model model,@RequestParam String surveyData) {		
		List<Map> data=new ArrayList<>();		
		try {
			data=new ObjectMapper().readValue(surveyData, List.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		String msg, loc;
		question.setSurveyData(surveyData);
		int result=service.insertQuestion(question);
		if(result>0) {
			msg = "설문 성공";
			loc = "survey/survey";
		} else {
			msg = "설문실패";
			loc = "survey/surveyWrite";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "board/msg";
		
	}
}
