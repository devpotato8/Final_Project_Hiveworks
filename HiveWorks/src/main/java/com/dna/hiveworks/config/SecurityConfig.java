package com.dna.hiveworks.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;

import com.dna.hiveworks.security.DBConnectionProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private DBConnectionProvider dbprovider;
	
	@Bean
	SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception{
	    return http.cors(cors -> cors.configurationSource(request -> new CorsConfiguration().applyPermitDefaultValues()))
	            .csrf(csrf->csrf.disable())
	            .authorizeHttpRequests(request->{
	                request.requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()
	                        .requestMatchers("/").permitAll()
	                        .requestMatchers("/WEB-INF/views/**").permitAll()
	                        .requestMatchers("/resources/**").permitAll()
	                        //.requestMatchers("/**").permitAll()
	                        .anyRequest().authenticated();
	            })
	            .formLogin(formlogin->{
	                formlogin.loginPage("/")
	                        .loginProcessingUrl("/loginend")
	                        .usernameParameter("emp_Id")
	                        .passwordParameter("emp_Pw")
	                        .failureUrl("/loginfail")
	                        .successForwardUrl("/login/index")
	                        .permitAll();
	            })
	            .logout(logout->logout.logoutUrl("/logout"))
	            .authenticationProvider(dbprovider)
	            .build();
	}
	
	
	@Bean
	BCryptPasswordEncoder encodePassword() {
		return new BCryptPasswordEncoder();
	}
	
	
	
	
}
