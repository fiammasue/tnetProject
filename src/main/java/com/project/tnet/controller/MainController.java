package com.project.tnet.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/myPage/course_proceeding")
	public String myPage_course_proceeding() {
		return "myPage/myPage_course_proceeding";
	}
	@RequestMapping("/myPage/course_recruiting")
	public String myPage_course_recruiting() {
		return "myPage/myPage_course_recruiting";
	}
	@RequestMapping("/myPage/calendar")
	public String myPage_calendar() {
		return "myPage/myPage_calendar";
	}
	@RequestMapping("/myPage/chatRoom")
	public String myPage_chatRoom() {
		return "myPage/myPage_chatRoom";
	}
	
	// 관리자 로그인 페이지
	@RequestMapping("/admin/loginform")
	public String admin_login() {
		return "admin/adminLogin";
	}
	
	// 관리자 대시 보드 페이지
	@RequestMapping("/admin/home")
	public String admin() {
		return "admin/dashboard";
	}	
	
	//관리자 게시판 목록 페이지
	@RequestMapping("/admin/boardlist")
	public String admin_boardlist() {
		return "admin/board-list";
	}
	
	//관리자 공지사항 목록 페이지
	@RequestMapping("/admin/noticelist")
	public String admin_noticelist() {
		return "admin/notice-list";
	}
	
	//관리자 회원관리 페이지
	@RequestMapping("/admin/memberlist")
	public String admin_memberlist() {
		return "admin/memberlist";
	}	
	
}
