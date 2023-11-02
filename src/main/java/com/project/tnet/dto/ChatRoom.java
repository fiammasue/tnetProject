package com.project.tnet.dto;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {
	private String room_id;
	private String room_name;
	private String receiver;
	private String sender;
	private int board_id;
	
	public String setRoom_id() {
		room_id = UUID.randomUUID().toString();
		return room_id;
		
	}
}
