package com.project.tnet.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.ChatRoom;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.dto.Message;
import com.project.tnet.service.ChatRoomService;
import com.project.tnet.service.MessageService;



@Controller
public class ChatRoomController {
	@Autowired
	private ChatRoomService chatRoomService;
	@Autowired
	private MessageService messageService;
	
	
	
	@RequestMapping("/myPage/chatRoom")
	public String goToRoomList(Authentication authentication,HttpSession session , Model model, ChatRoom room) {
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			MemberVO member= (MemberVO)userDetails.getUser();
			room.setUser_id(member.getNickName());
			System.out.println("roomList => "+chatRoomService.selectRoomList(room));
			model.addAttribute("roomList", chatRoomService.selectRoomList(room));
			
		}
		return "myPage/myPage_chatRoom";
		
		
	}
	
	@ResponseBody
	@RequestMapping("/chat/createRoom")
	public Map<String, Object> createRoom(Authentication authentication,HttpSession session, @RequestBody ChatRoom chatRoom) {
		Map<String , Object> result = new HashMap<>();
		
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			MemberVO member= (MemberVO)userDetails.getUser();
			chatRoom.setSender(member.getNickName());
			
			
			if (chatRoom.getAgreeChat().equals("수락")) {
				
				
				result.put("bool", true);
				result.put("chatRoom",chatRoomService.createRoom(chatRoom));
				
				
			}
			else {
				ChatRoom value = chatRoomService.getRoom(chatRoom);
				
				result.put("exist", (value!=null));
				if (value != null) {
					result.put("roomInfo", chatRoomService.findRoomById(value.getRoom_id()));
					result.put("chatList",messageService.selectMessageList(value.getRoom_id()));
				}
				else {
					chatRoomService.createRoom(chatRoom);
					result.put("roomInfo", chatRoomService.getRoom(chatRoom));
				}
				
				
			}
		
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("/chat/enterRoom/{room_id}")
	public Map<String,Object> goToEnterRoom(Authentication authentication, @PathVariable(value="room_id") String roomId, Message message) {
		ChatRoom room = chatRoomService.findRoomById(roomId);
		Map<String,Object> result = new HashMap<>();
		
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			MemberVO member= (MemberVO)userDetails.getUser();
			message.setReceiver(member.getNickName());
			//읽음으로 변경
			messageService.updateReadCount(message);
			System.out.println("roomSender => "+room.getSender());
			System.out.println("nickName => "+ member.getNickName());
			//여기서 읽음 카운트 삭제 해야한다
			if (room.getSender().equals(member.getNickName())) {
				chatRoomService.updateSenderReadCountZero(roomId);
			}
			else {
				chatRoomService.updateReceiverReadCountZero(roomId);
			}
		}
		
		
		result.put("roomInfo", room);
		result.put("chatList",messageService.selectMessageList(roomId));
		return result;
	}
	
	//이거 구독할때 사용하는 줄 알았는데 전혀아니네 이거 없어도 돌아감;;
	@GetMapping("/chat/room/{room_id}")
	@ResponseBody
	public ChatRoom roomInfo(@PathVariable(value="room_id") String roomId) {
		//구독 신청을 할때 
	System.out.println("구독하러옴");
		return chatRoomService.findRoomById(roomId);
	}
	
	//구독이 발생했을때 처리하는 어노테이션을 이용한 채팅방 입장과 퇴장시의 입장자수 관리
//	@SubscribeMapping("/chatroom/{roomId}")
//	public void subEventProcess() {
//		System.out.println("구독하려왔음");
//	}
	
	
}
