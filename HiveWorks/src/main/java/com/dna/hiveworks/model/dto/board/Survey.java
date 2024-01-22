package com.dna.hiveworks.model.dto.board;



import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Survey {

	private int surveyNo;
	private String surveyTitle;
	private Date surveyStart;
	private Date surveyEnd;
	private String surveyType;
	private String surveyQuestion;
	private int creater;
    private Date createDate;
    private int modifier;
    private Date modifyDate;
    private char useYN;
	private String surveyData;
}
