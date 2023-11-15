package com.project.tnet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.ScheduleDAO;
import com.project.tnet.dto.Course;
import com.project.tnet.dto.Schedule;

@Service
public class ScheduleService {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public List<Schedule> getCalendar(String nickName) throws Exception {
		return scheduleDAO.getCalendar(nickName);
	}
	
	public List<Course> getCourseListSelect(String nickName) throws Exception {
		return scheduleDAO.getCourseListSelect(nickName);
	}

	public boolean addSchedule(Schedule schedule) throws Exception {
		return scheduleDAO.addSchedule(schedule);
	}

	public boolean deleteSchedule(int schedule_id) throws Exception {
		return scheduleDAO.deleteSchedule(schedule_id);
	}
	
}
