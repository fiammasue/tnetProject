package com.project.tnet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.MessageDAO;
import com.project.tnet.dto.Message;



@Service
public class MessageService {
	
	@Autowired
	private MessageDAO messageDAO;
	
	public Message insertMessage(Message message) {
		messageDAO.insertMessage(message);
		return message;
	}
	public List<Message> selectMessageList(String room_id){
		Message message = new Message();
		message.setRoom_id(room_id);
		
		return messageDAO.selectMessageList(message);
	}
	public int updateReadCount(Message message) {
		return messageDAO.updateReadCount(message);
	}
}
