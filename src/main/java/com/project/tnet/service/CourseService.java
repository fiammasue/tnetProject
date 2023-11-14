package com.project.tnet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.CourseDAO;
import com.project.tnet.dto.Course;

@Service
public class CourseService {
	@Autowired
	private CourseDAO courseDAO;
	
	public int insertCourse(Course course) {
		return courseDAO.insertCourse(course);
	}
	
	public List<Course> getExistCourse(Course course) {
		return courseDAO.getExistCourse(course);
	}
	
}
