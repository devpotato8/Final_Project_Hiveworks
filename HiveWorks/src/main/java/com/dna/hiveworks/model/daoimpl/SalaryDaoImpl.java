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
	public List<Salary> selectSalaryListAll(SqlSession session, Map<String, Integer> page) {
		int cPage =(Integer)page.get("cPage");
		int numPerpage = (Integer)page.get("numPerpage");
		RowBounds rb = new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("salary.selectSalaryListAll",null,rb);
	}

	@Override
	public Salary selectSalaryByNo(SqlSession session, int no) {
		return session.selectOne("salary.selectSalaryByNo", no);
	}

	@Override
	public int insertSalary(SqlSession session, Salary s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSalary(SqlSession session, Salary s) {
		return session.update("salary.updateSalary", s);
	}

	@Override
	public int deleteSalary(SqlSession session, int salaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePositionPay(SqlSession session, Salary s) {
		return session.update("salary.updatePositionPay",s);
	}

	


}
