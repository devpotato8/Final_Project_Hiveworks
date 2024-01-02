/**
 * 
 */
package com.dna.hiveworks.model.code;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 결재 타입에 따른 코드
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public enum ApvCode {
	 APV001("결재"),
	 APV002("반려"),
	 APV003("협의"),
	 APV004("전결"),
	 APV005("대결");
	 
		private String apvType;
		private ApvCode(String apvType) {
			this.apvType = apvType;
		}
		
		public String getApvType() {
			return this.apvType;
		}
}
