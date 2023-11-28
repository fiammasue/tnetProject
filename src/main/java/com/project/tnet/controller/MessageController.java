package com.project.tnet.controller;

import java.sql.Timestamp;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.project.tnet.dto.Alarm;
import com.project.tnet.dto.ChatRoom;
import com.project.tnet.dto.Course;
import com.project.tnet.dto.Message;
import com.project.tnet.dto.Message.MessageType;
import com.project.tnet.service.AlarmService;
import com.project.tnet.service.ChatRoomService;
import com.project.tnet.service.CourseService;
import com.project.tnet.service.MessageService;
import com.project.tnet.service.MyPageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MessageController {
	
	private final MessageService messageService;
	private final ChatRoomService chatRoomService;
	private final AlarmService alarmService;
	private final SimpMessageSendingOperations messagingTemplate;
	private final MyPageService myPageService;
	private final CourseService courseService;
	
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
			
			ChatRoom room = ChatRoom.builder()
									.room_id(message.getRoom_id())
									.build();
			//sender와 receiver를 가져오기 위해 채팅방정보를 가져옴
			room = chatRoomService.getRoombyRoomId(room);
		
			
			message.setType_string(MessageType.ENTER.name());
			System.out.println("message => "+ message);
			
			messagingTemplate.convertAndSend("/sub/member/userId/"+room.getReceiver(),message,headerAccessor.getMessageHeaders());
			messagingTemplate.convertAndSend("/sub/member/userId/"+room.getSender(),message,headerAccessor.getMessageHeaders());
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
									.page_type("/myPage/chatRoom")
									.receiver(message.getReceiver())
									.sender(message.getSender())
									.read_yn("N")
									.room_id(message.getRoom_id())
									.build();
				int flag = 0;
				//안읽음 표시
				if(room.getReceiver().equals(message.getReceiver())) {
					chatRoomService.updateNotReceiverReadCount(message.getRoom_id());
					flag = 1;
					System.out.println("Receiver => 여기만 지나가나 ? "+ flag);
				}
				else {
					chatRoomService.updateNotSenderReadCount(message.getRoom_id());
				}
				room = chatRoomService.findRoomById(message.getRoom_id());
				// 안읽은 갯수 숫자 알람에 저장
				if(flag == 1) {
					alarm.setReceiver_count(room.getReceiver_count());
				}
				else {
					alarm.setReceiver_count(room.getSender_count());
				}
				
				System.out.println("alarm -> "+ alarm);
				alarmService.insertAlarmChat(alarm);
				Alarm result = alarmService.selectChatAlarm(alarm);
				result.setAlarm_code(MessageType.ALARM.name());
				messagingTemplate.convertAndSend("/sub/member/userId/"+message.getReceiver(), result,headerAccessor.getMessageHeaders());
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
	
	@MessageMapping("/join/course")
	public void joinCourse(Course course) {
		//수강신청에 대한 알람도 가야하고 
		Alarm alarm = Alarm.builder()
				.type_string(MessageType.ALARM.name())
				.contents("재능기부 수락 요청이 왔습니다.")
				.alarm_code("A03")
				.page_type("/myPage/proceeding.do")
				.receiver(course.getWriter_nickname())
				.sender(course.getApplyer_nickname())
				.board_id(course.getBoard_id())
				.read_yn("N")
				.build();
		alarmService.insertAlarm(alarm);
		Alarm result = alarmService.selectProAlarmId(alarm);
		result.setAlarm_code(MessageType.ALARM.name());
		messagingTemplate.convertAndSend("/sub/member/userId/"+course.getWriter_nickname(),result);
		
		System.out.println("Message Controller -> "+ course);
		//수강신청에 태그도 추가 해야함
		
		course = myPageService.getCourse(course);
		course.setType_string(MessageType.AGREE.name());
		System.out.println("coutseeddf -> "+myPageService.getCourse(course));
		messagingTemplate.convertAndSend("/sub/member/userId/"+course.getWriter_nickname(),course);
	}
	
	@MessageMapping("/join/agree")
	public void joinAgree(Alarm alarm) {
		//수강신청 동의를 하면 수강알람도 가야하고 
		Alarm result = Alarm.builder()
				.type_string(MessageType.ALARM.name())
				.contents("재능 교환이 진행됩니다.")
				.alarm_code("A06")
				.page_type("/myPage/course_proceeding")
				.receiver(alarm.getReceiver())//무조건상대방
				.sender(alarm.getSender())//무조건 글작성자
				.board_id(alarm.getBoard_id())
				.read_yn("N")
				.build();
		alarmService.insertAlarm(result);
		System.out.println("result ------>" + result);
		Alarm result1 = alarmService.selectProAlarmId(result);
		result1.setAlarm_code(MessageType.ALARM.name());
		messagingTemplate.convertAndSend("/sub/member/userId/"+alarm.getReceiver(),result1);
		
		//courseID도 같이 넘어가야함
		Course course = Course.builder()
								.writer_nickname(alarm.getSender())
								.course_id(alarm.getCourse_id())
								.build();
		
		course = myPageService.getCourseAgreeInvolve(course);
		System.out.println("courseMessage -> "+course);
		course.setType_string(MessageType.AGREE_INVOLVE.name());
		//상대방에게 전달
		messagingTemplate.convertAndSend("/sub/member/userId/"+alarm.getReceiver(),course);
		
		
	}
	//완료신청
	@MessageMapping("/complete/courseAgree")
	public void courseAgree(Alarm alarm) {
		//courseID도 같이 넘어가야함
		Course course = Course.builder()
				.writer_nickname(alarm.getSender())
				.course_id(alarm.getCourse_id())
				.build();
		course = myPageService.getCourseCompleteAgree(course);
		course.setType_string(MessageType.COMPLETE_AGREE.name());
		
		Alarm result = Alarm.builder()
				.type_string(MessageType.ALARM.name())
				.contents("재능교환 완료 요청이 왔습니다.")
				.alarm_code("A02")
				.page_type("/myPage/course_proceeding")
				.sender(alarm.getSender())//무조건 완료신청자
				.board_id(alarm.getBoard_id())
				.read_yn("N")
				.build();
		//완료 받는사람
		if (course.getApplyer_nickname().equals(alarm.getSender())) {
			result.setReceiver(course.getWriter_nickname());
		}
		else {
			result.setReceiver(course.getApplyer_nickname());
		}
		alarmService.insertAlarm(result);
		Alarm result1 = alarmService.selectProAlarmId(result);
		result1.setAlarm_code(MessageType.ALARM.name());
		//상대방에게 전달
		messagingTemplate.convertAndSend("/sub/member/userId/"+result.getReceiver(),course);//c출력할건을전달
		messagingTemplate.convertAndSend("/sub/member/userId/"+result.getReceiver(),result1);//알람
		
	}
	//완료
	@MessageMapping("/complete/courseInvolve")
	public void courseInvolve(Alarm alarm) {
		System.out.println("courseInvolve  - -  alarm : "+ alarm);
		//courseID도 같이 넘어가야함
		Course param = Course.builder()
				.writer_nickname(alarm.getSender())
				.course_id(alarm.getCourse_id())
				.build();
		System.out.println("alarm -----> "+ alarm);
		Course course = myPageService.getCourseCompleteInvolve(param);
		course.setType_string(MessageType.COMPLETE_INVOLVE.name());
		
		Alarm result = Alarm.builder()
				.type_string(MessageType.ALARM.name())
				.contents("재능교환 완료 요청이 왔습니다.")
				.alarm_code("A07")
				.page_type("/myPage/course_proceeding")
				.sender(alarm.getSender())//무조건 글작성자
				.board_id(alarm.getBoard_id())
				.read_yn("N")
				.build();
		if (course.getApplyer_nickname().equals(alarm.getSender())) {
			result.setReceiver(course.getWriter_nickname());
		}
		else {
			result.setReceiver(course.getApplyer_nickname());
		}
		alarmService.insertAlarm(result);
		Alarm result1 = alarmService.selectProAlarmId(result);
		result1.setAlarm_code(MessageType.ALARM.name());
		//상대방에게 전달
		messagingTemplate.convertAndSend("/sub/member/userId/"+result.getReceiver(),course);//출력할건을전달
		messagingTemplate.convertAndSend("/sub/member/userId/"+result.getReceiver(),result1);//알람
	}

}
