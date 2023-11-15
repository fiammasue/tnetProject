package com.project.tnet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.service.AlarmService;

@Controller
public class MainController {
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("/")
	public String main(Authentication authentication, Model model) {

		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
				MemberVO memberVO = principalDetails.getUser();
				System.out.println("memberVO = " + memberVO);
				
				// Alarm 데이터가 존재하는지 확인
		        boolean isAlarmDataExists = alarmService.isAlarmDataExists(memberVO.getNickName());
		        model.addAttribute("isAlarmDataExists", isAlarmDataExists);
			}
		}
		return "index";
	}

	@RequestMapping("/notice/list")
	public String noticeList() {
		return "notice/noticeList";
	}

	
	
	@RequestMapping("/notice/detail")
	public String noticeDetail() {
		return "notice/noticeDetail";
	}
	@RequestMapping("/notice/revise")
	public String noticeRevise() {
		return "notice/noticeRevise";
	}
	@RequestMapping("/notice/write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping("/myPage/userInfo")
	public String myPage_userInfo() {
		return "myPage/myPage_userInfo";
	}
	@RequestMapping("/myPage/calendar")
	public String myPage_calendar() {
		return "myPage/myPage_calendar";
	}
//	@RequestMapping("/myPage/chatRoom")
//	public String myPage_chatRoom() {
//		return "myPage/myPage_chatRoom";
//	}
	

	

	
	


}
