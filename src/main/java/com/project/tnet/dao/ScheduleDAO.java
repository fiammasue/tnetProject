package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.tnet.dto.Course;
import com.project.tnet.dto.Schedule;

@Mapper
public interface ScheduleDAO {

	public List<Schedule> getCalendar(@Param("nickName") String nickName) throws Exception;
	
	public List<Course> getCourseListSelect(@Param("nickName") String nickName) throws Exception;

	public boolean addSchedule(Schedule schedule) throws Exception;

	public boolean deleteSchedule(@Param("schedule_id") int schedule_id) throws Exception;
	
}
