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
	
	@RequestMapping("/admin/home")
	public String admin() {
		return "admin/dashboard";
	}
	
	@RequestMapping("/admin/loginform")
	public String admin_login() {
		return "admin/adminLogin";
	}
	
}
