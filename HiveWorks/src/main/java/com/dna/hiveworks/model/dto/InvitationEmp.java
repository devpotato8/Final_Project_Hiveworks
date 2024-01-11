package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InvitationEmp {
	private int yourEmpNo;
	private String yourEmpName;
	private String yourDeptName;
	private String yourDeptCode;
	

}
