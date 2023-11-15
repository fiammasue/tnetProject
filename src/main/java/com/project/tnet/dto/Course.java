package com.project.tnet.dto;

import java.sql.Date;

import com.project.tnet.dto.Message.MessageType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Course {

	private MessageType type;
	private String type_string;
	private int course_id;
	private int board_id; 	
	private String title;
	private String writer_nickname;
	private String applyer_nickname;		
	private String give_talent;
	private String receive_talent;
	private String status_code;
	private String writer_status_code;
	private String applyer_status_code;	
	private Date start_date;
	
}
