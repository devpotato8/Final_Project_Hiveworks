/**
 * 
 */
package com.dna.hiveworks.model.code;

/**
 * @author : 이재연
 * @since : 2023. 12. 29.
 * Description : 전자문서의 비밀등급에 대한 코드
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 29., 설명 : 최초작성
 * 
 */
public enum DsgCode {
	DSG001("S등급"),
	DSG002("A등급"),
	DSG003("B등급"),
	DSG004("C등급");
	
	private String code;
	private DsgCode(String code) {
		this.code = code;
	}
	
	public String getCode() {
		return this.code;
	}
	
}
