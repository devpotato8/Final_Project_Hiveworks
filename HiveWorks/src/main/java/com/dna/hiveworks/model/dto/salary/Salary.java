package com.dna.hiveworks.model.dto.salary;

import java.sql.Date;
import java.util.List;

import com.dna.hiveworks.model.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Salary {

	private int sal_no;
	private int emp_no;
	private int dedu_no;
	private int sal_base;
	private int sal_meal;
	private int sal_bonus;
	private int sal_actual;
	private Date sal_date;
	private String use_yn;
	private int creater;
	private Date create_date;
	private int modifier;
	private Date modify_date;
	private Dedution dedution;
	private int overtime_pay;
	private int position_pay;
	private List<Employee> employee;
	
}
