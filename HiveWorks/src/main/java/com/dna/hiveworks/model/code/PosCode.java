/**
 * 
 */
package com.dna.hiveworks.model.code;

/**
 * @author : 이재연
 * @since : 2024. 1. 17.
 * Description : 직위에 따른 코드
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 17., 설명 : 최초작성
 * 
 */
public enum PosCode {
	POS001("이사"),
	POS002("부장"),
	POS003("차장"),
	POS004("과장"),
	POS005("대리"),
	POS006("주임"),
	POS007("사원");
	
	private String code;
	
	private PosCode(String code) {
		this.code = code;
	}
	
	public String getCode() {
		return this.code;
	}
}
