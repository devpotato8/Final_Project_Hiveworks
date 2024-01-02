package com.dna.hiveworks.model.dto.salary;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PositionPay {

	private int pp_no;
	private int sal_no;
	private String pos_code;
	private int pp_add_pay;
	private String use_yn;
}
