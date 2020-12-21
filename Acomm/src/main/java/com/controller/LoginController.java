package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;

	@RequestMapping(value = "/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		MemberDTO dto = service.login(map);
		session.setAttribute("login", dto);
		String nextPage = "";
		if (dto == null) {
			model.addAttribute("mesg", "아이디 또는 비번이 잘못되었습니다.");
			nextPage = "loginForm";
		} else {
			nextPage = "main";
		}
		return nextPage;
	}
	
	@RequestMapping(value = "/loginCheck/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("result", "로그아웃이 완료되었습니다.");
		return "redirect:../";
	}
}
