package com.project.tnet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.Course;
import com.project.tnet.service.BoardService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private BoardService boardService;
	
	
	
	
	//마이페이지 모집중리스트 페이지
	@RequestMapping("/course_recruiting")
	public String getKanbanList(Model model, HttpServletRequest request) throws Exception {
		System.out.println("컨트롤러_마이페이지모집중");
		
		// 1. Spring Security 컨텍스트에서 현재 사용자의 Authentication 객체 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();

	        // 2. 사용자 정보에서 사용자 nickname 가져오기
	        String nickName = userDetails.getUser().getNickName();
	        
	        // 3. 사용자 nickname을 기반으로 필터링
	        List<Board> kanbanList = boardService.getKanbanList(nickName);

	        model.addAttribute("kanbanList", kanbanList);
	    }
		
		return "myPage/myPage_course_recruiting";
	}
	
	
	// 마이페이지 모집중리스트 삭제
	@ResponseBody
	@PostMapping("/deleteKanban")
	public Map<String, Object> deleteKanban(@RequestParam("deleteIds[]") List<Integer> deleteIds) throws Exception {
	    System.out.println("컨트롤러_삭제함수");
	    Map<String, Object> result = new HashMap<>();
	    
	    if(boardService.deleteKanban(deleteIds)) {
	        System.out.println("컨트롤러_삭제");
	        result.put("status", true);
	        result.put("message", "게시물이 삭제되었습니다.");
	    } else {
	    	result.put("status", false);
	    	result.put("message", "게시물 삭제 중 오류가 발생했습니다.");
	    }
	    
	    return result;
	}
	
	// 마이페이지 진행중리스트 페이지
	@RequestMapping("/course_proceeding")
	public String getKanbanBoardAccept(Model model, HttpServletRequest request) throws Exception {
		// 1. Spring Security 컨텍스트에서 현재 사용자의 Authentication 객체 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();

	        // 2. 사용자 정보에서 사용자 nickname 가져오기
	        String nickName = userDetails.getUser().getNickName();
	        
	        // 3. 사용자 nickname을 기반으로 필터링
	        List<Course> kanbanBoard = boardService.getKanbanBoardAccept(nickName);
	        model.addAttribute("kanbanBoard_Accept", kanbanBoard);
	        
	        List<Course> kanbanBoard2 = boardService.getKanbanBoardWaiting(nickName);
	        model.addAttribute("kanbanBoard_Waiting", kanbanBoard2);
	        
	        List<Course> kanbanBoard3 = boardService.getKanbanBoardReject(nickName);
	        model.addAttribute("kanbanBoard_Reject", kanbanBoard3);
	        
	        List<Course> kanbanBoard4 = boardService.getKanbanBoardCompleted(nickName);
	        model.addAttribute("kanbanBoard_Completed", kanbanBoard4);
	        
	        List<Course> kanbanBoard5 = boardService.getKanbanBoardCompleted_Waiting(nickName);
	        model.addAttribute("kanbanBoard_Completed_Waiting", kanbanBoard5);
	        
	        List<Course> kanbanBoard6 = boardService.getKanbanBoardTrash(nickName);
	        model.addAttribute("kanbanBoard_Trash", kanbanBoard6);
		}
		
		return "myPage/myPage_course_proceeding";
	}
	
	//진행중 대기 칸반보드에서 수락 칸반보드로 옮겨졌을때
	@PostMapping("/updateAccept")
	@ResponseBody
	public Map<String, Object> updateAccept(@RequestParam("course_id") int course_id) throws Exception {
	    
		Map<String, Object> result = new HashMap<>();
		
	    // 업데이트된 수락 칸반보드를 가져와서 모델에 추가
		result.put("updatedAcceptList", boardService.updateAccept(course_id));
		
		return result;
	}
	
	//진행중 대기 칸반보드에서 거절 칸반보드로 옮겨졌을때
	@PostMapping("/updateReject")
	@ResponseBody
	public Map<String, Object> updateReject(@RequestParam("course_id") int course_id) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		// 업데이트된 거절 칸반보드를 가져와서 모델에 추가
		result.put("updatedRejectList", boardService.updateReject(course_id));
		
		return result;
	}
	
	
	//진행중 대기 칸반보드에서 거절 칸반보드로 옮겨졌을때
	@PostMapping("/updateWaiting")
	@ResponseBody
	public Map<String, Object> updateWaiting (@RequestParam("course_id") int course_id) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		// 업데이트된 거절 칸반보드 를 가져와서 모델에 추가
		result.put("updatedWaitingList", boardService.updateWaiting(course_id));
		
		return result;
	}
	
	//완료중 완료대기 칸반보드에서 완료수락 칸반보드로 옮겨졌을때
	@PostMapping("/updateCompleted")
	@ResponseBody
	public Map<String, Object> updateCompleted (@RequestParam("course_id") int course_id) throws Exception {
		
		Map<String, Object> result = new HashMap<>();

		// 업데이트된 거절 칸반보드 를 가져와서 모델에 추가
		result.put("updatedCompletedList", boardService.updateCompleted(course_id));
		
		return result;
	}
	
	//완료중 완료수락 칸반보드에서 휴지통 칸반보드로 옮겨졌을때
	@PostMapping("/updateTrash")
	@ResponseBody
	public Map<String, Object> updateTrash (@RequestParam("course_id") int course_id) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		// 업데이트된 거절 칸반보드 를 가져와서 모델에 추가
		result.put("updatedTrashList", boardService.updateTrash(course_id));
		
		return result;
	}
}
