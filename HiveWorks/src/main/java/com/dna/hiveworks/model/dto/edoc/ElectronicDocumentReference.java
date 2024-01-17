/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author : 이재연
 * @since : 2024. 1. 10.
 * Description : 전자문서 참조대상에 대한 DTO
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 10., 설명 : 최초작성
 * 
 */
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = {"refperEdocNo","refperEmpNo"})
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ElectronicDocumentReference {
	private int refperNo;
	private String refperEdocNo;
	private int refperEmpNo;
	private boolean refperStatus;
}
