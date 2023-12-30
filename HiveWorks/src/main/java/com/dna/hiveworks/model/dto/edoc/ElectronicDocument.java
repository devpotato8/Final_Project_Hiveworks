/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author : 이재연
 * @since : 2023. 12. 29.
 * Description : 전자 문서의 내용을 전달하기 위한 DTO클래스
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 29., 설명 : 최초작성
 * 
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ElectronicDocument {
	private String edocNo;
	@Setter
	private DotCode edocDotCode;
	@Setter
	private String edocTitle;
	@Setter
	private Date edocPreservePeriod;
	private String edocDsgCode;
	private String edocContent;
	private Date edocStartDate;
	private Date edocEndDate;
	private String edocStatus;
	
	enum DotCode{
		DOT001 ("기안서"),
		DOT002("보고서"),
		DOT003("품의서"),
		DOT004("휴가/연차 신청서");
		
		private String docType;
		private DotCode(String docType) {
			this.docType = docType;
		}
		
		public String getDocType() {
			return this.docType;
		}
		
		
	}
}
