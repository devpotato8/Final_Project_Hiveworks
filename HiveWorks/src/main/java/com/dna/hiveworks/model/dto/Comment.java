package com.dna.hiveworks.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Comment {
	private int calCommentNo;
	private int calNo;
	private int calCommentLevel;
	private int calCommentRef;
	private String calCommentContent; 
	private Date createDate;
	private Date ModifyDate;
	private int creater;
	private int modifier;
	private String useYn;
	private String empName;

}

