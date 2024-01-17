package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.board.Survey;

public interface SurveyService {

	Survey selectSurveyByNo(int surveyNo);

	List<Survey> selectAllSurvey();

	int insertSurvey(Survey s);
}
