package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Salary;

public interface SalaryDao {

	List<Salary> selectSalaryListAll(SqlSession session, Map<String, Integer> page);
	
	List<Salary> selectSalaryByNo(SqlSession session, int no);
	
	int insertSalary(SqlSession session, Salary s);
	int updateSalary(SqlSession session, Salary s);
	int deleteSalary(SqlSession session, int salaryNo);
	
}
