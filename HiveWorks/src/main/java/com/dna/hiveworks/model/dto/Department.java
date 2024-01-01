package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Department {
	
	private String deptCode;
	private String deptName;
	private int deptLevel;
	private String deptUpstair;
	
}
