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
public class Work {
	private int workNo;
	private int empNo;
	private String workTypeCode;
	private Date workDay;
	private Date workStartTime;
	private Date workEndTime;
	private String workPermit;
	private int creater;
	private Date createDate;
	private int modifier;
	private Date modifyDate;
	private char useYN;
	
	private WorkRealtime workRealtime;
	
	
	
	
	
}
