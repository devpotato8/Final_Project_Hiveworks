package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dna.hiveworks.model.daoimpl.OvertimePayDaoImpl;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.salary.OvertimePay;
import com.dna.hiveworks.service.OvertimePayService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class OvertimePayServiceImpl implements OvertimePayService   {
	
	private final OvertimePayDaoImpl dao;
	private final SqlSession session;
	
	@Override
	public List<OvertimePay> selectOvertimePayListAll() {
		
		return dao.selectOvertimePayListAll(session);
	}

	@Override
	public List<OvertimePay> selectMyOvertimePayByempNo(int emp_no) {
		return dao.selectMyOvertimePayByempNo(session, emp_no);
	}

	
	
}
