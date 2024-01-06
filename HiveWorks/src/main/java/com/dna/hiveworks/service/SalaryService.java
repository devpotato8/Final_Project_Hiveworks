package com.dna.hiveworks.service;

import java.util.List;
import java.util.Map;

import com.dna.hiveworks.model.dto.salary.Salary;

/**
 * @author : 김태하
 * @since : 2023. 12. 28.
 * Description : 급여정보 서비스 구현
 * 
 * History :
 * - 작성자 : 김태하, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

public interface SalaryService {

	List<Salary> selectSalaryListAll(Map<String,Integer> page);
	
	Salary selectSalaryByNo(int salaryNo);
	
	int insertSalary(Salary s);
	int updateSalary(Salary s);
	int deleteSalary(int salaryNo);
	
	Map<String, Integer> calculateSalary(Map<String,Integer> data);
	
}
