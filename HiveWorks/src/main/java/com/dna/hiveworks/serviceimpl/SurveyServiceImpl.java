package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.model.dao.SurveyDao;
import com.dna.hiveworks.model.dto.board.Survey;
import com.dna.hiveworks.model.dto.board.SurveyQuestion;
import com.dna.hiveworks.service.SurveyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j
public class SurveyServiceImpl implements SurveyService{

	private final SqlSession session;
	
	private final SurveyDao dao;
	
	@Override
	public Survey selectSurveyByNo(int surveyNo) {
		return dao.selectSurveyByNo(session, surveyNo);
	}
	@Override
	   public List<Survey> selectAllSurvey() {
	      return dao.selectAllSurvey(session);
	   }
	
	@Override
	@Transactional
	public int insertSurvey(Survey s) {
		return dao.insertSurvey(session, s);
	}
	@Override
	public int insertQuestion(SurveyQuestion qustion) {
		return dao.insertQuestion(session, qustion);
	}
	@Override
	public int surveyUpdate(Survey survey) {
		return dao.surveyUpdate(session,survey);
	}
	@Override
	public Survey surveyDelete(int surveyNo) {
		return dao.surveyDelete(session,surveyNo);
	}
}
