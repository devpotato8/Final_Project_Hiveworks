/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompanySetting {
	private String companyName;
	private String companyLogo;
	private String companyAddress;
	private String companyPhone;
	private String companyEmail;
	private String companyCeoStamp;
	private String comapnyCeoName;
	private String edocPrefix;
	private String edocDateFormat;
	private String edocNumFormat;
}
