package com.dna.hiveworks.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Employee;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 DAO
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

public interface EmpDao {
	
	Employee selectEmployeeById(SqlSession session, String empId);
	
}
