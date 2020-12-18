package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CourseDTO;
import com.dto.MemberDTO;
import com.dto.OrderCDTO;
import com.dto.ReplyDTO;
import com.service.CourseService;
import com.service.MemberService;
import com.service.ReplyService;

@Controller
public class CourseController {

	@Autowired
	CourseService service;

	@Autowired
	ReplyService replyService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/CourseInfo", produces = "application/json")
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
	public ModelAndView CourseRetrieve(@RequestParam int cCode, HttpSession session) {
		// session에서 CourseDTO 2개가 담긴 리스트 받아오기
		List<CourseDTO> dtoList = (List<CourseDTO>) session.getAttribute("courseDetail");
		
		// 리스트에서 클릭한 cCode에 해당하는 CourseDTO 선택
		CourseDTO courseDTO = null;
		for (CourseDTO dto : dtoList) {
			if (cCode == dto.getcCode()) {
				courseDTO = dto;
				break;
			}
		}
		// 주문페이지 사용을 위해 
		// 리스트에서 클릭한 cCode에 해당하는 CourseDTO 정보 세션 저장,
		session.setAttribute("courseDTO", courseDTO);
		
		// session에 담긴 두개의 강의 정보 삭제
		session.removeAttribute("courseDetail");
		
		// age 정보 가져오기 위해 cCode 파싱
		List<Integer> scoreList = service.selectScore(cCode);

		// age, score 레코드 받아와서 list에 저장
		List<Integer> ageList = service.selectAge(cCode);

		// 나이대 구간별 인원 count하기
		int age21_25 = 0;
		int age26_30 = 0;
		int age31_35 = 0;
		int age36_40 = 0;
		
		for (int age : ageList) {
			if (age >= 20 && age <= 24) {
				age21_25++;
			} else if (age <= 29) {
				age26_30++;
			} else if (age <= 34) {
				age31_35++;
			} else if (age <= 39) {
				age36_40++;
			}
		}
		
		// map에 나이대 구간별 인원 값 넣어주기 
		HashMap<String, Integer> ageListCount = new HashMap<String, Integer>();
		ageListCount.put("age21_25", age21_25);
		ageListCount.put("age26_30", age26_30);
		ageListCount.put("age31_35", age31_35);
		ageListCount.put("age36_40", age36_40);
		
		// 해당 cCode로 가입한 멤버 수 가져오기
		int currentStudNum = service.currentStudNum(cCode);
		
		// 해당 강의 평점 구하기 
		float scoreAvg = 0;
		if (scoreList.size() != 0) {
			for (Integer x : scoreList) {
				scoreAvg += x;
			}
			scoreAvg /= scoreList.size();
		} else {
			scoreAvg = 0;
		}
		
		List<ReplyDTO> replyList = replyService.selectReplyList(cCode);

		ModelAndView mav = new ModelAndView();
		mav.addObject("scoreAvg", scoreAvg);
		mav.addObject("ageListCount", ageListCount);
		mav.addObject("currentStudNum", currentStudNum); 
		mav.addObject("replyList", replyList);
		mav.setViewName("courseRetrieve");
		
		return mav;
	}

	@RequestMapping(value = "/CourseReplyAdd", produces = "application/json")
	@ResponseBody
	public JSONObject CourseReplyAdd(@RequestParam int cCode, @RequestParam String reWriter,
			@RequestParam String reContent, @RequestParam(required = false) String reNO) {

		ReplyDTO dto = new ReplyDTO();

		// 대댓글인 경우
		if (reNO != null) {
			ReplyDTO replyInfo = replyService.selectReplyParent(Integer.parseInt(reNO));

			// dto.setReParent(Integer.parseInt(reNO));
			dto.setReParent(Integer.parseInt(reNO));
			dto.setReDepth(replyInfo.getReDepth() + 1);
			dto.setReOrder(replyInfo.getReOrder() + 1);

			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("cCode", cCode);
			map.put("reOrder", dto.getReOrder());
			int result = replyService.updateReplyOrder(map);

			dto.setcCode(cCode);
			dto.setReWriter(reWriter);
			dto.setReContent(reContent);
			int withParent = replyService.insertReply(dto);
			int updateParentFlagToN = replyService.updateParentFlagToN(Integer.parseInt(reNO));

			// 대댓글이 아닌 경우
		} else {
			int reOrder = replyService.selectReplyMaxReOrder(cCode);
			// int reParent = service.selectReplyMaxReParent(cCode);
			dto.setReOrder(reOrder);
			dto.setReParent(reOrder);

			dto.setcCode(cCode);
			dto.setReWriter(reWriter);
			dto.setReContent(reContent);
			int withoutParent = replyService.insertReplyWOParent(dto);
		}

		int dtoReNO = dto.getReNO();
		int reDepth = dto.getReDepth();
		int reParent = dto.getReParent();
		int reOrder = dto.getReOrder();

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("reNO", dtoReNO);
		jsonObject.put("reDepth", reDepth);
		jsonObject.put("reParent", reParent);

		return jsonObject;
	}

