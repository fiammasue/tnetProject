package com.project.tnet.service;

import java.util.List;

import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.ChatRoomDAO;
import com.project.tnet.dto.ChatRoom;
import com.project.tnet.dto.Message;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService {
	
	private final ChatRoomDAO chatRoomDAO;
	private final SimpMessageSendingOperations messagingTemplate;
	
	//채팅방 생성
	public ChatRoom createRoom(ChatRoom room) {
		
		room.setRoom_id();
		int result = chatRoomDAO.createRoom(room);
		if(result>0) {
			return room;
		}
		
		return null;
	}
	//채팅방 삭제
	public int deleteRoom(ChatRoom room) {
		return chatRoomDAO.deleteRoom(room);
	}
	//채팅방 목록 불러오기
	public List<ChatRoom> selectRoomList(ChatRoom room){
		return chatRoomDAO.selectRoomList(room);
	}
	//채팅방 하나의 정보 불러오기
	public ChatRoom findRoomById(String roomId) {
		// TODO Auto-generated method stub
	
		return chatRoomDAO.findRoomById(roomId);
	}
	//이거 두개로 합치고 mapper에서 if 문써서 동적쿼리하고싶다.
	//채팅방의 접속자수 조정 상승
	public int upToConnectedCountById(Message message) {
		return chatRoomDAO.upToConnectedCountById(message);
	}
	//채팅방의 접속자수 조정 감소
	public int downToConnectedCountById(Message message) {
		return chatRoomDAO.downToConnectedCountById(message);
	}
	public ChatRoom getRoom(ChatRoom chatRoom) {
		return chatRoomDAO.getRoom(chatRoom);
	}
	
}
