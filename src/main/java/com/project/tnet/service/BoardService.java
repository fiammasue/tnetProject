package com.project.tnet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	
	
	

	
	//마이페이지 모집중리스트 페이지
	public List<Board> getKanbanList(String nickName) throws Exception {
		System.out.println("서비스_마이페이지모집중");
		
		// 3. 수정된 Board 객체를 사용하여 해당 사용자가 작성한 글만을 가져옵니다.
        return boardDAO.getKanbanList(nickName);
    }

	// 마이페이지 모집중리스트 삭제
	public boolean deleteKanban(List<Integer> deleteIds) throws Exception {
		return 0!= boardDAO.deleteKanban(deleteIds);
		
	}

	// 마이페이지 진행중리스트 페이지
	//진행 수락
	public List<Course> getKanbanBoardAccept(String nickName) throws Exception {
        return boardDAO.getKanbanBoardAccept(nickName);
	}
	//진행 대기
	public List<Course> getKanbanBoardWaiting(String nickName) throws Exception {
        return boardDAO.getKanbanBoardWaiting(nickName);
	}
	//진행 거절
	public List<Course> getKanbanBoardReject(String nickName) throws Exception {
        return boardDAO.getKanbanBoardReject(nickName);
	}
	//완료 수락
	public List<Course> getKanbanBoardCompleted(String nickName) throws Exception {
        return boardDAO.getKanbanBoardCompleted(nickName);
	}
	//완료 대기
	public List<Course> getKanbanBoardCompleted_Waiting(String nickName) throws Exception {
        return boardDAO.getKanbanBoardCompleted_Waiting(nickName);
	}
	//완료 휴지통
	public List<Course> getKanbanBoardTrash(String nickName) throws Exception {
        return boardDAO.getKanbanBoardTrash(nickName);
	}
	
	//진행중 대기 칸반보드에서 수락 칸반보드로 옮겨졌을때
	public boolean updateAccept(int course_id) throws Exception {
        return boardDAO.updateAccept(course_id);
    }

	//진행중 대기 칸반보드에서 거절 칸반보드로 옮겨졌을때
	public boolean updateReject(int course_id) throws Exception {
		return boardDAO.updateReject(course_id);
	}
	
	//진행중 거절 칸반보드에서 대기 칸반보드로 옮겨졌을때
	public boolean updateWaiting(int course_id) throws Exception {
		return boardDAO.updateWaiting(course_id);
	}

	//완료중 완료대기 칸반보드에서 완료수락 칸반보드로 옮겨졌을때
	public boolean updateCompleted(int course_id) throws Exception {
		return boardDAO.updateCompleted(course_id);
	}

	//완료중 완료수락 칸반보드에서 휴지통 칸반보드로 옮겨졌을때
	public boolean updateTrash(int course_id) throws Exception {
		return boardDAO.updateTrash(course_id);
	}
}
