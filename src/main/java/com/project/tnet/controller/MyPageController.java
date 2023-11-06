package com.project.tnet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.tnet.dto.Board;
import com.project.tnet.service.BoardService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private BoardService boardService;
	
	
	
	
//	//마이페이지 본인 모집중리스트
//	@RequestMapping("/course_recruiting")
//	public String getKanbanList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
//		System.out.println("컨트롤러_마이페이지모집중");
//		
//		 // 1. 세션에서 로그인한 사용자의 nickname을 가져옵니다.
//        Member loginMember = (Member) session.getAttribute("loginMember");
//        
//        // 2. 사용자 nickname을 기반으로 필터링
//        List<Board> kanbanList = boardService.getKanbanListByUser(loginMember);
//
//        model.addAttribute("kanbanList", kanbanList);
//		
//		return "myPage/myPage_course_recruiting";
//	}
}
