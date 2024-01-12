package com.dna.hiveworks.model.dto.board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SurveyAnswer {

	private int answerNo;
	private int answerQuestionNo;
	private String answerContent;
}
