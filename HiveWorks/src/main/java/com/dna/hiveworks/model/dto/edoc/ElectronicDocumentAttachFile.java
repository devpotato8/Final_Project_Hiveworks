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
 * @since : 2024. 1. 11.
 * Description : 전자문서 첨부파일에 대한 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 11., 설명 : 최초작성
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentAttachFile {
	private int attachNo;
	private String attachEdocRef;
	private String attachOriginalFilename;
	private String attachRenamedFilename;
	private int creater;
	private Date createDate;
	private int modifier;
	private Date modifyDate;
	private String useYn;
}
