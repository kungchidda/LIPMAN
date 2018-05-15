package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SearchCriteria;

public interface BoardService {

	public void regist(BoardVO board) throws Exception;
	//public void add(BoardVO board) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void modify(BoardVO board) throws Exception;
	public void remove(Integer bno) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	
	public List<BoardVO> infiniteScrollDown(Integer bnoToStart) throws Exception;
	public List<BoardVO> infiniteScrollUp(Integer bnoToStart) throws Exception;
	
}
