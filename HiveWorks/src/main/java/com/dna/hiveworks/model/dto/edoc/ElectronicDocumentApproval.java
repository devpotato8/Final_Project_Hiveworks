/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import com.dna.hiveworks.model.code.ApvCode;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 전자문서 결재에 관한 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentApproval {
	private long aprvlNo;
	private String aprvlEdocNo;
	private ApvCode aprvlApvCode;
	private int aprvlEmpNo;
	private long aprvlRank;
	private String aprvlStatus;
	private String aprvlComment;
	
}
