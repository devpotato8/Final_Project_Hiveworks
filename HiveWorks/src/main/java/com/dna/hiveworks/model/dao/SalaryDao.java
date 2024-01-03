package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.salary.Salary;

public interface SalaryDao {

	List<Salary> selectSalaryListAll(SqlSession session, Map<String, Integer> page);
	
	Salary selectSalaryByNo(SqlSession session, int no);
	
	int insertSalary(SqlSession session, Salary s);
	int updateSalary(SqlSession session, Salary s);
	int deleteSalary(SqlSession session, int salaryNo);
	
	int updatePositionPay(SqlSession session, Salary s);
	
}
