package com.dna.hiveworks.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Resource {

	private int resourceNo;
	private String resourceType;
	private String resourceName;
	private int resourceMax;
	private int creater;
	private int modifier;
	private String resourceUseYn;
	private Date createDate;
	private Date ModifyDate;
	private Date useStartTime;
	private Date useEndTime;
	private String useYn;
}
