package com.project.tnet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.service.AlarmService;
import com.project.tnet.service.BoardService;

@Controller
public class MainController {
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/")
	public String main(Authentication authentication, Model model) {

		List<Board> boardList = boardService.selectBoardTOP6();
		model.addAttribute("boardList", boardList);
		
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

	// 아이콘에서 선택한 재능을 가르칠과목으로 TOP6로 정렬시킴.	
	@ResponseBody
	@RequestMapping("/telent/teachers")
	public Map<String, Object> selectTeachersTOP6(@RequestBody Board board){
		Map<String, Object> map = new HashMap<>();
		List<Board> teachersList = boardService.selectTeachersTOP6(board.getGive_talent());
		map.put("status", true);
		map.put("teachersList", teachersList); 
		return map;
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
	
//	@RequestMapping("/myPage/chatRoom")
//	public String myPage_chatRoom() {
//		return "myPage/myPage_chatRoom";
//	}
	

	

	
	


}
