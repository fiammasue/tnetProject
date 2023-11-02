package com.project.tnet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.tnet.dto.ChatRoom;
import com.project.tnet.service.ChatRoomService;

@Controller
public class ChatRoomController {
	@Autowired
	private ChatRoomService chatRoomService;
	
	
	@RequestMapping("/chat/createRoom")
	public ChatRoom createRoom(HttpSession session, ChatRoom chatRoom) {
		return chatRoom;
	}
}
