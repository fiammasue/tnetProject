package com.project.tnet.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.dto.Board;
import com.project.tnet.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

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
	@RequestMapping("/board/revise")
	public String boardRevise() {
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
	
	
	
}
