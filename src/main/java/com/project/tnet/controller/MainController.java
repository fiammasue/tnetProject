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
	@RequestMapping("/myPage/course_proceeding")
	public String myPage_course_proceeding() {
		return "myPage/myPage_course_proceeding";
	}
	@RequestMapping("/myPage/calendar")
	public String myPage_calendar() {
		return "myPage/myPage_calendar";
	}
//	@RequestMapping("/myPage/chatRoom")
//	public String myPage_chatRoom() {
//		return "myPage/myPage_chatRoom";
//	}
	
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
		modelAndView.addObject("count", chartService.getCounts(chart));
		

		return modelAndView;		
	} 		

}
