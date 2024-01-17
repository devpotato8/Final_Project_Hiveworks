package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.board.Survey;
import com.dna.hiveworks.model.dto.board.SurveyQuestion;

public interface SurveyService {

	Survey selectSurveyByNo(int surveyNo);

	List<Survey> selectAllSurvey();

	int insertSurvey(Survey s);

	int insertQuestion(SurveyQuestion qustion);
	
	
}
