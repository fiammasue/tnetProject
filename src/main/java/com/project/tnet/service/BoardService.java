package com.project.tnet.service;

import org.springframework.stereotype.Service;


import com.project.tnet.dao.BoardDAO;
import com.project.tnet.dto.Board;


import com.project.tnet.dto.Course;

import com.project.tnet.dto.MemberVO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;

	public Object GetList(Board board) {
		System.out.println("게시판 전체 목록 서비스");
		
		//1. 전체 건수를 얻는다
		board.setTotalCount(boardDAO.totalcount());
		
		Map<String, Object> map = new HashMap<>();
		map.put("board", board);
		System.out.println("board : "+ board );
		List<Board> list = boardDAO.getBoardList(board);
		System.out.println(list);
		map.put("list", list);
		
		return map;
	}
	
	
	
	

	
	

}
