package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

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
}
