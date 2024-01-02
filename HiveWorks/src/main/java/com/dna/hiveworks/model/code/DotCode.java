/**
 * 
 */
package com.dna.hiveworks.model.code;

/**
 * @author : 이재연
 * @since : 2023. 12. 29.
 * Description : 클래스에 대한 설명을 입력해주세요.
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2023. 12. 29., 설명 : 최초작성
 * 
 */
public enum DotCode {
	DOT001 ("기안서"),
	DOT002("보고서"),
	DOT003("품의서"),
	DOT004("휴가/연차 신청서");
	
	private String code;
	private DotCode(String code) {
		this.code = code;
	}
	
	public String getCode() {
		return this.code;
	}
}
