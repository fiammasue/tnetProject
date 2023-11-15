package com.project.tnet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.Course;
import com.project.tnet.dto.Schedule;
import com.project.tnet.service.ScheduleService;

@Controller
@RequestMapping("/myPage")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	//캘린더 불러오기
	@RequestMapping("/calendar")
    public String getCalendar(Model model, HttpServletRequest request) throws Exception {
        
        return "myPage/myPage_calendar";
    }
		
	// 캘린더 리스트를 필터링하여 모델에 추가
    @GetMapping("/calendarList")
    @ResponseBody
    public List<Schedule> getCalendarList(Authentication authentication, Model model) throws Exception {

    	List<Schedule> calendarList = new ArrayList<>();
    	
    	// 현재 사용자의 Authentication 객체정보가 있을때 가져오기
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();

	        // 사용자 정보에서 사용자 nickname 가져오기
	        String nickName = userDetails.getUser().getNickName();
	        
	        // 사용자 nickname을 기반으로 필터링
	        calendarList = scheduleService.getCalendar(nickName);
	        model.addAttribute("calendarList", calendarList);
	        
		}

        return calendarList;
        
    }
	
	//캘린더 진행중 리스트불러오기
	@RequestMapping("/courseListSelect")
	@ResponseBody
    public List<Course> getCourseListSelect(Authentication authentication, Model model, HttpServletRequest request, HttpSession session) throws Exception {
        
		List<Course> courseListSelect = new ArrayList<>();
		
		// 현재 사용자의 Authentication 객체정보가 있을때 가져오기
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();

	        // 사용자 정보에서 사용자 nickname 가져오기
	        String nickName = userDetails.getUser().getNickName();
			        
	        // 사용자 nickname을 기반으로 필터링
	        courseListSelect = scheduleService.getCourseListSelect(nickName);
	        model.addAttribute("courseListSelect", courseListSelect);
        
		}
		
        return courseListSelect;
    }
	
	@RequestMapping("/addSchedule")
    @ResponseBody
    public Map<String, Object> addSchedule(@RequestBody Schedule schedule) throws Exception {

		Map<String, Object> response = new HashMap<>();
		
		// 서비스를 통해 데이터베이스에 일정 추가
        boolean result = scheduleService.addSchedule(schedule);

        if (result) {
            response.put("status", "success");
            response.put("message", "일정이 추가되었습니다.");
        } else {
            response.put("status", "error");
            response.put("message", "일정 추가에 실패했습니다.");
        }

        return response;
    }
	
	@RequestMapping("/deleteSchedule")
	@ResponseBody
	public Map<String, Object> deleteSchedule(@RequestParam int schedule_id) throws Exception {
	    Map<String, Object> response = new HashMap<>();

	 // 서비스를 통해 데이터베이스에서 일정 삭제
        boolean result = scheduleService.deleteSchedule(schedule_id);

        if (result) {
            response.put("status", "success");
            response.put("message", "일정이 성공적으로 삭제되었습니다.");
        } else {
            response.put("status", "error");
            response.put("message", "일정 삭제에 실패했습니다.");
        }

	    return response;
	}
	
}
