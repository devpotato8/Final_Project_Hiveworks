/**
 * 
 */
package com.dna.hiveworks.model.dto.edoc.status;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 진행중인 문서 목록에 대한 상태코드
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public enum ListStatus {
	ALL("전체"),
	WAIT("대기"),
	CHECK("확인"),
	EXPECT("예정"),
	PROCESS("진행");
	
	private String status;
	private ListStatus(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return this.status;
	}
	
}
