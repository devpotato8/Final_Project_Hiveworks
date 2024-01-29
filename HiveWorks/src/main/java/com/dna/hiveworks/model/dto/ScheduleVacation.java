package com.dna.hiveworks.model.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ScheduleVacation {
	
	private int vacNo;
	private int empNo;
	private double vacCount; 
	private int vacUsed;
	private String vacOption;
	private int creater;
	@JsonFormat(shape = Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm")
	private Date createDate;
	private int modifier;
	@JsonFormat(shape = Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm")
	private Date modifyDate;
	private char useYN;
	private String myDeptCode;
	private String myEmpName;
	
	private String edocNo;
	private String vacPermit;

}
