/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import java.sql.Date;
import java.util.List;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.code.DsgCode;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 휴가신청서 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LeaveApplication {
	private String edocNo;
	private DotCode edocDotCode;
	private String edocTitle;
	private Date edocPreservePeriod;
	private DsgCode edocDsgCode;
	private String edocContent;
	private Date startDate;
	private Date endDate;
	private int creater;
	private Date createDate;
	
	List<ElectronicDocumentComment> comments;
	List<ElectronicDocumentHistory> history;
	List<ElectronicDocumentApproval> approval;
}
