package com.dna.hiveworks.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Transactional
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService {

	private final EmpDaoImpl dao;
	private final SqlSession session;
	private final BCryptPasswordEncoder passwordEncoder;
	
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
		
		Employee e = (Employee)empData.get("employee");
		Account ac = (Account)empData.get("account");
		
		int result = dao.updateEmployee(session, e);
		if(result>0) {
			ac.setEmp_no(e.getEmp_no());
			int result2 = dao.updateAccount(session, ac);
			if(result2==0) {
				result2 = dao.insertAccount(session, ac);
			}
		}else {
			new RuntimeException("등록 실패");
		}

		return result;
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
	public int updatePassword(Map<String, Object> IdAndPassword) {
		
		int result = dao.updatePassword(session, IdAndPassword);
		if(result==0) {
			new RuntimeException("업데이트가 되지 않았습니다.");
		}
		
		return result;
	}


	@Override
	public Map<String, List<Map<String, Object>>> selectAuthorityList() {
		Map<String, List<Map<String,Object>>> authorityList = new HashMap<>();
		
		authorityList.put("authorityList", dao.selectAuthorityList(session));

		return authorityList;
	}


	@Override
	public int updateAuthorities(Map<String, List<String>> data) {
		
		int count =0;
		
		for(int i=0; i<data.get("names").size();i++) {
			Map<String,Object> empNoAndAutcode = new HashMap<>();
			
			empNoAndAutcode.put("empNo", data.get("names").get(i));
			empNoAndAutcode.put("value", data.get("values").get(i));
			
			int result = dao.updateAuthorities(session,empNoAndAutcode);
			if(result==0) {
				new RuntimeException("업데이트 실패");
			}
			count++;
		}

		return count;
	}


	@Override
	public Map<String, Object> downloadEmployeesAndAccount() {
		Map<String, Object> result = new HashMap<>();
		
		List<Employee> employees = dao.selectEmployeesListAll(session);
		List<Account> accounts = new ArrayList<>();
		
		for(int i=0; i<employees.size();i++) {
			accounts.add(dao.selectAccountByEmpNo(session, employees.get(i).getEmp_no()));	
		}
		
		result.put("employees", employees);
		result.put("accounts", accounts);
		
		return result;
	}


	@Override
	public int insertEmployeeByExcel(Map<String, Object> empData) {
		
		List<Employee> employees = (List<Employee>)empData.get("employees");
		List<Account> accounts = (List<Account>)empData.get("accounts");
		
		System.out.println("서비스 내 직원들:"+employees);
		System.out.println("서비스 내 계좌들:"+accounts);
		
		int result=0;
		int count=0;
		for(int i=0;i<employees.size();i++) {
			result = dao.insertEmployee(session, employees.get(i));
			if(result>0) {
				accounts.get(i).setEmp_no(employees.get(i).getEmp_no());
				int result2 = dao.insertAccount(session, accounts.get(i));
				count++;
				if(result2==0) new RuntimeException("등록 실패");
				
			}else {
				new RuntimeException("등록 실패");
			}
		}
		System.out.println("insert횟수:"+count);

		return result;
	}


	@Override
	public Employee checkEmployeeByIdAndPassword(Map<String, String> empData) {
		
		Employee emp = dao.confirmEmployee(session, empData);
		
		if(emp!=null) {
			
			if(!passwordEncoder.matches(empData.get("empPassword"), emp.getEmp_pw())){
				new RuntimeException("패스워드가 다릅니다.");				
			}
		
		}else {
			new RuntimeException("사원을 찾을 수 없습니다.");
		}
	
		return emp;
	}

	

	
}
