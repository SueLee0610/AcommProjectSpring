package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReplyDAO;
import com.dto.ReplyDTO;


@Service
public class ReplyService {
	
	@Autowired
	ReplyDAO dao;

	public List<ReplyDTO> selectReplyList(int cCode) {
		List<ReplyDTO> list = dao.selectReplyList(cCode);
		return list;
	}
	
	public int insertReply(ReplyDTO dto) {
		int result = dao.insertReply(dto);
		return result;
	}
	
	public ReplyDTO selectReplyParent(int reNO) {
		ReplyDTO dto = dao.selectReplyParent(reNO);
		return dto;
	}
	
	public int updateReplyOrder(HashMap<String, Integer> map) {
		int result = dao.updateReplyOrder(map);
		return result;
	}
	
	public int selectReplyMaxReOrder(int cCode) {
		int result = dao.selectReplyMaxReOrder(cCode);
		return result;
	}
	
	public int insertReplyWOParent(ReplyDTO dto) {
		int result = dao.insertReplyWOParent(dto);
		return result;
	}
	
	public int selectReplyMaxReParent(int cCode) {
		int result = dao.selectReplyMaxReParent(cCode);
		return result;
	}
	
	public int updateReplyContent(HashMap<String, String> map) {
		int result = dao.updateReplyContent(map);
		return result;
	}
	
	public int updateParentFlagToN(int reNO) {
		int result = dao.updateParentFlagToN(reNO);
		return result;
	}
	
	public int deleteReply(int reNO) {
		int result = dao.deleteReply(reNO);
		return result;
	}
	
	public int updateReOrderAfterDelete(int reNO) {
		int result = dao.updateReOrderAfterDelete(reNO);
		return result;
	}
	
	public ReplyDTO selectByReNO(int reNO) {
		ReplyDTO dto = dao.selectByReNO(reNO);
		return dto;
	}
	
	public int selectCountByReParent(int reParent) {
		int result = dao.selectCountByReParent(reParent);
		return result;
	}
	
	public int updateParentFlagToY(int reParent) {
		int result = dao.updateParentFlagToY(reParent);
		return result;
	}
}
