package com.dna.hiveworks.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import com.dna.hiveworks.interceptor.WebSocketInterceptor;

import lombok.RequiredArgsConstructor;



@Configuration
@EnableWebSocketMessageBroker
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
	private final WebSocketInterceptor webSocketInterceptor;
	
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/ws/msg").setAllowedOriginPatterns("http://localhost:9090").withSockJS();
		//registry.addEndpoint("/topic/messages").setAllowedOriginPatterns("http://localhost:9090").withSockJS();
		
	}


	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 메시지를 발행하는 요청 url -> 메시지 발신
	    //  registry.setApplicationDestinationPrefixes("/pub");
	    // 메시지를 구독하는 요청 url -> 메시지 수신
	    //  registry.enableSimpleBroker("/sub");
	      registry.enableSimpleBroker("/sub","/topic");
	}
	
	@Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        
		registration.interceptors(webSocketInterceptor);
        
    }
}
