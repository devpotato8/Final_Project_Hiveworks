package com.dna.hiveworks.model.daoimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.SalaryDao;
import com.dna.hiveworks.model.dto.salary.Salary;

@Repository
public class SalaryDaoImpl implements SalaryDao {

	@Override
	public List<Salary> selectSalaryListAll(SqlSession session) {
		return session.selectList("salary.selectSalaryListAll");
	}

	@Override
	public Salary selectSalaryByNo(SqlSession session, int sal_no) {
		return session.selectOne("salary.selectSalaryByNo", sal_no);
	}

	@Override
	public int insertSalary(SqlSession session, Salary s) {
		return session.insert("salary.insertSalary",s);
	}

	@Override
	public int updateSalary(SqlSession session, Salary s) {
		return session.update("salary.updateSalary", s);
	}

	@Override
	public int deleteSalary(SqlSession session, int sal_no) {
		return session.delete("salary.deleteSalary",sal_no);
	}

	@Override
	public int updatePositionPay(SqlSession session, Salary s) {
		return session.update("salary.updatePositionPay",s);
	}

	@Override
	public int insertPositionPay(SqlSession session, Salary s) {
		
		return session.insert("salary.insertPositionPay",s);
	}

	@Override
	public Map<String, Integer> calculateSalary(SqlSession session, Map<String, Integer> data) {
		return session.selectOne("salary.calculateSalary",data);
	}

	@Override
	public List<Salary> selectMySalaryList(SqlSession session, int emp_no) {
		return session.selectList("salary.selectMySalaryList",emp_no);
	}

	
}
