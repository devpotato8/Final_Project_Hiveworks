package com.dna.hiveworks.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.daoimpl.EmpDaoImpl;
import com.dna.hiveworks.model.dto.Account;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.EmpService;

import lombok.RequiredArgsConstructor;


/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 서비스 구현
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService {

	private final EmpDaoImpl dao;
	private final SqlSession session;
	
	
	@Override
	public Employee selectEmployeeById(String empId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public Map<String,Object> selectEmployeeByEmpNo(int empNo) {
		
		Map<String,Object> value = new HashMap<>();
		
		Employee employee=dao.selectEmployeeByEmpNo(session, empNo);
		Account account=dao.selectAccountByEmpNo(session, empNo);

		

		value.put("employee",employee);
		value.put("account", account);

		return value;
	}

	@Override
	public int insertEmployee(Map<String,Object> empData) {
		
		Employee e = (Employee)empData.get("employee");
		Account ac = (Account)empData.get("account");
		
		int result = dao.insertEmployee(session, e);
		if(result>0) {
			ac.setEmp_no(e.getEmp_no());
			int result2 = dao.insertAccount(session, ac);
			if(result2==0) new RuntimeException("등록 실패");
			
		}else {
			new RuntimeException("등록 실패");
		}

		return result;
	}

	@Override
	public int updateEmployee(Map<String,Object> empData) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEmployee(int emp_no) {
		int result_first = dao.deleteEmployee(session,emp_no);
		
		if(result_first>0) {
			int result_second = dao.deleteAccount(session, emp_no);
			if(result_second==0) {
				new RuntimeException("계좌 삭제 실패");
			}
		}else {
			new RuntimeException("직원 삭제 실패");
		}

		return result_first;
	}

	@Override
	public List<Employee> selectEmployeesListAll() {
		return dao.selectEmployeesListAll(session);
	}

	@Override
	public List<Employee> searchEmployeesByKeyword(Map<String,Object> param) {
		
		return dao.searchEmployeesByKeyword(session, param);
	}

	@Override
	public Map<String,List<Map<String,Object>>> selectDataListForEmployee() {
		Map<String, List<Map<String,Object>>> data = new HashMap<>();
		
		data.put("deptList",dao.selectDeptList(session));
		data.put("positionList",dao.selectPositionList(session));
		data.put("jobList",dao.selectJobList(session));
		data.put("workStatusList",dao.selectWorkStatusList(session));
		data.put("workPatternList",dao.selectWorkPatternList(session));
		data.put("workTypeList",dao.selectWorkTypeList(session));
		
		return data;
		
	}


	@Override
	public int updatePassword(Map<String, String> IdAndPassword) {
		
		int result_first = dao.confirmEmployee(session,IdAndPassword);

		if(result_first!=0) {
			int result_second = dao.updatePassword(session,IdAndPassword);
			if(result_second==0) {
				new RuntimeException("비밀번호 업데이트 실패");
			}
		}else {
			new RuntimeException("유저 확인 실패");
		}
		
		return result_first;
	}

	
	
	
	
	

	
}
