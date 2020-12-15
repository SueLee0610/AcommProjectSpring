package com.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	@Autowired
	FreeBoardService service;
	
	//게시글 전체 리스트 보기
	@RequestMapping("/freeBoardList")
	public ModelAndView selectFreeBoard(@RequestParam(required =false, defaultValue = "1") String curPage, String searchName, String searchValue) {
		
		if(curPage == null) {
			curPage = "1";
		}
		PageDTO pDTO = service.search(searchName, searchValue, Integer.parseInt(curPage));
		List<FreeBoardDTO> list = pDTO.getList();

		//ModelAndView : 데이터를 전송시킬 수 있는 리턴 타입
		ModelAndView mav= new ModelAndView();
		//addObject : key와 value를 담아 보낼 수 있는 메서드
		mav.addObject("selectFreeBoard", list);
		mav.addObject("pDTO", pDTO);
		mav.addObject("searchName", searchName);
		mav.addObject("searchValue", searchValue);
		//setViewName : 어떤 페이지를 보여줄 것인지
		mav.setViewName("freeBoardList"); //freeBoardList.jsp
		return mav;
	}
	
	//검색
	@RequestMapping(value = "/search")
	public ModelAndView search(@RequestParam(required =false, defaultValue = "1") String curPage, String searchName, String searchValue) {
		
		if(curPage == null) {
			curPage = "1";
		}
		PageDTO pDTO = service.search(searchName, searchValue, Integer.parseInt(curPage));
		List<FreeBoardDTO> list = pDTO.getList();
		
		//ModelAndView : 데이터를 전송시킬 수 있는 리턴 타입
		ModelAndView mav= new ModelAndView();
		//addObject : key와 value를 담아 보낼 수 있는 메서드
		mav.addObject("selectFreeBoard", list);
		mav.addObject("pDTO", pDTO);
		mav.addObject("searchName", searchName);
		mav.addObject("searchValue", searchValue);
		//setViewName : 어떤 페이지를 보여줄 것인지
		mav.setViewName("freeBoardList"); //freeBoardList.jsp
		return mav;
	}	
	
	//자세히 보기
	@RequestMapping(value = {"/freeBoardRetrieve","/freeBoardUpdate"})//goodsRetrieve.jsp, freeBoardUpdate.jsp
	@ModelAttribute("freeBoardDetail") //key값
	public FreeBoardDTO retrieve(@RequestParam("num") int num) {
		FreeBoardDTO result = service.selectByNum(num);
		result = service.retrieve(num);
		return result;
	}
	
	//삭제
	@RequestMapping(value = "/loginCheck/delete")
	public String delete(@RequestParam("num") int num) {
		service.delete(num);
		return "redirect:../freeBoardList";
	}
	
	//수정페이지에서 수정버튼을 눌렀을경우!
	@RequestMapping(value = "/loginCheck/update")
	public String update(FreeBoardDTO fDTO) {
		service.update(fDTO);
		return "redirect:../freeBoardList";
	}
	
	//로그인 여부 확인 후 게시글 작성 페이지 이동
	@RequestMapping(value = "/freeBoardWrite")
	public String freeBoardWrite(HttpSession session, Model model) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String nextPage = "";
		if (mDTO != null) {
			model.addAttribute("login", mDTO.getUserID());
			nextPage = "freeBoardWrite";
		} else {
			nextPage = "loginForm";
		}
		return nextPage;
	}
	
	//게시글 등록
	@RequestMapping(value = "/loginCheck/insert")
	public String insert(FreeBoardDTO fDTO,Model model) {
		service.insert(fDTO);
		model.addAttribute("success", "등록성공");
		return "redirect:../freeBoardList";
	}
	
}
