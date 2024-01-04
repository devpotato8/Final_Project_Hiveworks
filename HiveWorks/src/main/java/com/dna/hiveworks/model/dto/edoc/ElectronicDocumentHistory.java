/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 전자문서 이력에 대한 DTO.
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentHistory {
	private int hisNo;
	private String hisEdocNo;
	private String hisContent;
	private int creater;
	private Date createDate;
}
