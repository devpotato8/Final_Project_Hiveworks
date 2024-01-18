package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.salary.OvertimePay;

public interface OvertimePayService {

	List<OvertimePay> selectOvertimePayListAll(); 
}
