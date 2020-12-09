package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CourseDTO;
import com.dto.OrderCDTO;

@Repository
public class CourseDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<CourseDTO> selectCourse(List<Integer> cCodeList){
		List<CourseDTO> list = template.selectList("CourseMapper.selectCourse", cCodeList);
		return list;
	}
	
	public List<Integer> selectScore(int cCode) {
		List<Integer> list = template.selectList("CourseMapper.selectScore", cCode);
		return list;
	}
	
	public List<Integer> selectAge(int cCode) {
		List<Integer> list = template.selectList("CourseMapper.selectAge", cCode);
		return list;
	}

	public int currentStudNum(int cCode) {
		int result = template.selectOne("CourseMapper.currentStudNum", cCode);
		return result;
	}
	
	public int insertOrderC(OrderCDTO dto) {
		int result = template.insert("CourseMapper.insertOrderC", dto);
		return result;
	}
	
}
