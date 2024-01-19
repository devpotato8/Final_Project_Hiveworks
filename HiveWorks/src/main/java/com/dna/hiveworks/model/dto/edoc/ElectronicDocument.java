/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import com.dna.hiveworks.model.code.DotCode;
import com.dna.hiveworks.model.code.DsgCode;
import com.dna.hiveworks.model.code.PosCode;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2023. 12. 29.
 * Description : 전자 문서의 내용을 전달하기 위한 DTO클래스
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 29., 설명 : 최초작성
 * 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ElectronicDocument implements Serializable{
	
	private static final long serialVersionUID = -6899204179234853192L;
	
	// DB에서 불러오는 내용
	private String edocNo;
	private DotCode edocDotCode;
	private String edocTitle;
	private Date edocPreservePeriod;
	private DsgCode edocDsgCode;
	private String edocContent;
	private Date edocStartDate;
	private Date edocEndDate;
	private double edocVacationCount;
	private String edocStatus;
	private int creater;
	private Date createDate;
	private Date finalizedDate;
	
	// Has a 관계에 있는 내용
	List<ElectronicDocumentComment> comments;
	//List<ElectronicDocumentHistory> history;
	List<ElectronicDocumentApproval> approval;
	List<ElectronicDocumentReference> reference;
	List<ElectronicDocumentAttachFile> attachFiles;
	
	// 데이터 처리 혹은 편리를 위해 추가한 내용
	private int period;
	private String createrEmpName;
	private String createrJobName;
	private String createrDeptName;
	private PosCode posCode;
}
