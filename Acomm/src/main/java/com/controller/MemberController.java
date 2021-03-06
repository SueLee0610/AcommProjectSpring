package com.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;
import com.dto.ProductDTO;

import com.service.FreeBoardService;
import com.service.MemberService;
import com.service.ProductService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	FreeBoardService freeBoardService;
	
	@RequestMapping(value = "/")
	public ModelAndView mainIndex() {
		
		ModelAndView mav = new ModelAndView();

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
		
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main() {
		
		ModelAndView mav = new ModelAndView();

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
		
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO member, Model model) { 

		// 폼에서 넘어온 데이터를 memberDTO에 자동저장
		service.memberAdd(member);
		model.addAttribute("result", "회원가입을 성공하였습니다.");
		return "main";
	}
	
	@RequestMapping(value = "/idSearch")
	public String idSearch() { 
		return "idSearch";
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
	public String myPage(RedirectAttributes redirectA, HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserID();
		// db에서 id에 해당하는 dto 세션에 넣어주기
		MemberDTO member = service.myPage(userid);
		// 수강중인 과목코드로 과목명 가져오기 
		String cName = service.myPageCName(member.getcCode());
		
		// 회원이 판매중인 상품정보 가져오기
		List<ProductDTO> myProduct = productService.selectMyProduct(userid);
		
		// 회원이 작성한 자유게시판 게시글 가져오기 
		List<FreeBoardDTO> myFreeBoard = freeBoardService.selectMyFreeBoard(userid);
		
		// 데이터 전송 
		session.setAttribute("login", member);
		redirectA.addFlashAttribute("cName", cName);
		redirectA.addFlashAttribute("myProduct", myProduct);
		redirectA.addFlashAttribute("myFreeBoard", myFreeBoard);
		return "redirect:../myPage";
	}
	
	@RequestMapping(value = "loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO member, RedirectAttributes rttr) {
		int num = service.memberUpdate(member);
		rttr.addFlashAttribute("result", "회원정보 수정이 완료 되었습니다.");
		return "redirect:../myPage";
	}
}
