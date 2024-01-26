package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.SurveyDao;
import com.dna.hiveworks.model.dto.board.Board;
import com.dna.hiveworks.model.dto.board.Survey;
import com.dna.hiveworks.model.dto.board.SurveyQuestion;

import lombok.extern.slf4j.Slf4j;
@Repository
@Slf4j
public class SurveyDaoImpl implements SurveyDao{

	// 설문 	
		@Override
		public Survey selectSurveyByNo(SqlSession session, int surveyNo) {
			return session.selectOne("survey.selectSurveyByNo",surveyNo);
		}
		@Override
		public List<Survey> selectAllSurvey(SqlSession session) {
			 return session.selectList("survey.selectAllSurvey");
		}
		@Override
		public int insertSurvey(SqlSession session,Survey s) {
			return session.insert("survey.insertSurvey", s);
		}
		@Override
		public int insertQuestion(SqlSession session,SurveyQuestion question) {
			return session.insert("survey.insertQuestion",question);
		}
		@Override
		public int surveyUpdate(SqlSession session, Survey survey) {	
			return session.update("survey.surveyUpdate",survey);
		}
		@Override
		public Survey surveyDelete(SqlSession session, int surveyNo) {
			return session.selectOne("survey.surveyDelete",surveyNo);
		}
		@Override
		public int questionInsert(SqlSession session, SurveyQuestion q) {
			return session.insert("survey.questionInsert",q);
		}
		
		
		
}
