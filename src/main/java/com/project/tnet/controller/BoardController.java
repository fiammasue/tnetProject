package com.project.tnet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.Course;
import com.project.tnet.service.BoardService;
import com.project.tnet.service.CourseService;
import com.project.tnet.service.MyPageService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private MyPageService myPageService;
	

	@RequestMapping("/board/list")
	public String boardList(Board board, Model model) {
		
		System.out.println("board -> "+board);
		model.addAttribute("result",boardService.selectBoardList(board));
		model.addAttribute("cityList", boardService.getCityCodeList());
		model.addAttribute("districtList",boardService.getDistrictByCodeList(board));
		model.addAttribute("talentHighList", boardService.getTalentHighList());
		model.addAttribute("talentSmallList", boardService.getTalentSmallList(board));
		return "board/boardList";
	}
	//글쓰기 페이지로 가기
	@RequestMapping("/board/write")
	public String boardWrite(Model model, Board board) {
		return "board/boardWrite";
	}
	
	//게시글 상세보기
	@RequestMapping("/board/detail/{board_id}")
	public String boardDetail(Model model, Board board,@PathVariable(value="board_id") int boardId) {
		board.setBoard_id(boardId);
		
		//조회수 업데이트하기
		boardService.updateReadCount(board);
		
		model.addAttribute("board", boardService.getBoard(board));
		return "board/boardDetail";
	}
	
	//게시글 수정하기
	@RequestMapping("/board/revise/{board_id}")
	public String boardRevise(Model model, Board board, @PathVariable(value="board_id") int boardId ) {
		board.setBoard_id(boardId);
		model.addAttribute("board", boardService.getBoard(board));
		return "board/boardRevise";
	}
	
	@ResponseBody
	@RequestMapping("/board/districtCode")
	public Map<String, Object> cityCodeList(@RequestBody Board board){
		Map<String, Object> result = new HashMap<>();
		
		result.put("districtCode", boardService.getDistrictByCodeList(board));
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/lowCode")
	public Map<String, Object> talentLowList(@RequestBody Board board){
		Map<String, Object> result = new HashMap<>();
		
		result.put("talentSmallCode", boardService.getTalentSmallList(board));
		
		return result;
	}
	
	//수강테이블에 등록해야징
	@ResponseBody
	@RequestMapping("/course/join")
	public Map<String, Object> joinBoard(@RequestBody Course course){
		
		Map<String, Object> result = new HashMap<>();
		Board board = Board.builder()
							.board_id(course.getBoard_id())
							.build();
		
		board = boardService.getCourseBoard(board);
		
		course.setGive_talent(board.getGive_talent());
		course.setReceive_talent(board.getReceive_talent());
		course.setWriter_status_code("SC02");
		course.setApplyer_status_code("SC03");
		System.out.println("course -> "+course);
		
//		수강신청 해야함
		List<Course> courseList = courseService.getExistCourse(course);
		if (courseList.isEmpty()) {
			courseService.insertCourse(course);
			result.put("bool", true);
			result.put("course", myPageService.getCourse(course));
			System.out.println("coutseeddf -> "+myPageService.getCourse(course));
			boardService.updateBoardStatus(board);
		}
//		이미 수강신청함
		else {
			result.put("bool", "done");
		}
		
		
		return result;
		
	}
	//게시글 상세보기
	@ResponseBody
	@RequestMapping("/board/delete")
	public Map<String , Object> boardDelete(Model model,@RequestBody Board board) {
		Map<String, Object> map = new HashMap<>();
		
		int result = boardService.deleteBoard(board);
		
		if (result > 0) {
			map.put("bool", true);
			
		}
		else {
			map.put("bool", false);
		}
		return map;
	}
	
	
	
}
