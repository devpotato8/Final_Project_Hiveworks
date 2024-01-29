package com.dna.hiveworks.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : WebMVC Config 설정
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

@Configuration
public class WebMVCConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 인터셉터등록할 때 사용
		WebMvcConfigurer.super.addInterceptors(registry);
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// 단순 view 연결할때 사용
		WebMvcConfigurer.super.addViewControllers(registry);
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		// web.hiveworks.site로부터 들어오는 데이터 허용
		registry.addMapping("/**").allowedOrigins("http://web.hiveworks.site");
	}
}
