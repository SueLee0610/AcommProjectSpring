package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CourseDTO;
import com.service.CourseService;

@Controller
public class CourseController {
	
	@Autowired
	CourseService service;
	
	@RequestMapping(value = "/CourseInfo", produces="application/json" )
	@ResponseBody
	public List<CourseDTO> selectCourse(@RequestParam String courseInfo, HttpSession session) {
		// ajax로 받아온 cCode 파싱
				String[] cCodeArray = courseInfo.split("");
				List<Integer> cCodeList = new ArrayList<>();
				cCodeList.add(Integer.parseInt(cCodeArray[0]));
				cCodeList.add(Integer.parseInt(cCodeArray[1]));
				List<CourseDTO> dtoList = service.selectCourse(cCodeList);
				// session에 CourseDTO 2개가 담긴 리스트 저장하기
				session.setAttribute("courseDetail", dtoList);
				
		return dtoList;
	}
	
	
	@RequestMapping(value = "/CourseRetrieve", method = RequestMethod.GET)
	public ModelAndView CourseRetrieve(@RequestParam int cCode) {
		
				// age 정보 가져오기 위해 cCode 파싱
				List<Integer> scoreList = service.selectScore(cCode);
				
				// age, score 레코드 받아와서 list에 저장
				List<Integer> ageList = service.selectAge(cCode);
				
				// 해당 cCode로 가입한 멤버 수가져오기
				int currentStudNum = service.currentStudNum(cCode);
				
				ModelAndView mav = new ModelAndView();
				mav.addObject("ageList", ageList);
				mav.addObject("scoreList", scoreList);
				mav.addObject("currentStudNum", currentStudNum);
				
				mav.setViewName("courseRetrieve");
				return mav;
	}
	
	
}
