package com.project.tnet.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
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

	private String district_code;
	private String city_code;
	private String delete_yn;
	private String gender;
	private String high_code;
	
	private String give_talent;		
	private String receive_talent;
	private String city_name;
	private String district_name;
	private String low_code;
	

	private String givetalent; //  주는재능 이름
	private String receivetalent; // 받는 재능 이름
	private String cityname; // 도시이름
	private String districtname; // 구이름
	private String status; // 상태 이름
	
	private String searchWord; // 검색할 글자
	private String search_kind;// 검색종류
	
	//페이징
	private int pageNo = 1; //현재 페이지 번호
	private int totalCount; // 전체건수
	private int totalPageSize; // 전체 페이지 수
	private int pageLength = 12; // 한페이지의 길이
	private int navSize = 5; //페이지 하단에 출력되는 페이지의 항목수
	private int navStart = 0; //페이지 하단에 출력되는 페이지 시작번호
	private int navEnd = 0; // 페이지 하단에 출력되는 페이지 끝 번호
	
	private int startnum = 0;
	private int endnum = 0;
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//페이지 건수 계산
		totalPageSize = (int) Math.ceil((double) totalCount/ pageLength);
		//페이지 네비게이터 시작 페이지를 계산한다.
		navStart = ((pageNo - 1)/ navSize)* navSize +1;
		//페이지 네비게이터 끝 페이지를 계산한다.
		navEnd = ((pageNo-1)/navSize + 1)* navSize;
		//전체 페이지보다 크면 전체 페이지값으로 변경한다.
		if(navEnd >= totalPageSize) {
			navEnd = totalPageSize;
		}
	}
	//게시글 네비게이터의 처음 시작 번호
	public int getStartNo() {
		startnum = (pageNo - 1) * pageLength + 1; 
		return (pageNo - 1) * pageLength + 1;
	}
	//게시글 네비게이터의 마지막 번호
	public int getEndNo() {
		endnum = pageNo * pageLength; 
		return pageNo * pageLength;
	}

	
	
}
