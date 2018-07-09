package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.TitleVO;

public interface TitleDAO {

	public void create(TitleVO vo) throws Exception;
	public void insertGenre(TitleVO vo) throws Exception;
	public void modifyGenre(TitleVO vo) throws Exception;
	public void deleteGenre(TitleVO vo) throws Exception;
	public void add(TitleVO vo) throws Exception;
	public TitleVO read(Integer tno) throws Exception;
	public void update(TitleVO vo) throws Exception;
	public void delete(Integer tno) throws Exception;
	public List<TitleVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	public void updateViewCnt(Integer bno) throws Exception;
	
	public void addAttach(String titleFullName) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	public void deleteAttach(Integer tno) throws Exception;
	public void replaceAttach(String fullName, Integer tno) throws Exception;
	public void deleteBoardAll(Integer tno) throws Exception;
}
