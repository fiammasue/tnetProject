package com.project.tnet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.MyPageDAO;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.Course;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	
	//마이페이지 모집중리스트 페이지
	public List<Board> getKanbanList(String nickName) throws Exception {
		
		// 3. 수정된 Board 객체를 사용하여 해당 사용자가 작성한 글만을 가져옵니다.
        return myPageDAO.getKanbanList(nickName);
    }

	// 마이페이지 모집중리스트 삭제
	public boolean deleteKanban(List<Integer> deleteIds) throws Exception {
		return 0!= myPageDAO.deleteKanban(deleteIds);
	}

	// 마이페이지 진행중리스트 페이지
	//진행 수락
	public List<Course> getKanbanBoardAccept(String nickName) throws Exception {
        return myPageDAO.getKanbanBoardAccept(nickName);
	}
	//진행 대기
	public List<Course> getKanbanBoardWaiting(String nickName) throws Exception {
        return myPageDAO.getKanbanBoardWaiting(nickName);
	}
	//진행 거절
	public List<Course> getKanbanBoardReject(String nickName) throws Exception {
        return myPageDAO.getKanbanBoardReject(nickName);
	}
	//완료 수락
	public List<Course> getKanbanBoardCompleted(String nickName) throws Exception {
        return myPageDAO.getKanbanBoardCompleted(nickName);
	}
	//완료 대기
	public List<Course> getKanbanBoardCompleted_Waiting(String nickName) throws Exception {
        return myPageDAO.getKanbanBoardCompleted_Waiting(nickName);
	}
	//완료 휴지통
	public List<Course> getKanbanBoardTrash(String nickName) throws Exception {
        return myPageDAO.getKanbanBoardTrash(nickName);
	}
	
	//진행중 대기 칸반보드에서 수락 칸반보드로 옮겨졌을때
	public boolean updateAccept(int course_id) throws Exception {
        return myPageDAO.updateAccept(course_id);
    }

	
	//진행중 대기 칸반보드에서 거절 칸반보드로 옮겨졌을때
	public boolean updateReject(int course_id) throws Exception {
		return myPageDAO.updateReject(course_id);
	}
	
	//진행중 거절 칸반보드에서 대기 칸반보드로 옮겨졌을때
	public boolean updateWaiting(int course_id) throws Exception {
		return myPageDAO.updateWaiting(course_id);
	}

	//완료중 완료대기 칸반보드에서 완료수락 칸반보드로 옮겨졌을때
	public boolean updateCompleted(int course_id) throws Exception {
		return myPageDAO.updateCompleted(course_id);
	}

	//완료중 완료수락 칸반보드에서 휴지통 칸반보드로 옮겨졌을때
	public boolean updateTrash(int course_id) throws Exception {
		return myPageDAO.updateTrash(course_id);
	}
	
	
	//수강진행중 상세보기
	public Course getDetailAccept(String nickName, int course_id) throws Exception {
		return myPageDAO.getDetailAccept(nickName, course_id);
	}

	//수강진행중 상세보기에서 버튼으로 진행결정 상태에서 완료상태로 업데이트하기
	public boolean updateCompletedWaiting(String nickName, int course_id) throws Exception {
		return myPageDAO.updateCompletedWaiting(nickName, course_id);
	}

	//수강진행중 상세보기에서 버튼으로 진행결정 상태에서 진행 취소요청 보냄으로 업데이트하기
	public boolean updateCancel(String nickName, int course_id) throws Exception {
		return myPageDAO.updateCancel(nickName, course_id);
	}
	
	//수강진행중 상세보기에서 버튼으로 진행취소요청보낸 상태에서 다시 진행상태로 업데이트하기
	public boolean updateReAccept(String nickName, int course_id) throws Exception {
		return myPageDAO.updateReAccept(nickName, course_id);
	}

	//수강진행중 상세보기에서 버튼으로 진행취소요청받은 상태에서 취소완료로 업데이트하기
	public boolean updateCancelAccept(String nickName, int course_id) throws Exception {
		return myPageDAO.updateCancelAccept(nickName, course_id);
	}
	
	public Course getCourse(Course course) {
		return myPageDAO.getCourse(course);
	}
	
	public Course getCoursebyId(Course course) {
		return myPageDAO.getCoursebyId(course);
	}
	public Course getCourseAgreeInvolve(Course course) {
		return myPageDAO.getCourseAgreeInvolve(course);
	}
	public Course getCourseRejectInvolve(Course course) {
		return myPageDAO.getCourseRejectInvolve(course);
	}
	public Course getCourseReWaitingInvolve(Course course) {
		return myPageDAO.getCourseReWaitingInvolve(course);
	}
	public Course getCourseCompleteAgree(Course course) {
		return myPageDAO.getCourseCompleteAgree(course);
	}
	public Course getCourseCompleteInvolve(Course course) {
		return myPageDAO.getCourseCompleteInvolve(course);
	}

	public boolean trashClear(String nickName, int course_id) throws Exception {
		return myPageDAO.trashClear(nickName, course_id);
	}


}
