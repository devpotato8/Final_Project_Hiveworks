package com.dna.hiveworks.model.dto.salary;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Dedution {

	private int dedu_no;
	private double dedu_emp_insur;
	private double dedu_health_insur;
	private double dedu_industry_insur;
	private double dedu_national_pension;
	private double dedu_income_tax;
	private double dedu_local_income_tax;
	private String use_yn;
}
