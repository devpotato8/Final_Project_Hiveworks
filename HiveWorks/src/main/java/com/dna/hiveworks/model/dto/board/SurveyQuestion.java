package com.dna.hiveworks.model.dto.board;

import java.util.List;

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
	private int surveyNo;
	private String questionTitle;
	private String surveyData;
}
