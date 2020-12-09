package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;

	public void memberAdd(MemberDTO member) {
		int result = template.insert("MemberMapper.memberAdd", member);
	}

	public int idCheck(String userID) {
		int result = template.selectOne("MemberMapper.idCheck", userID);
		return result;
	}

	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = template.selectOne("MemberMapper.login", map);
		return dto;
	}

	public MemberDTO myPage(String userID) {
		MemberDTO dto = template.selectOne("MemberMapper.myPage", userID);
		return dto;
	}

	public void memberUpdate(MemberDTO member) {
		template.update("MemberMapper.memberUpdate", member);
	}
	
	public String myPageCName(int cCode) {
		String result = template.selectOne("MemberMapper.myPageCName", cCode);
		return result;
	}
}
