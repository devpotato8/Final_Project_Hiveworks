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
		
		int result = dao.updateSalary(session, s);
		if(result>0) {
			int result2 = dao.updatePositionPay(session, s);
			if(result2==0) new RuntimeException("업데이트 실패");
		}else {
			new RuntimeException("업데이트 실패");
		}
		
		return result;
	}

	@Override
	public int deleteSalary(int salaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
