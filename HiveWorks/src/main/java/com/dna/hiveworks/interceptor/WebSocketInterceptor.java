package com.dna.hiveworks.interceptor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.stereotype.Component;

import com.dna.hiveworks.common.SessionUserMap;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WebSocketInterceptor implements ChannelInterceptor {
	
	@Autowired
    private SessionUserMap sessionUserMap;

	//현재 접속중인 사용자를 구별하기 용이하게 연결시, 종료시에 Id매핑 관리
    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {
    	log.info("Interceptor실행");
    	
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        String sessionId = accessor.getSessionId();
        

        switch (accessor.getCommand()) {
            case CONNECT:
                // 연결 시 사용자 ID를 세션 ID와 매핑
            	List<String> userIdHeader = accessor.getNativeHeader("userId");
                if (userIdHeader != null && !userIdHeader.isEmpty()) {
                    String userId = userIdHeader.get(0);
                    sessionUserMap.put(sessionId, userId);
                    System.err.println("CONNECT:sessionId= "+sessionId + ", userId= "+userId);
                    System.err.println("sessionUserMap: "+sessionUserMap);
                }
                break;
            case DISCONNECT:
                // 연결 종료 시 세션 ID와 사용자 ID 매핑 제거
                sessionUserMap.remove(sessionId);
                System.err.println("DISCONNECT:sessionId= "+sessionId);
                break;
            default: 
                break;
        }
        return message;
    }
}
