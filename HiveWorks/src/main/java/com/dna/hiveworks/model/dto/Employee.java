package com.dna.hiveworks.model.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.dna.hiveworks.common.Authorities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2023. 12. 28.
 * Description : 직원정보 DTO
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 12. 28., 설명 : 최초작성
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee implements UserDetails{

	private String empId;
	private String empPw;
	private String empName;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		
		auth.add(new SimpleGrantedAuthority(Authorities.USER.name()));
		if(empId.equals("admin")) {
			auth.add(new SimpleGrantedAuthority(Authorities.ADMIN.name()));
		}
		return auth;
	}

	@Override
	public String getUsername() {
		return this.empId;
	}
	
	@Override
	public String getPassword() {
		return this.empPw;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}

	
	
	
	
}
