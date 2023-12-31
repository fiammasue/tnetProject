package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.ChatRoom;
import com.project.tnet.dto.Message;



@Mapper
public interface ChatRoomDAO {
	
	//채팅방생성
	public int createRoom(ChatRoom room);
	//채팅방 삭제
	public int deleteRoom(ChatRoom room);
	//채팅방 목록 불러오기
	public List<ChatRoom> selectRoomList(ChatRoom room);
	//채팅방 하나의 정보 불러오기
	public ChatRoom findRoomById(String roomId);
	//채팅방의 접속자수 줄이기
	public int downToConnectedCountById(Message message);
	//채팅방의 접속자수 늘리기
	public int upToConnectedCountById(Message message);
	//채팅방이 존재하는지 확인
	public ChatRoom getRoom(ChatRoom chatRoom);
	//채팅방아이디로 하나 찾아오기
	public ChatRoom getRoombyRoomId(ChatRoom chatRoom);
	//안읽음 갯수 Receiver 하나씩 올리기
	public int updateNotReceiverReadCount(String room_id);
	//안읽음 갯수 Sender 하나씩 올리기
	public int updateNotSenderReadCount(String room_id);
	//안읽음 갯수 Sender count를 0으로 변경함
	public int updateSenderReadCountZero(String room_id);
	//안읽음 갯수 Receiver count를 0으로 변경함
	public int updateReceiverReadCountZero(String room_id);
}
