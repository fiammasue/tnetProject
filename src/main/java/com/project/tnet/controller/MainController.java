package com.project.tnet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String main() {
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
	
	@RequestMapping("/admin/home")
	public String admin() {
		return "admin/dashboard";
	}
	
	@RequestMapping("/admin/loginform")
	public String admin_login() {
		return "admin/adminLogin";
	}
	
}
