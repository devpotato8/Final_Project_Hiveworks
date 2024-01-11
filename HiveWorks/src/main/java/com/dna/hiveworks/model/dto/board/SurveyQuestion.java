package com.dna.hiveworks.model.dto.board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SurveyQuestion {
	
	private int questionNo;
	private int questionSurveyNo;
	private String questionContent;
}
