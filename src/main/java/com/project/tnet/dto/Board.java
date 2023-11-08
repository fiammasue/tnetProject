package com.project.tnet.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int board_id; 			
	private String title;		
	private String contents;		
	private String writer_nickname;
	private int read_count;		
	private Date register_date;		
	private Date update_date;		
	private String status_code;
	private int district_code;
	private int city_code;
	private String give_talent;		
	private String receive_talent;
	private String delete_yn;
	
	private String givtalent; //  주는재능 이름
	private String cityname; // 도시이름
	private String recivetalent; // 받는 재능 이름
	private String STATUS_CONTENTS; // 상태 이름
	
	//페이징필드
	private int pageNo = 1;     // 현재 페이지 번호
	private int totalCount;     // 전체 건수 (건수가 있어야 페이지 계산함..)
	private int totalPageSize;  // 전체 페이지수 (계산된 페이지 개수)
	private int pageLength = 10;// 한 페이지당 보여줄 게시물 갯수(크기)
	private int navSize = 10;   // 페이지 하단에 출력되는 페이지의 항목수 (보통 10개씩 보여줌)
	private int navStart = 0;   // 페이지 하단에 출력되는 페이지 시작 번호 : NavStart = ((PageNo-1) / NavSize) * NavSize + 1
	private int navEnd = 0;     // 페이지 하단에 출력되는 페이지 끝 번호 : NavEnd = ((PageNo-1) / NavSize + 1) * NavSize
	private int startnum = 0;
	private int endnum = 0;
	
	
	// 글 작성 시 엔터키 역할 해주는 메서드
	public String getContentsHTML() {
		return contents.replace("\n", "<br/>");
	}
	
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
