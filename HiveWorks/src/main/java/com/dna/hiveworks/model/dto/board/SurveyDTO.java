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
public class SurveyDTO {

	 private String surveyTitle;
	    private String surveyStart;
	    private String surveyEnd;
	    private List<SurveyQuestion> questions;
}
