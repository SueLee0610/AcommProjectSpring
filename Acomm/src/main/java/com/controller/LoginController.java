package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.dto.FreeBoardDTO;
import com.service.FreeBoardService;
import com.service.MemberService;
import com.service.ProductService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	FreeBoardService freeBoardService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam Map<String, String> map, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = service.login(map);
		session.setAttribute("login", dto);
		
		List<ProductDTO> productList = productService.selectProduct();
		if(productList.size() > 6) {
			for(int i = 5; i < productList.size(); i++) {
				productList.remove(productList.get(i));				
			}
		}
		mav.addObject("productList", productList);
		
		List<FreeBoardDTO> freeBoardList = freeBoardService.selectFreeBoard();
		if(freeBoardList.size() > 6) {
			for(int i = 5; i < freeBoardList.size(); i++) {
				freeBoardList.remove(freeBoardList.get(i));				
			}
		}
		mav.addObject("freeBoardList", freeBoardList);
		
		if (dto == null) {
			mav.addObject("result", "아이디 또는 비밀번호가 잘못되었습니다.");
			mav.setViewName("loginForm");
		} else {
			mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping(value = "/loginCheck/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("result", "로그아웃이 완료되었습니다.");
		return "redirect:../";
	}
}
