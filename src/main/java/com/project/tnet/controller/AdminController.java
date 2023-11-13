package com.project.tnet.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.ChartDTO;
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
	
	// 관리자 공지사항 상세 페이지
	@RequestMapping("/admin/detail_notice")
	public String detail_notice(NoticeDTO notice, Model model) {
		System.out.println("공지사항 상세");
		model.addAttribute("notice", noticeservice.getDetail(notice).get("detail"));
		return "notice/noticeDetail";
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
	
	@ResponseBody
	@RequestMapping("/del/notice")
	public Map<String, Object> delete(@RequestBody NoticeDTO notice) {
		System.out.println("관리자 전체 삭제");		
		System.out.println("ids" + notice.getIds());
		return noticeservice.deleteAll(notice);
	}
	
	
}
