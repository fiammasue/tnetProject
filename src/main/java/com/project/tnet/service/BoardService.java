package com.project.tnet.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.BoardDAO;
import com.project.tnet.dto.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	
	
	
//	//마이페이지 본인 모집중List
//	public Map<String, Object> getKanbanList(Member loginMember) throws Exception {
//		System.out.println("서비스_마이페이지모집중");
//		
//		// 3. 수정된 kanban 객체를 사용하여 해당 사용자가 작성한 글만을 가져옵니다.
//        return boardDAO.getKanbanList(loginMember);
//	}
}
