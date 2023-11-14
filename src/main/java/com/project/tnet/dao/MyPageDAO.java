package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.Course;

@Mapper
public interface MyPageDAO {

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

		
		//수강진행중 상세보기
		public Course getDetailAccept(@Param("nickName") String nickName, @Param("course_id") int course_id) throws Exception;

		//수강진행중 상세보기에서 버튼으로 진행결정 상태에서 완료상태로 업데이트하기
		public boolean updateCompletedWaiting(@Param("nickName") String nickName, @Param("course_id") int course_id) throws Exception;

		//수강진행중 상세보기에서 버튼으로 진행결정 상태에서 진행 취소요청 보냄으로 업데이트하기
		public boolean updateCancel(@Param("nickName") String nickName, @Param("course_id") int course_id) throws Exception;
		
		//수강진행중 상세보기에서 버튼으로 진행취소요청보낸 상태에서 다시 진행상태로 업데이트하기
		public boolean updateReAccept(@Param("nickName") String nickName, @Param("course_id") int course_id) throws Exception;

		//수강진행중 상세보기에서 버튼으로 진행취소요청받은 상태에서 취소완료로 업데이트하기
		public boolean updateCancelAccept(@Param("nickName") String nickName, @Param("course_id") int course_id) throws Exception;

		
		//대기중 하나불러오기
		public Course getCourse(Course course);
		
		//courseID에 해당하는 수강하나 불러오기
		public Course getCoursebyId(Course course);
		//수락 Involve하나 불러오기
		public Course getCourseAgreeInvolve(Course course);
}
