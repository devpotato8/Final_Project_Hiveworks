/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc.status;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 문서 보관함에 대한 상태 코드
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public enum BoxStatus {
	ALL(" 전체"),
	WRITER("기안"),
	APPROVAL("결재"),
//	REFER("수신"),
	READ("회람/참조"),
	RETURN("반려");
	
	private String status;
	private BoxStatus(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return this.status;
	}
}
