package com.dna.hiveworks.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dna.hiveworks.model.dto.board.Survey;
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
	@GetMapping("/surveying")
	public String surveying() {
		return "survey/surveying";
	}
	@GetMapping("/surveyWrite")
	public String surveyWrite() {
		return "survey/surveyWrite";
}
}