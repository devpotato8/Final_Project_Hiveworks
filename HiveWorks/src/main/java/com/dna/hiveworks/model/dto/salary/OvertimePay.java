package com.dna.hiveworks.model.dto.salary;

import java.sql.Date;
import java.util.List;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Work;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OvertimePay {

	private int ot_pay_no;
	private int work_no;
	private int emp_no;
	private int ot_pay_per_time;
	private String ot_pay_month;
	private List<Employee> employees;
	private String use_yn;
}
