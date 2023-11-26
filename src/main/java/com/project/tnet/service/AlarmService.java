package com.project.tnet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int insertAlarmChat(Alarm alarm) {
		return alarmDAO.insertAlarmChat(alarm);
	}
	
	//알람 상세보기
	public List<Alarm> alarmList(String nickName) throws Exception {
		System.out.println(">>>>>>>>>> 알림 서비스까지 잘오네~");
		// 로그인한 닉네임의 알람 조회
		List<Alarm> alarmList = alarmDAO.selectAllAlarmList(nickName);
		return alarmList;
	}
	
	//진행상황 상세보기
	public List<Alarm> progressList(String nickName) throws Exception {
		System.out.println(">>>>>>>>>> 진행상황 서비스까지 잘오네~");
		// 로그인한 닉네임의 알람 조회
		List<Alarm> listProgress = alarmDAO.selectAllProgressList(nickName);
		return listProgress;
	}
	
	public List<Alarm> selectByReceiver(Alarm alarm){
		return alarmDAO.selectByReceiver(alarm);
	}
	
	//헤더 알람창의 채팅메시지를 선택삭제한다.
	public Map<String, Object> updateReadYn(Alarm alarm) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rowCount = alarmDAO.updateReadYn(alarm);
		
		if (rowCount > 0) {
			map.put("status", true);
			map.put("message", "채팅글이 삭제되었습니다");
			map.put("alarmId", alarm.getAlarm_id());
		}else {
			map.put("status", false);
			map.put("message", "채팅글 삭제시 오류가 발생하였습니다");
		}
		
		return map;
	}

	//헤더 알람창의 채팅메시지를 전부 읽음처리한다.
	public void updateAllReadYn(String nickName) {
		alarmDAO.updateAllReadYn(nickName);
	}
	
	//진행상황 알람창의 채팅메시지를 전부 읽음처리한다.
	public void updateAllProgressReadYn(String nickName) {
		alarmDAO.updateAllProgressReadYn(nickName);
	}
	
	
	//헤더 알람창의 채팅메시지를 전부삭제한다.
	public Map<String, Object> updateAllDeleteYn(String nickName) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rowCount = alarmDAO.updateAllDeleteYn(nickName);
		
		if (rowCount > 0) {
			map.put("status", true);
			map.put("message", "채팅글이 전부 삭제되었습니다");
		}else {
			map.put("status", false);
			map.put("message", "채팅글 삭제시 오류가 발생하였습니다");
		}
		
		return map;
	}
	
	//진행상황 알람창의 채팅메시지를 전부삭제한다.
	public Map<String, Object> updateAllProgressDeleteYn(String nickName) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rowCount = alarmDAO.updateAllProgressDeleteYn(nickName);
		
		if (rowCount > 0) {
			map.put("status", true);
			map.put("message", "진행상황이 전부 삭제되었습니다");
		}else {
			map.put("status", false);
			map.put("message", "진행상황이 삭제시 오류가 발생하였습니다");
		}
		
		return map;
	}
	
	public Map<String, Object> deleteAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return null;
	}

	// Alarm 데이터가 존재하는지 확인
	public boolean isAlarmDataExists(String nickName) {
		// 예를 들어, Alarm 테이블에서 데이터가 있는지 확인하는 코드를 작성합니다.
        // 결과에 따라 true 또는 false를 반환합니다.
		 return alarmDAO.isAlarmDataExists(nickName) > 0;
	}
	
	//입력한 alarm 데이터 가져오기
	public Alarm selectChatAlarm(Alarm alarm) {
		return alarmDAO.selectChatAlarm(alarm);
	}
	public Alarm selectProAlarmId(Alarm alarm) {
		// TODO Auto-generated method stub
		return alarmDAO.selectProAlarmId(alarm);
	}
}
