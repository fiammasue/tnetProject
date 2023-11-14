package com.project.tnet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.ChatRoomDAO;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.ChatRoom;
import com.project.tnet.dto.Course;
import com.project.tnet.dto.Message;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService {
	
	private final ChatRoomDAO chatRoomDAO;
	private final SimpMessageSendingOperations messagingTemplate;
	private final BoardService boardService;
	private final MyPageService myPageService;
	
	//채팅방 생성
	public ChatRoom createRoom(ChatRoom room) {
		
		room.setRoom_id();
		
		
		if (room.getAgreeChat().equals("수락")) {
			Board board = Board.builder()
					.board_id(room.getBoard_id())
					.build();
			board = boardService.getBoard(board);
			room.setRoom_name("[수강]"+board.getGive_talent()+"&"+board.getReceive_talent());
			
			System.out.println("board = > " +board);
			
			Course course = Course.builder()
					.course_id(room.getCourse_id())
					.build();
			
			course = myPageService.getCoursebyId(course);
			
			System.out.println("course = > " +course);
			
			room.setReceiver(course.getApplyer_nickname());
			
			System.out.println("chatRoom = > " +room);
			
			
			System.out.println("room => "+room);
			
		}
		int result = chatRoomDAO.createRoom(room);
		if(result>0) {
			return room;
		}
		
		return room;
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
	//채팅방 번호로 room 검색
	public ChatRoom getRoombyRoomId(ChatRoom chatRoom) {
		return chatRoomDAO.getRoombyRoomId(chatRoom);
	}
	
}
