package com.project.tnet.dto;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
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
	private Date join_date;
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

	
	
	
	
	
	//페이징필드
	private int pageNo = 1;     // 현재 페이지 번호
	private int totalCount;     // 전체 건수 (건수가 있어야 페이지 계산함..)
	private int totalPageSize;  // 전체 페이지수 (계산된 페이지 개수)
	private int pageLength = 12;// 한 페이지당 보여줄 게시물 갯수(크기)
	private int navSize = 5;   // 페이지 하단에 출력되는 페이지의 항목수 (보통 10개씩 보여줌)
	private int navStart = 0;   // 페이지 하단에 출력되는 페이지 시작 번호 : NavStart = ((PageNo-1) / NavSize) * NavSize + 1
	private int navEnd = 0;     // 페이지 하단에 출력되는 페이지 끝 번호 : NavEnd = ((PageNo-1) / NavSize + 1) * NavSize
	private int startnum = 0;
	private int endnum = 0;
	
	// 페이징 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		//2. 전체 페이지 건수를 계산한다 
		totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
		
		//3. 페이지 네비게이터 시작 페이지를 계산한다
		navStart = ((pageNo - 1) / navSize) * navSize + 1;
		
		//4. 페이지 네비게이터 끝 페이지를 계산한다
		navEnd = ((pageNo - 1) / navSize + 1) * navSize;
		
		//5. 전체 페이지 보다 크면 전체 페이지 값을 변경한다
		if (navEnd >= totalPageSize) {
			navEnd = totalPageSize;
		}
		
	}
		
	// 한 페이지의 시작 숫자 (보통 1, 11, 21, 31 ... )
	public void getStartNo() { 
	
		startnum = (pageNo - 1) * pageLength + 1; 
	} //getStartNo
	
	// 한 페이지의 끝 숫자 (보통 10, 20, 30... 이랑 완전 끝 페이지임)
	public void getEndNo() { 
	
		endnum = pageNo * pageLength; 
	} //getEndNo
	
}



