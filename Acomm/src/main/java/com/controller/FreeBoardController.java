package com.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String delete(@RequestParam("num") int num, RedirectAttributes rttr) {
		service.delete(num);
		
		//모달창 띄우기
		rttr.addFlashAttribute("result", "No." + num + " 게시글이 삭제되었습니다.");		
		return "redirect:../freeBoardList";		
	}
	
	//수정페이지에서 수정버튼을 눌렀을경우!
	@RequestMapping(value = "/loginCheck/update")
	public String update(FreeBoardDTO fDTO, RedirectAttributes rttr) {
		service.update(fDTO);
		
		//모달창 띄우기
		rttr.addFlashAttribute("result", "No." + fDTO.getNum() + " 게시글이 수정되었습니다.");
		return "redirect:../freeBoardList";
	}
	
	//로그인 여부 확인 후 게시글 작성 페이지 이동
	@RequestMapping(value = "/loginCheck/freeBoardWrite")
	public String freeBoardWrite() {

		return "redirect:../freeBoardWrite";
	}
	
	//게시글 등록
	@RequestMapping(value = "/loginCheck/insert")
	public String insert(FreeBoardDTO fDTO, Model model, RedirectAttributes rttr) {
		service.insert(fDTO);
		model.addAttribute("success", "등록성공");
		
		//모달창 띄우기
		rttr.addFlashAttribute("result", " 게시글이 등록되었습니다.");
		return "redirect:../freeBoardList";
	}
	
}
