package com.dna.hiveworks.common;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Authorities {
	ADMIN("ROLE_ADMIN", "일반관리자"),
	USER("ROLE_USER","일반사용자");
	
	private final String key;
	private final String title;
}
