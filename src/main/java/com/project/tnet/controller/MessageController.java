package com.project.tnet.controller;

import java.sql.Timestamp;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.project.tnet.dto.Alarm;
import com.project.tnet.dto.ChatRoom;
import com.project.tnet.dto.Message;
import com.project.tnet.dto.Message.MessageType;
import com.project.tnet.service.AlarmService;
import com.project.tnet.service.ChatRoomService;
import com.project.tnet.service.MessageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MessageController {
	
	private final MessageService messageService;
	private final ChatRoomService chatRoomService;
	private final AlarmService alarmService;
	private final SimpMessageSendingOperations messagingTemplate;
	
	@MessageMapping("/chat/message")
	public void message(Message message) {
		//헤더 설정
		SimpMessageHeaderAccessor headerAccessor = SimpMessageHeaderAccessor.create();
		headerAccessor.setNativeHeader("content-type", "application/json;charset=utf-8");
//		headerAccessor.setNativeHeader("content-length", message.getMessage().length());
//		byte[] messageBytes = message.getMessage().getBytes(StandardCharsets.UTF_8);
//		Map<String, Object> headers = new HashMap<>();
//		headers.put("content-length", messageBytes.length);
		
		// 수신한 메세지의 타입에 따라 처리할 과정을 넣어줘야할 것같음
		//현재시간을 나타내기
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		message.setReg_date(currentTimestamp);
		
		//입장 하면 접속자수 1증가
		if (MessageType.ENTER==message.getType() ) {
			
			System.out.println("입장 메세지를 통해서 접속자수를 조정한다.");
			
			chatRoomService.upToConnectedCountById(message);
			
			message.setType_string(MessageType.ENTER.name());
			
			messagingTemplate.convertAndSend("/sub/member/userId/"+message.getReceiver(),message,headerAccessor.getMessageHeaders());
			messagingTemplate.convertAndSend("/sub/member/userId/"+message.getSender(),message,headerAccessor.getMessageHeaders());
		} //퇴장하면 접속자수 1감소
		else if (MessageType.LEAVE==message.getType()) {
			
			System.out.println("퇴장 메세지를 통해서 접속자수를 조정한다.");
			
			chatRoomService.downToConnectedCountById(message);
			
			message.setType_string(MessageType.LEAVE.name());
			
			messagingTemplate.convertAndSend("/sub/member/userId/"+message.getReceiver(),message,headerAccessor.getMessageHeaders());
			messagingTemplate.convertAndSend("/sub/member/userId/"+message.getSender(),message,headerAccessor.getMessageHeaders());

		}
		//접속자수가 1이면 상대에게 알람을 그렇지 않으면 message를 보낸다.
		else {
			// message의 roomId로 채팅방가져오기
			ChatRoom room = chatRoomService.findRoomById(message.getRoom_id());
			System.out.println("접속한 채팅방의 회원 수 -> " + room);
			// 접속자수를가져와서 1이면 read_yn을 n으로 넣기 2이면 Y로 초기화한다.
			if (room.getConnected_count() == 1) {
				System.out.println("회원자수가 이만큼이 아니냥고");
				message.setRead_yn("N");
				Alarm alarm = Alarm.builder()
									.type_string(MessageType.ALARM.name())
									.contents(message.getMessage())
									.alarm_code("A01")
									.page_type("/page/chat")
									.receiver(message.getReceiver())
									.sender(message.getSender())
									.read_yn("N")
									.build();
//				if (room.getReceiver() == message.getSender()) {
//					alarm.setReceiver(room.getSender());
//					
//				}
				System.out.println("alarm -> "+ alarm);
				alarmService.insertAlarm(alarm);
				messagingTemplate.convertAndSend("/sub/member/userId/"+message.getReceiver(), alarm,headerAccessor.getMessageHeaders());
				messagingTemplate.convertAndSend("/sub/member/userId/"+message.getSender(),message,headerAccessor.getMessageHeaders());
			}
			else {
				message.setRead_yn("Y");
				// 메세지를 넣고 메시지 발송
				System.out.println("수신한 message : "+message);
				messagingTemplate.convertAndSend("/sub/member/userId/"+message.getReceiver(),message,headerAccessor.getMessageHeaders());
				messagingTemplate.convertAndSend("/sub/member/userId/"+message.getSender(),message,headerAccessor.getMessageHeaders());
			}
			//메세지 저장
			messageService.insertMessage(message);
		}

	}

}
