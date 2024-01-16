/**
 * 
 */
package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 이재연
 * @since : 2024. 1. 16.
 * Description : 회사 설정 정보 전달 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 16., 설명 : 최초작성
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Setting {
	private int settingNo;
	private String companyName;
	private String companyLogo;
	private String companyAddress;
	private String companyPhone;
	private String companyEmail;
	private String companyCeoName;
	private String companyCeoStamp;
}
