package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.MyPageVO;
//import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SearchCriteria;

public interface MyPageService {

	public void regist(MyPageVO myPage) throws Exception;
	public MyPageVO read(Integer bno) throws Exception;
	public void modify(MyPageVO myPage) throws Exception;
	public void remove(Integer bno) throws Exception;
	
	public List<MyPageVO> listSearchCriteria(String uid, SearchCriteria cri) throws Exception;
	public List<MyPageVO> listSubscribedSearchCriteria(String uid, SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	
}
