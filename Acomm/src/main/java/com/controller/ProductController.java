package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService service;

	@RequestMapping(value = "/productBoard")
	public ModelAndView productBoard(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		List<ProductDTO> productList = service.selectProduct();
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("productList", productList);
		mav.setViewName("productBoard");
		return mav;
	}

	@RequestMapping(value = "/productRetrieve")
	public String productRetrieve(@RequestParam("pCode") int pCode, HttpSession session, Model model) {
		String loginedId = null;
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		if (memberDTO != null) {
			loginedId = memberDTO.getUserID();
		}
		model.addAttribute("loginedId", loginedId);
		ProductDTO productRetrieve = service.selectProductRetrieve(pCode);
		session.setAttribute("productRetrieve", productRetrieve);
		return "productRetrieve";
	}
	
	@RequestMapping(value = "/loginCheck/productIsSoldUpdate")
	public String productIsSoldUpdate(@RequestParam("pCode") int pCode) {
		service.isSoldUpdate(pCode);
		return "redirect:../productBoard";
	}
	
	@RequestMapping(value = "/loginCheck/productAdd")
	public void productAdd() {
		
	}

}
