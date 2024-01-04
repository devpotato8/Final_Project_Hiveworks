package com.dna.hiveworks.serviceimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.daoimpl.SalaryDaoImpl;
import com.dna.hiveworks.model.dto.salary.Salary;
import com.dna.hiveworks.service.SalaryService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SalaryServiceImpl implements SalaryService {

	
	private final SalaryDaoImpl dao;
	private final SqlSession session;
	
	@Override
	public List<Salary> selectSalaryListAll(Map<String, Integer> page) {
		return dao.selectSalaryListAll(session, page);
	}

	@Override
	public Salary selectSalaryByNo(int salaryNo) {
		return dao.selectSalaryByNo(session, salaryNo);
	}

	@Override
	public int insertSalary(Salary s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSalary(Salary s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSalary(int salaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
