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
	private int dedu_emp_insur;
	private int dedu_health_insur;
	private int dedu_industry_insur;
	private int dedu_national_pension;
	private int dedu_income_tax;
	private int dedu_local_income_tax;
	private String use_yn;
}
