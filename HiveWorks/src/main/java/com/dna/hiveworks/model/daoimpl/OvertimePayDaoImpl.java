package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.OvertimePayDao;
import com.dna.hiveworks.model.dto.salary.OvertimePay;

@Repository
public class OvertimePayDaoImpl implements OvertimePayDao {

	@Override
	public List<OvertimePay> selectOvertimePayListAll(SqlSession session) {
		return session.selectList("overtimepay.selectOvertimePayListAll");
	}

	@Override
	public List<OvertimePay> selectMyOvertimePayByempNo(SqlSession session, int emp_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
