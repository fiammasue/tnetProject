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
}
