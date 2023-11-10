package com.project.tnet.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.project.tnet.dto.ChartDTO;
import com.project.tnet.service.ChartService;
import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.MemberVO;

@Controller
public class MainController {
	@RequestMapping("/")
	public String main(Authentication authentication) {

		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
			System.out.println("PrincipalDetails = " + principalDetails);
			if (principalDetails.getUser() != null) {
				MemberVO memberVO = principalDetails.getUser();
				System.out.println("memberVO = " + memberVO);
				
			}
		}
		return "index";
	}
	@RequestMapping("/board/list")
	public String boardList() {
		return "board/boardList";
	}
	@RequestMapping("/notice/list")
	public String noticeList() {
		return "notice/noticeList";
	}
	@RequestMapping("/board/detail")
	public String boardDetail() {
		return "board/boardDetail";
	}
	@RequestMapping("/board/revise")
	public String boardRevise() {
		return "board/boardRevise";
	}
	@RequestMapping("/board/write")
	public String boardWrite() {
		return "board/boardWrite";
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
