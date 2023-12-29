package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Salary;

public interface SalaryDao {

	List<Salary> selectSalaryListAll();
	
	List<Salary> selectSalaryByNo();
	
	int insertSalary(SqlSession session, Salary s);
	int updateSalary(Salary s);
	int deleteSalary(int salaryNo);
	
}
