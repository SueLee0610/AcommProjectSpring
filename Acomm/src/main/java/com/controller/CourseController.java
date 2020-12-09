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

import com.dto.CourseDTO;
import com.dto.ReplyDTO;
import com.service.CourseService;
import com.service.ReplyService;

@Controller
public class CourseController {

	@Autowired
	CourseService service;

	@Autowired
	ReplyService replyService;

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
	public ModelAndView CourseRetrieve(@RequestParam int cCode) {

		// age 정보 가져오기 위해 cCode 파싱
		List<Integer> scoreList = service.selectScore(cCode);

		// age, score 레코드 받아와서 list에 저장
		List<Integer> ageList = service.selectAge(cCode);

		// 해당 cCode로 가입한 멤버 수가져오기
		int currentStudNum = service.currentStudNum(cCode);

		List<ReplyDTO> replyList = replyService.selectReplyList(cCode);

		ModelAndView mav = new ModelAndView();
		mav.addObject("ageList", ageList);
		mav.addObject("scoreList", scoreList);
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

}
