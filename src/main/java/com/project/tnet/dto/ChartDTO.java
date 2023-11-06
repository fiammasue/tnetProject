package com.project.tnet.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

@Data
@Builder
@NoArgsConstructor
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

}
