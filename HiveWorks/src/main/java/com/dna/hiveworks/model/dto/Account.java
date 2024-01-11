package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Account {

	private long ac_no;
	private int emp_no;
	private String ac_bank;
	private String ac_name;
	private String use_yn;
	
}
