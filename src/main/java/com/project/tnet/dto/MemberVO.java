package com.project.tnet.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO{
	
	private String nickName;
	public String profileImage;	//추가해야한다.
	private String email;
	private String pwd;
	private String oauth;
	private String age;
	private String phoneNum;
	private String gender;
	private int temperature;
	private String role;
	private int complain;
	private LocalDateTime joinDate;
	private LocalDateTime lastLoginTime;
	private String accountExpired;
	private String accountLocked;
	private int loginCount;
	private int existAlarm;
	private String age_range;
	
	// ENUM으로 안하고 ,로 해서 구분해서 ROLE을 입력 -> 그걸 파싱!!
	// 예제 ROLL 값 : "ROLE_USER","ROLE_MANAGER","ROLE_ADMIN"  
	public List<String> getRoleList() {
	    if (this.role.length() > 0) {
	        return Arrays.asList(this.role.split(","));
	    }
	    return new ArrayList<>();
	}

}



