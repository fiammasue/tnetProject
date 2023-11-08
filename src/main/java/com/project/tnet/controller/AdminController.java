package com.project.tnet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.dto.NoticeDTO;
import com.project.tnet.service.BoardService;
import com.project.tnet.service.ChartService;
import com.project.tnet.service.MemberService;
import com.project.tnet.service.NoticeService;

//각종 리스트 출력해주는 컨트롤러..
@Controller
public class AdminController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private NoticeService noticeservice;
	
	
	//관리자 게시판 목록 페이지
	@RequestMapping("/admin/boardlist")
	public String admin_boardlist(Board board, Model model) {
		System.out.println("게시판 리스트 출력");
		System.out.println("현재페이지 : " + board.getPageNo());

		board.getStartNo();
		board.getEndNo();
		model.addAttribute("result", boardservice.GetList(board));
		return "admin/board-list";
	}
	
	//관리자 공지사항 목록 페이지
	@RequestMapping("/admin/noticelist")
	public String admin_noticelist(NoticeDTO notice, Model model) {
		System.out.println("공지사항 리스트 출력");
		System.out.println("현재페이지 : " + notice.getPageNo());

		notice.getStartNo();
		notice.getEndNo();
		model.addAttribute("result", noticeservice.GetList(notice));
		return "admin/notice-list";
	}
	
	// 관리자 로그인 페이지
	@RequestMapping("/admin/memberlist")
	public String admin_login(MemberVO member,  Model model) {
		System.out.println("회원 리스트 출력");
		System.out.println("현재페이지 : " + member.getPageNo());
		member.getStartNo();
		member.getEndNo();
		model.addAttribute("result", memberservice.GetList(member));
		return "admin/memberlist";
	}
	

	
	
	

}
