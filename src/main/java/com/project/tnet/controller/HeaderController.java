package com.project.tnet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value = "/header")
	public Map<String, Object> header(Authentication authentication) throws Exception {
		System.out.println(">>>>헤더컨트롤러 여기까지 잘왔네 ");
		Map<String, Object> map = new HashMap<String, Object>();
	
		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
				MemberVO memberVO = principalDetails.getUser();
				List<Alarm> listAlarm = alarmService.alarmList(memberVO.getNickName());
				System.out.println("memberVO = " + memberVO);
				map.put("status", true);
				map.put("listAlarm", listAlarm); 
			}
		}
		return map;
	}
}
