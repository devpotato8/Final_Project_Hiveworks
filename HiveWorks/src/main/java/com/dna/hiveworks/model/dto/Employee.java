package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 DTO
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee {

	private String empId;
	private String empPw;
	private String empName;
	
}
