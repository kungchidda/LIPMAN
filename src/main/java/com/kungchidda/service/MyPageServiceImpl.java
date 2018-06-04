package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.MyPageVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.persistence.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Inject
	private MyPageDAO dao;
	
	@Transactional
	@Override
	public void regist(MyPageVO myPage) throws Exception{
		dao.create(myPage);
		
		String[] files = myPage.getFiles();
		
		if(files != null) {
			for(String fileName : files) {
				dao.addAttach(fileName);
			}
		}
		dao.add(myPage);
	}
	

	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public MyPageVO read(Integer bno) throws Exception{
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(MyPageVO myPage) throws Exception{
		dao.update(myPage);
		Integer bno = myPage.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = myPage.getFiles();
		
		if(files !=null) {
			for(String fileName : files) {
				dao.replaceAttach(fileName, bno);
			}
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception{
		dao.deleteAttach(bno);
		dao.deleteReplyAll(bno);
		dao.delete(bno);
	}
	
	
	@Override
	public List<MyPageVO> listSearchCriteria(String uid,  SearchCriteria cri) throws Exception{
		return dao.listSearch(uid, cri);
	}
	@Override
	public List<MyPageVO> listSubscribedSearchCriteria(String uid,  SearchCriteria cri) throws Exception{
		return dao.listSubscribedSearch(uid, cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception{
		return dao.getAttach(bno);
	}
	
}
