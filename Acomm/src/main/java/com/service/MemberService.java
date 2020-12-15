package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;
import com.dto.OrderCDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	public void memberAdd(MemberDTO member) {
		dao.memberAdd(member); // DTO 전달
	}
	
	public int idCheck(String userID) {
		int result = dao.idCheck(userID);
		return result;
	}

	public MemberDTO login(Map<String, String> map) {
		MemberDTO result = dao.login(map);
		return result;
	}

	public MemberDTO myPage(String userID) {
		MemberDTO dto = dao.myPage(userID);
		return dto;
	}

	public void memberUpdate(MemberDTO member) {
		dao.memberUpdate(member);
	}
  
	public String myPageCName(int cCode) {
		String result = dao.myPageCName(cCode);
		return result;
	}
	
	public int updateCcode(OrderCDTO dto) {
		int result =  dao.updateCcode(dto);
		return result;
	}

	public String idSearch(MemberDTO dto) {
		String result = dao.idSearch(dto);
		return result;
	}
}
