package com.kungchidda.service;



import java.util.List;

import javax.inject.Inject;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.WithdrawVO;
import com.kungchidda.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
//	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adminDAO;
	
	
	@Override
	public List<PayVO> payHistoryList(SearchCriteria cri) throws Exception{
		return adminDAO.payHistoryList(cri);
	}
	
	@Override
	public int payHistoryListCount(SearchCriteria cri) throws Exception {
		return adminDAO.payHistoryListCount(cri);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public PayVO payHistoryRead(Integer pno) throws Exception{
		return adminDAO.payHistoryRead(pno);
	}
	
	@Override
	public List<WithdrawVO> withdrawHistoryList(SearchCriteria cri) throws Exception{
		return adminDAO.withdrawHistoryList(cri);
	}
	
	@Override
	public int withdrawHistoryListCount(SearchCriteria cri) throws Exception {
		return adminDAO.withdrawHistoryListCount(cri);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public WithdrawVO withdrawHistoryRead(Integer wno) throws Exception{
		return adminDAO.withdrawHistoryRead(wno);
	}
	
	@Override
	public List<WithdrawVO> withdrawHistoryReadAttach(Integer wno) throws Exception{
		return adminDAO.withdrawHistoryReadAttach(wno);
	}
	
	@Transactional
	@Override
	public WithdrawVO withdrawModify(WithdrawVO withdrawVO) throws Exception{

		adminDAO.withdrawModify(withdrawVO);
		
		return withdrawVO;
	}
	
}
