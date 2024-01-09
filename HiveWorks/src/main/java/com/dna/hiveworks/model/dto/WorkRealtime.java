package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkRealtime {
	private int workNo;
	private String workLate;
	private String workFastEnd;
	private String workAbsence;
}
