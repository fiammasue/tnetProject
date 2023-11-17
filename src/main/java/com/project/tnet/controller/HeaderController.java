package com.project.tnet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.Alarm;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.service.AlarmService;

@Controller
public class HeaderController {
	@Autowired
	private AlarmService alarmService;
	
	@ResponseBody
	@RequestMapping(value = "/header/alarmSelect")
	public Map<String, Object> header(Authentication authentication) throws Exception {
		System.out.println(">>>>헤더컨트롤러 여기까지 잘왔네 ");
		Map<String, Object> map = new HashMap<String, Object>();
	
		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
				MemberVO memberVO = principalDetails.getUser();
				List<Alarm> listAlarm = alarmService.alarmList(memberVO.getNickName());
				List<Alarm> listProgress = alarmService.progressList(memberVO.getNickName());
				
				// 알림배지 New를 안보이게 하기위한 비지니스로직				
				alarmService.updateAllReadYn(memberVO.getNickName());
				alarmService.updateAllProgressReadYn(memberVO.getNickName());
				System.out.println("memberVO = " +  memberVO);
				map.put("status", true);
				map.put("listAlarm", listAlarm); 
				map.put("listProgress", listProgress); 
			}
		}
		return map;
	}
	
	// 알람채팅 삭제	
	@ResponseBody
	@RequestMapping(value = "/header/alarmDelete")
	public Map<String, Object> alarmDelete(Authentication authentication, @RequestBody Alarm alarm) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();
		
    	if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
		    	map = alarmService.updateReadYn(alarm);
				System.out.println(alarm.getAlarm_id());
			}
		}
    	
		return map;
	}
	
	// 모든 채팅알람 삭제	
	@ResponseBody
	@RequestMapping(value = "/header/allAlarmDelete")
	public Map<String, Object> allAlarmDelete(Authentication authentication) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
				MemberVO memberVO = principalDetails.getUser();
				map = alarmService.updateAllDeleteYn(memberVO.getNickName());
			}
		}
		
		return map;
	}
	
	// 모든 진행상황알람 삭제	
	@ResponseBody
	@RequestMapping(value = "/header/allProgressDelete")
	public Map<String, Object> allProgressDelete(Authentication authentication) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
				MemberVO memberVO = principalDetails.getUser();
				map = alarmService.updateAllProgressDeleteYn(memberVO.getNickName());
			}
		}
		
		return map;
	}
}
