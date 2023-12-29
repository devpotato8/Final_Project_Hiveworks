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
public class Vacation {
	private int vacNo;
	private int empNo;
	private int vacCount;
	private int vacUsed;
	private String vacOption;
	private int creater;
	private Date createDate;
	private int modifier;
	private Date modifyDate;
	private char useYN;
	
	
	
	
	
	
}
