package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.Course;

@Mapper
public interface CourseDAO {
	
	//수강 테이블에 수락요청된 수강 추가
	public int insertCourse(Course course);
	
	//수강 테이블에 지금 신청한 요청이 있는지
	public List<Course> getExistCourse(Course course);
	
	
}
