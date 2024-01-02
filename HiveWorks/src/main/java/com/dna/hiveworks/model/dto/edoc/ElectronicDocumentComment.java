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
 * Description : 전자문서에 남긴 의견 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentComment {
	private int commNo;
	private String commEdocNo;
	private int creater;
	private Date createDate;
	private String commContent;
	private int modifier;
	private Date modifyDate;
	private boolean useYn;
}
