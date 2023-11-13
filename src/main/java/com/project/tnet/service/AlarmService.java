package com.project.tnet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.AlarmDAO;
import com.project.tnet.dto.Alarm;



@Service
public class AlarmService {
	
	@Autowired
	private AlarmDAO alarmDAO;
	
	public int insertAlarm(Alarm alarm) {
		return alarmDAO.insertAlarm(alarm);
		
	}
	
	//알람 상세보기
	public List<Alarm> alarmList(String nickName) throws Exception {
		System.out.println(">>>>>>>>>> 알림 서비스까지 잘오네~");
		// 로그인한 닉네임의 알람 조회
		List<Alarm> alarmList = alarmDAO.selectAllAlarmList(nickName);
		return alarmList;
	}
	
	public List<Alarm> selectByReceiver(Alarm alarm){
		return alarmDAO.selectByReceiver(alarm);
	}
	public int updateReadYn(Alarm alarm) {
		return alarmDAO.updateReadYn(alarm);
	}
}
