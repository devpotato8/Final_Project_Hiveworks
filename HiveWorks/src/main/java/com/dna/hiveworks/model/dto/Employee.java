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
 * - 작성자 : 김태하, 날짜 : 2024. 01. 02., 설명 : 필드수정
 * - 작성자 : 이재연, 날짜 : 2024. 01. 05., 설명 : serialVersionUID 부여
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee implements UserDetails{

	private static final long serialVersionUID = 4871475423514862553L;
	private int emp_no;
	private String dept_code;
	private String dept_name;
	private String dept_leader;
	private String position_code;
	private String position_name;
	private String job_code;
	private String job_name;
	private String work_type_code;
	private String work_status;
	private String work_pattern;
	private String aut_code;
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_phone;
	private String emp_cellphone;
	private String emp_email;
	private String emp_address;
	private String emp_resident_no;
	private String emp_birth_date;
	private String emp_memo;
	private String emp_hired_date;
	private String emp_retired_date;
	private String use_yn;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		
		auth.add(new SimpleGrantedAuthority(Authorities.USER.name()));
		if(emp_id.equals("admin")) {
			auth.add(new SimpleGrantedAuthority(Authorities.ADMIN.name()));
		}
		return auth;
	}

	@Override
	public String getUsername() {
		return this.emp_id;
	}
	
	@Override
	public String getPassword() {
		return this.emp_pw;
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
