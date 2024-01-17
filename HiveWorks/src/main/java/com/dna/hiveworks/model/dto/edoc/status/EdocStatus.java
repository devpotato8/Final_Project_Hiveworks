/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc.status;

/**
 * @author : 이재연
 * @since : 2024. 1. 3.
 * Description : 문서에 대한 사용자의 상태
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초작성
 * 
 */
public enum EdocStatus {
	WRITE("기안"),
	PROCESS("진행중"),
	APV_A("결재"),
	APV_W("결재대기"),
	APV_P("결재예정"),
	APV_C("확인예정"),
	APV_X("취소");
	
	private String status;
	private EdocStatus(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return this.status;
	}
}
