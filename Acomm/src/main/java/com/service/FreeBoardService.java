package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FreeBoardDAO;
import com.dto.FreeBoardDTO;
import com.dto.PageDTO;

@Service
public class FreeBoardService {
	
	@Autowired
	FreeBoardDAO dao;

	//전체 리스트 보기
	public PageDTO selectFreeBoard(int curPage) {
		HashMap<String, String> map = new HashMap<String, String>();
		PageDTO result = dao.selectFreeBoard(map, curPage);
		return result;
	}
	
	//검색
	public PageDTO search(String searchName, String searchValue, int curPage) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		PageDTO result = dao.search(map, curPage);
		return result;
	}

	//자세히 보기
	public FreeBoardDTO retrieve(int num) {
		FreeBoardDTO result = dao.retrieve(num);
		return result;
	}

	//삭제
	public void delete(int num) {
		dao.delete(num);
	}

	//수정
	public void update(FreeBoardDTO fDTO) {
		dao.update(fDTO);
	}
	
	//
	public FreeBoardDTO selectByNum(int num) {
		FreeBoardDTO result = dao.selectByNum(num);
		return result;
	}

	// 게시글 등록
	public void insert(FreeBoardDTO fDTO) {
		dao.insert(fDTO);
	}
	
	// (마이페이지에서 사용하기위한)아이디로 게시글 찾기 
	public List<FreeBoardDTO> selectMyFreeBoard(String userid){
		List<FreeBoardDTO> result = dao.selectMyFreeBoard(userid);
		return result;
	}

	public List<FreeBoardDTO> selectFreeBoard() {
		List<FreeBoardDTO> list = dao.selectFreeBoard();
		return list;
	}
	

}