	@RequestMapping(value = "/CourseReplyDelete", produces = "application/json")
	@ResponseBody
	public int CourseReplyDelete(@RequestParam String reNO) {

		ReplyDTO dto = new ReplyDTO();

		// reNO로 ReplyDTO 객체를 반환
		dto = replyService.selectByReNO(Integer.parseInt(reNO));

		// delete 후 reDeleteFlag 변경 여부를 체크하기 위해 reParent 값을 가져옴
		// reParent의 count가 2개이면 현재 삭제하려는 행의 삭제 이후 부모의 reDeleteFlag을 변경해주어야 함
		int reParent = dto.getReParent();
		int reParentCount = replyService.selectCountByReParent(dto.getReParent());

		// delete 후 reOrder를 재정렬하기 위해 delete할 객체의 reOrder을 가져옴
		int reOrder = dto.getReOrder();

		int result = replyService.deleteReply(Integer.parseInt(reNO));
		int result2 = replyService.updateReOrderAfterDelete(reOrder);
		int result3 = 0;
		if (reParentCount == 2) {
			result3 = replyService.updateParentFlagToY(reParent);
		}

		return result;
	}

	@RequestMapping(value = "/CourseReplyUpdate", produces = "application/json")
	@ResponseBody
	public int CourseReplyUpdate(@RequestParam int cCode, @RequestParam String reWriter,
			@RequestParam String reContent, @RequestParam String reNO) {
		
		ReplyDTO dto = new ReplyDTO();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reNO", reNO);
		map.put("reContent", reContent);
		int result = replyService.updateReplyContent(map);

		return result;
	}
	
	@RequestMapping(value = "loginCheck/CourseOrder")
	public String courseOrder() {
		return "redirect:../courseOrder";
	}
	
	@RequestMapping(value = "loginCheck/CourseOrderDone")
	public String courseOrderDone(@RequestParam String payMethod, HttpSession session, RedirectAttributes rttr) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		CourseDTO courseDTO = (CourseDTO) session.getAttribute("courseDTO");
		String cName = courseDTO.getcName();
		int cCode = courseDTO.getcCode();
		int cPrice = courseDTO.getcPrice();
		String cImage = courseDTO.getcImage();
		String cSTARTDATE = courseDTO.getcStartDate();
		String cENDDATE = courseDTO.getcEndDate();
		int cTOTALDATE = courseDTO.getcTotalDate();
		String userId = dto.getUserID();
		String userName = dto.getUserName();
		String phoneNum = dto.getPhoneNum();
		String email1 = dto.getEmail1();
		String email2 = dto.getEmail2();

		// orderC DTO 객체 생성
		OrderCDTO oDTO = new OrderCDTO(0, cName, cCode, cPrice, cImage, cSTARTDATE, cENDDATE, cTOTALDATE, userId,
				userName, phoneNum, email1, email2, payMethod, null);
		
		// 주문테이블 insert
		service.insertOrderC(oDTO);
		
		// 회원 cCode 정보 update
		memberService.updateCcode(oDTO);
		
		// 모달창 메세지 전달
		rttr.addFlashAttribute("result", "[" + cName + "] 수강신청이 완료되었습니다.");
		
		return  "redirect:../main";
	}
	

}
