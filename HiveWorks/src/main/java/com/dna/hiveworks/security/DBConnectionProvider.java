package com.dna.hiveworks.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.dna.hiveworks.model.dao.EmpDao;
import com.dna.hiveworks.model.dto.Employee;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class DBConnectionProvider implements AuthenticationProvider{
	
	private final EmpDao dao;
	private final SqlSession session;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String empId = authentication.getName();
		String empPw = (String)authentication.getCredentials();
		
		Employee loginEmp = dao.selectEmployeeById(session,empId);
		
		//DB 완성 이후에 BCrypt이용해서 pw 재설정한 더미데이터 삽입 후 이용할 로직
		if(loginEmp==null||!encoder.matches(empPw,loginEmp.getEmp_pw())) {
			throw new BadCredentialsException("인증실패!");
		}
		return new UsernamePasswordAuthenticationToken(loginEmp, loginEmp.getEmp_pw(),loginEmp.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
