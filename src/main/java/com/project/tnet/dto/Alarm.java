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
public class Alarm {
	
	private MessageType type;
	private String type_string;
	private int alarm_id;
	private String contents;
	private String alarm_code;
	private String page_type;
	private String receiver;
	private String sender;
	private String read_yn;
	private String delete_yn;
	private Date reg_date;
	private String room_id;		//채팅방의 방번호
	private String room_name;	//채팅방 이름
	private String printDate;	
	private int receiver_count;	
	private int course_id;//수강신청번호
	private int board_id;//게시글 번호
	private String title;//게시글 제목	
	
}
