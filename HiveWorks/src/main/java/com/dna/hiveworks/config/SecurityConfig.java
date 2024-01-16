package com.dna.hiveworks.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.dna.hiveworks.security.DBConnectionProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private DBConnectionProvider dbprovider;
	
	@Bean
	SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception{
		return http.csrf(csrf->csrf.disable())
				.authorizeHttpRequests(request->{
					request.requestMatchers("/").permitAll()
							.requestMatchers("/WEB-INF/views/**").permitAll()
							.requestMatchers("/resources/**").permitAll()
							.requestMatchers("/**").permitAll();
				})
				.formLogin(formlogin->{
					formlogin.loginPage("/MyLoginPage")
							.usernameParameter("emp_Id")
							.passwordParameter("emp_Pw")
							.loginProcessingUrl("/loginend")
							.failureForwardUrl("/loginfail")
							.successForwardUrl("/login/index")
							.permitAll();
				})
				.logout(logout->logout.logoutUrl("/logout"))
				.authenticationProvider(dbprovider)
				.build();
	}
	
	
	@Bean
	public BCryptPasswordEncoder encodePassword() {
		return new BCryptPasswordEncoder();
	}
	
	
	
	
}
