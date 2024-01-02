/**
 * 
 */
package com.dna.hiveworks.common.exception;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 예외상황 처리용 Exception
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public class HiveworksException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	/**
	 *  기본생성자
	 */
	public HiveworksException() {
		super();
	}
	
	public HiveworksException(String msg) {
		super(msg);
	}
}
