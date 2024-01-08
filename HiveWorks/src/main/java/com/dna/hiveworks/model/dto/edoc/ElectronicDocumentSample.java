/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import java.sql.Date;

import com.dna.hiveworks.model.code.DotCode;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2024. 1. 5.
 * Description : 전자문서 양식 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 5., 설명 : 최초작성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentSample {
	private int sampleNo;
	private DotCode sampleDotCode;
	private String sampleName;
	private String sampleDesc;
	private String sampleContent;
	private int creater;
	private Date createDate;
	private int modifier;
	private Date modifyDate;
	private boolean useYn;
}
