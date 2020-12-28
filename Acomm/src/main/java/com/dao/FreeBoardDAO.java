package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.FreeBoardDTO;
import com.dto.PageDTO;

@Repository
public class FreeBoardDAO {
	
	@Autowired
	SqlSessionTemplate template;

	//전체 리스트 보기
	public PageDTO selectFreeBoard(HashMap<String, String> map, int curPage) {
		PageDTO result = new PageDTO();
		
		int perPage = result.getPerPage(); 
		int offset = (curPage-1)*perPage;
		
		List<FreeBoardDTO> list = template.selectList("FreeBoardMapper.selectFreeBoard",map, new RowBounds(offset, perPage));
		result.setCurPage(curPage);
		result.setList(list);
		result.setTotalCount(totalCount(template, map));
		return result;
	}
	
	//검색
	public PageDTO search(HashMap<String, String> map, int curPage) {
		PageDTO result = new PageDTO();
		
		int perPage = result.getPerPage(); 
		int offset = (curPage-1)*perPage;
		
		List<FreeBoardDTO> list = template.selectList("FreeBoardMapper.search",map, new RowBounds(offset, perPage));
		result.setCurPage(curPage);
		result.setList(list);
		result.setTotalCount(totalCount(template, map));
		return result;
	}	

	//전체 게시글 수
	private int totalCount(SqlSessionTemplate template, HashMap<String, String> map) {
		return template.selectOne("FreeBoardMapper.totalCount", map);
	}

	//자세히 보기
	public FreeBoardDTO retrieve(int num) {
		FreeBoardDTO result = template.selectOne("FreeBoardMapper.retrieve", num);
		return result;
	}

	//삭제
	public int delete(int num) {
		int result = template.delete("FreeBoardMapper.delete", num);
		return result;
	}

	//수정
	public int update(FreeBoardDTO fDTO) {
		int result = template.update("FreeBoardMapper.update", fDTO);
		return result;
	}

	//조회수
	public FreeBoardDTO selectByNum(int num) {
		readCnt(template, num);
		FreeBoardDTO result = template.selectOne("FreeBoardMapper.selectByNum", num);
		return result;
	}
	
	//조회수
	private void readCnt(SqlSessionTemplate template, int num) {
		template.update("FreeBoardMapper.readCnt", num);
	}

	//게시글 등록
	public int insert(FreeBoardDTO fDTO) {
		int result = template.insert("FreeBoardMapper.insert", fDTO);
		return result;
	}
	
	// (마이페이지에서 사용하기위한)아이디로 게시글 찾기 
	public List<FreeBoardDTO> selectMyFreeBoard(String userid){
		List<FreeBoardDTO> result = template.selectList("FreeBoardMapper.selectMyFreeBoard",userid);
		return result;
	}

	public List<FreeBoardDTO> selectFreeBoard() {
		List<FreeBoardDTO> result = template.selectList("FreeBoardMapper.selectFreeBoard");
		return result;
	}

}
