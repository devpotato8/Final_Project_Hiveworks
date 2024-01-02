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
public enum DsgCode {
	DSG001("S등급"),
	DSG002("A등급"),
	DSG003("B등급"),
	DSG004("C등급");
	
	private String secretGrade;
	
	private DsgCode(String secretGrade) {
		this.secretGrade = secretGrade;
	}
	
	public String getSecretGrade() {
		return this.secretGrade;
	}
	
}
