package com.project.tnet.dto;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Message {
	// 메시지 타입 : 입장, 채팅, 나가기, 알람, 수락요청
	public enum MessageType {
	      ENTER, TALK, LEAVE, ALARM, AGREE, AGREE_INVOLVE, REJECT_INVOLVE, COMPLETE_AGREE,COMPLETE_INVOLVE ,RETURN_WAITING
	}
	
	private MessageType type; // 메시지 타입
	private String type_string;
	private int message_id;
	private String message;
	private String read_yn;
	private Timestamp reg_date;
	private String sender;
	private String receiver;
	private String room_id;
	
	
	
}
