package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.Alarm;



@Mapper
public interface AlarmDAO {
	//알람을 DB에 전달
	//멤버테이블과 연관 ***
	public int insertAlarm(Alarm alarm);
	public int insertAlarmChat(Alarm alarm);
	
	// 로그인한 nickName에 존재하는 모든 알람조회 
	List<Alarm> selectAllAlarmList(String nickName) throws Exception;
		
	//로그인 유저의 알람을 검색
	public List<Alarm> selectByReceiver(Alarm alarm);
	//유저가 알람을 확인하면 모두 확인으로 읽음 여부를 변경한다.
	//멤버 테이블과 연관 **
	public int updateReadYn(Alarm alarm);

	public int updateAllReadYn(String nickName);
	
	public int updateAllProgressReadYn(String nickName);
	
	public int updateAllDeleteYn(String nickName);
	
	public int updateAllProgressDeleteYn(String nickName);
	
	// Alarm 데이터가 존재하는지 확인
	public int isAlarmDataExists(String nickName);

	// 로그인한 nickName에 존재하는 모든 진행상황조회
	public List<Alarm> selectAllProgressList(String nickName);
	
	//입력한 alarm 데이터 채팅방명을 포함하여 가져오기
	public Alarm selectChatAlarm(Alarm alarm);
	//입력한 alarm데이터를 게시판글명을 포함하여 가져오기
	public Alarm selectProAlarmId(Alarm alarm);
}
