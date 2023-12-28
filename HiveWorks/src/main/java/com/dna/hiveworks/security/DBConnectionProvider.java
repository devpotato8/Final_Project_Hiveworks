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
		System.out.println("dao:"+dao);
		System.out.println("session:"+session);
		
		String empId = authentication.getName();
		String empPw = (String)authentication.getCredentials();
		System.out.println(empId);
		System.out.println(empPw);
		Employee loginEmp = dao.selectEmployeeById(session,empId);
		System.out.println(loginEmp);
		if(loginEmp== null||!loginEmp.getEmpPw().equals(empPw)) {
			throw new BadCredentialsException("인증실패!");
		}
		
//		if(loginEmp==null||!encoder.matches(empPw,loginEmp.getEmpPw())) {
//			throw new BadCredentialsException("인증실패!");
//		}
		return new UsernamePasswordAuthenticationToken(loginEmp, loginEmp.getEmpPw(),loginEmp.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
