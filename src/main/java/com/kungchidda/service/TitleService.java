package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.TitleVO;

public interface TitleService {
	
	public void regist(TitleVO title) throws Exception;
	public TitleVO read(Integer tno) throws Exception;
	public void modify(TitleVO title) throws Exception;
	public void remove(Integer tno) throws Exception;
	
	public List<TitleVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<BoardVO> getAttach(Integer tno) throws Exception;

}
