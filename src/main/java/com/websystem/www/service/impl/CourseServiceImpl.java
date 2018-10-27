package com.websystem.www.service.impl;


import com.websystem.www.dao.CourseDao;
import com.websystem.www.entity.Course;
import com.websystem.www.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

	@Resource
	CourseDao courseDao;
	@Override
	public List<Course> getCourseList() {
		return courseDao.getCourseList();
	}
}
