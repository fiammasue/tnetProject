package com.project.tnet.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.tnet.dto.ChartDTO;
import com.project.tnet.service.ChartService;

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
	
	// 관리자 로그인 페이지
	@RequestMapping("/admin/loginform")
	public String admin_login() {
		return "admin/adminLogin";
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
	@Autowired
	private ChartService chartService;
	
	
	//관리자 대시보드 페이지로 가기
	@RequestMapping("/admin/home")
	public ModelAndView  GetChart(ChartDTO chart, Model model) throws Exception {
    	System.out.println("main-chart-controller");

    	ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("admin/dashboard");

		//파이차트 데이터 가져오기
		Map<String, Object> result = chartService.getChartData(chart);
		Map<String, Object> line_result = chartService.getLineChart(chart);
		
		
		System.out.println("result : " + result);
		System.out.println("line_result : " + line_result.get("line_datas"));
		modelAndView.addObject("strlist", result.get("str"));
		modelAndView.addObject("titlelist", result.get("title"));
//		modelAndView.addObject("line_data_class", line_result.get("line_data_class"));
//		modelAndView.addObject("line_data_user", line_result.get("line_data_user"));
		modelAndView.addObject("line_datas",  line_result.get("line_datas"));
		

		return modelAndView;		
	} 		

}
