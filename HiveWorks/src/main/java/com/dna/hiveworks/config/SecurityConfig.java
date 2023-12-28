package com.dna.hiveworks.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception{
		
		return http
				.csrf(csrf->csrf.disable())
				.authorizeHttpRequests(request->{
					request.requestMatchers("/").permitAll()
							.requestMatchers("/WEB-INF/views/**").permitAll()
							.requestMatchers("/resources/**").permitAll();
				}).formLogin(formlogin->{
					formlogin.loginProcessingUrl("/login")
							.loginPage("/MyloginPage")
//							.failureForwardUrl("/loginfail")
//							.successForwardUrl("/loginsuccess")
							.permitAll();
				})
				.build();
	}
}
