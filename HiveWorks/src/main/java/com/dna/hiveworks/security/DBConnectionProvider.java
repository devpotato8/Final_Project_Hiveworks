package com.dna.hiveworks.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.dna.hiveworks.model.dao.EmpDao;
import com.dna.hiveworks.model.dto.Employee;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class DBConnectionProvider implements AuthenticationProvider, UserDetailsService{
	
	private final EmpDao dao;
	private final SqlSession session;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String empId = authentication.getName();
		String empPw = (String)authentication.getCredentials();
		
		Employee loginEmp = dao.selectEmployeeById(session,empId);
		
		if(loginEmp==null||!encoder.matches(empPw,loginEmp.getEmp_pw())) {
			throw new BadCredentialsException("인증실패!");
		}
		
		return new UsernamePasswordAuthenticationToken(loginEmp, loginEmp.getEmp_pw(),loginEmp.getAuthorities());
	}

	@Override
	public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException{
		Employee loginEmp = dao.selectEmployeeById(session,username);
        if (loginEmp == null) {
            throw new UsernameNotFoundException(username);
        }
        return loginEmp;
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication) ||
				RememberMeAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
