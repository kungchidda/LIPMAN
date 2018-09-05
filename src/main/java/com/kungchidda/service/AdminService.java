package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.WithdrawVO;

public interface AdminService {
	
	public List<PayVO> payHistoryList(SearchCriteria cri) throws Exception;
	public int payHistoryListCount(SearchCriteria cri) throws Exception;
	public PayVO payHistoryRead(Integer pno) throws Exception;
	
	public List<WithdrawVO> withdrawHistoryList(SearchCriteria cri) throws Exception;
	public int withdrawHistoryListCount(SearchCriteria cri) throws Exception;
	public WithdrawVO withdrawHistoryRead(Integer wno) throws Exception;
	public List<WithdrawVO> withdrawHistoryReadAttach(Integer wno) throws Exception;
	
	public WithdrawVO withdrawModify(WithdrawVO withdrawVO) throws Exception;
}
