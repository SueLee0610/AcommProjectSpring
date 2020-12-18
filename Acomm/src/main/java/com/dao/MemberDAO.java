package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;
import com.dto.OrderCDTO;

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

	public int memberUpdate(MemberDTO member) {
		int num = template.update("MemberMapper.memberUpdate", member);
		return num;
	}
	
	public String myPageCName(int cCode) {
		String result = template.selectOne("MemberMapper.myPageCName", cCode);
		return result;
	}
	
	public int updateCcode(OrderCDTO dto) {
		int result = template.update("MemberMapper.updateCcode", dto);
		return result;
	}

	public String idSearch(MemberDTO dto) {
		String result = template.selectOne("MemberMapper.idSearch", dto);
		return result;
	}
}
