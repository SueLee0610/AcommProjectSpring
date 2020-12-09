package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ReplyDTO;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<ReplyDTO> selectReplyList(int cCode) {
		List<ReplyDTO> list = template.selectList("ReplyMapper.selectReplyList", cCode);
		return list;
	}

	public int insertReply(ReplyDTO dto) {
		int result = template.insert("ReplyMapper.insertReply", dto);
		return result;
	}	
	
	public ReplyDTO selectReplyParent(int reNO) {
		ReplyDTO dto = template.selectOne("ReplyMapper.selectReplyParent", reNO);
		return dto;
	}

	public int updateReplyOrder(HashMap<String, Integer> map) {
		int result = template.update("ReplyMapper.updateReplyOrder", map);
		return result;
	}

	public int selectReplyMaxReOrder(int cCode) {
		int maxReOrder = template.selectOne("ReplyMapper.selectReplyMaxReOrder", cCode);
		return maxReOrder;
	}

	public int insertReplyWOParent(ReplyDTO dto) {
		int result = template.insert("ReplyMapper.insertReplyWOParent", dto);
		return result;
	}

	public int selectReplyMaxReParent(int cCode) {
		int maxReParent = template.selectOne("ReplyMapper.selectReplyMaxReParent", cCode);
		return maxReParent;
	}

	public int updateReplyContent(HashMap<String, String> map) {
		int result = template.update("ReplyMapper.updateReplyContent", map);
		return result;
	}

	public int updateParentFlagToN(int reNO) {
		int result = template.update("ReplyMapper.updateParentFlagToN", reNO);
		return result;
	}

	public int deleteReply(int reNO) {
		int result = template.delete("ReplyMapper.deleteReply", reNO);
		return result;
	}

	public int updateReOrderAfterDelete(int reNO) {
		int result = template.update("ReplyMapper.updateReOrderAfterDelete", reNO);
		return result;
	}

	public ReplyDTO selectByReNO(int reNO) {
		ReplyDTO dto = template.selectOne("ReplyMapper.selectByReNO", reNO);
		return dto;
	}

	public int selectCountByReParent(int reParent) {
		int result = template.selectOne("ReplyMapper.selectCountByReParent", reParent);
		return result;
	}

	public int updateParentFlagToY(int reParent) {
		int result = template.update("ReplyMapper.updateParentFlagToY", reParent);
		return result;
	}
}
