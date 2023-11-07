package com.project.tnet.dto;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

@Data
@Builder
@AllArgsConstructor // 글쓰기
public class ChartDTO {
	 private String user_name;
	 private String  gender;
	 private int age;
//	 private String give_talent;
	 private String low_name;       //받고싶은 재능 소분류 이름
	 private int count;             //연령대별 받고싶은 재능 개수
	 private String age_group; 
	 private String line_year;
	 private int total_user;        //년도별 유저수
	 private int completed_class;   //년도별 완료된 수업의 갯수
	 private String chart_kind;
	 private String gender_group;
	 private String start_date;     // 기간조회할때
	 private String end_date;	    // 기간조회할때
	 private String count_kind;      // 기간조회종류
	 
//  일단 필요없음	
//	 private int completed;         // 완료된 수업갯수
//	 private int inprogress;        // 진행중인 수업갯수
//	 private int donationking;      // 기부왕
	 
	 public ChartDTO() {
	        Calendar calendar = Calendar.getInstance();
	        int year = calendar.get(Calendar.YEAR);

	        // 기본값 설정
	        start_date = year + "-01-01";
	        end_date = year + "-12-31";
	    }

}
