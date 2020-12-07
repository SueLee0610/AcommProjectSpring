package com.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.member.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO member, Model model) { 

		// 폼에서 넘어온 데이터를 memberDTO에 자동저장
		service.memberAdd(member);
		model.addAttribute("success", "회원가입 성공");
		return "main";
	}

	// AJAX 아이디 중복 체크
	@RequestMapping(value = "/idDuplicateCheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicateCheck(@RequestParam String userID) {

		// 문자, 숫자, 5-15자리 유효한지 확인
		Pattern pattern = Pattern.compile("^(?=.*[0-9])(?=.*[a-z]).{5,15}$");
		Matcher matcher = pattern.matcher(userID);
		int count = service.idCheck(userID);
		String mesg = "";

		if (count == 1) {
			mesg = "중복된 ID입니다.";
		} else if (matcher.find()) {
			mesg = "사용 가능한 ID입니다.";
		} else {
			mesg = "영문, 숫자 조합으로 5글자 이상 15글자 이하로 입력해 주세요.";
		}
		return mesg;
	}

	@RequestMapping(value = "/loginCheck/myPage")
	public String myPage(HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserID();
		// db에서 id에 해당하는 dto 세션에 넣어주기
		MemberDTO member = service.myPage(userid);
		session.setAttribute("login", member);
		return "redirect:../myPage";
	}
	
	@RequestMapping(value = "loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO member) {
		service.memberUpdate(member);
		return "redirect:../loginCheck/myPage";
	}
}
