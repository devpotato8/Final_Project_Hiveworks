package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.salary.OvertimePay;

public interface OvertimePayDao {

	List<OvertimePay> selectOvertimePayListAll(SqlSession session);
	
	List<OvertimePay> selectMyOvertimePayByempNo(SqlSession session, int emp_no);

}
