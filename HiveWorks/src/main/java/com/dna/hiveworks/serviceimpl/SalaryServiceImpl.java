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
	public List<Salary> selectSalaryListAll() {
		return dao.selectSalaryListAll(session);
	}

	@Override
	public Salary selectSalaryByNo(int sal_no) {
		return dao.selectSalaryByNo(session, sal_no);
	}

	@Override
	public int insertSalary(Salary s) {
		
		int result = dao.insertSalary(session, s);
		if(result<=0) {
			new RuntimeException("등록 실패");
		}
		
		return result;
	}

	@Override
	public int updateSalary(Salary s) {
		
		int result = dao.updateSalary(session, s);
		if(result>0) {
			
		}else {
			new RuntimeException("업데이트 실패");
		}
		
		return result;
	}

	@Override
	public int deleteSalary(int sal_No) {
		return dao.deleteSalary(session, sal_No);
	}

	@Override
	public Map<String, Integer> calculateSalary(Map<String,Integer> data) {
		return dao.calculateSalary(session, data);
	}

	@Override
	public List<Salary> selectMySalaryList(int emp_no) {
		
		return dao.selectMySalaryList(session, emp_no);
	}
	
	

	
}
