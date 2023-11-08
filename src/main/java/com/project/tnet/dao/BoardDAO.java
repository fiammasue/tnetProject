package com.project.tnet.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.Course;

@Mapper
public interface BoardDAO {

	
	
	
	
	//마이페이지 모집중리스트 페이지
	public List<Board> getKanbanList(String nickName) throws Exception;

	// 마이페이지 모집중리스트 삭제
	public int deleteKanban(List<Integer> deleteIds) throws Exception;

	// 마이페이지 진행중리스트 페이지
	//진행 수락
	public List<Course> getKanbanBoardAccept(String nickName) throws Exception;
	//진행 대기
	public List<Course> getKanbanBoardWaiting(String nickName) throws Exception;
	//진행 거절
	public List<Course> getKanbanBoardReject(String nickName) throws Exception;
	//완료 수락
	public List<Course> getKanbanBoardCompleted(String nickName) throws Exception;
	//완료 대기
	public List<Course> getKanbanBoardCompleted_Waiting(String nickName) throws Exception;
	//완료 휴지통
	public List<Course> getKanbanBoardTrash(String nickName) throws Exception;

	//진행중 대기 칸반보드에서 수락 칸반보드로 옮겨졌을때
	public boolean updateAccept(@Param("course_id") int course_id) throws Exception;

	//진행중 대기 칸반보드에서 거절 칸반보드로 옮겨졌을때
	public boolean updateReject(@Param("course_id") int course_id) throws Exception;
	
	//진행중 거절 칸반보드에서 대기 칸반보드로 옮겨졌을때
	public boolean updateWaiting(@Param("course_id") int course_id) throws Exception;

	//완료중 완료대기 칸반보드에서 완료수락 칸반보드로 옮겨졌을때
	public boolean updateCompleted(@Param("course_id") int course_id) throws Exception;

	//완료중 완료수락 칸반보드에서 휴지통 칸반보드로 옮겨졌을때
	public boolean updateTrash(@Param("course_id") int course_id) throws Exception;
	
}
