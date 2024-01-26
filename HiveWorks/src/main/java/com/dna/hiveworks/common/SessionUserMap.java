package com.dna.hiveworks.common;

import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

@Component
public class SessionUserMap {
	
//멀티스레드 동시성 제어 고려하여 ConcurrentMap사용해봤음
//WebSocket처럼 동시에 여러 스레드가 데이터에 접근할 가능성이 있는 환경에서는 ConcurrentHashMap과 같은 
//동시성을 제어할 수 있는 자료 구조를 사용하는 게 좋다고 함..
//websocket 세션id랑 사용자 id 매핑하는 저장소 역할
	private ConcurrentHashMap<String, String> map = new ConcurrentHashMap<>();


	public void put(String sessionId, String userId) {
		map.put(sessionId, userId);
	}

	public String get(String sessionId) {
		return map.get(sessionId);
	}

	public void remove(String sessionId) {
		map.remove(sessionId);
	}
	
	public boolean containsValue(String value) {
		return map.containsValue(value);
	}
}

