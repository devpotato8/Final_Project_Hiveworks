package com.dna.hiveworks.model.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CheckList {
	private int calChecklistNo;
	private int calNo;
	private String calChecklistContent;
	private Date createDate;
	private Date ModifyDate;
	private int creater;
	private int modifier;
	private String useYn;
	private String endYn;
	

}
