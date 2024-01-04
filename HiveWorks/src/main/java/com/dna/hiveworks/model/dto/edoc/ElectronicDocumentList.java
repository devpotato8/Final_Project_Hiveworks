/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import java.sql.Date;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.dto.edoc.status.EdocStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2024. 1. 3.
 * Description : 진행중 / 문서함 에서 불러오는 전자문서 목록에 대한 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초작성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentList {
	private String edocNo;
	private String edocTitle;
	private String empName;
	private Date createDate;
	private Date finalizedDate;
	private DotCode edocDotCode;
	private EdocStatus edocStatus;
}
