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
	public List<OvertimePay> selectMyOvertimePayByEmpNo(SqlSession session, int emp_no) {
		return session.selectList("overtimepay.selectMyOvertimePayByEmpNo",emp_no);
	}

}
