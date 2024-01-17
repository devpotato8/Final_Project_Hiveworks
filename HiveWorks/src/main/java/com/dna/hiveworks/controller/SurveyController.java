package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dna.hiveworks.model.dto.board.Survey;
import com.dna.hiveworks.model.dto.board.SurveyQuestion;
import com.dna.hiveworks.service.SurveyService;

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
	public String surveyWrite() {
		return "survey/surveyWrite";
	}
	@GetMapping("/surveyresult")
	public String surveyresult() {
		return "survey/surveyresult";
	}
	@RequestMapping("/insertSurvey")
	public String insertSurvey(Survey s, Model model) {
		String msg, loc;
		
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
	public void insertQuestion(SurveyQuestion qustion, Model model) {
		int result=service.insertQuestion(qustion);
		
	}
}
