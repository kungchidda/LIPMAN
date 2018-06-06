package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.TitleVO;
import com.kungchidda.persistence.TitleDAO;

@Service
public class TitleServiceImpl implements TitleService{

	@Inject
	private TitleDAO dao;
	
	@Transactional
	@Override
	public void regist(TitleVO title) throws Exception{
		
		dao.create(title);
		
		String[] files = title.getFiles();
		
		if(files != null) {
			for(String fileName : files) {
				dao.addAttach(fileName);
			}
		}
		//dao.add(title);
	}
	

	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public TitleVO read(Integer tno) throws Exception{
		return dao.read(tno);
	}

	@Transactional
	@Override
	public void modify(TitleVO title) throws Exception{
		dao.update(title);
		Integer bno = title.getTno();
		
		dao.deleteAttach(bno);
		
		String[] files = title.getFiles();
		
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
		dao.deleteBoardAll(bno);
		dao.delete(bno);
	}
	
	
	@Override
	public List<TitleVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearch(cri);
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
