package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CourseDAO;
import com.dto.CourseDTO;

@Service
public class CourseService {
	
	@Autowired
	CourseDAO dao;
	
	public List<CourseDTO> selectCourse(List<Integer> cCodeList){
		List<CourseDTO> list = dao.selectCourse(cCodeList);
		return list;
	}
	
	public List<Integer> selectScore(int cCode){
		List<Integer> list = dao.selectScore(cCode);
		return list;
	}
	
	public List<Integer> selectAge(Integer cCode) {
		List<Integer> list = dao.selectAge(cCode);
		return list;
	}
	
	public int currentStudNum(int cCode) {
		int result = dao.currentStudNum(cCode);
		return result;
	}
	
	
	
	
	
	
}
