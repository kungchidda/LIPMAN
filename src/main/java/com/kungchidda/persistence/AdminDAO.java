package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.WithdrawVO;

public interface AdminDAO {
	
	public List<PayVO> payHistoryList(SearchCriteria cri) throws Exception;
	public int payHistoryListCount(SearchCriteria cri) throws Exception;
	public PayVO payHistoryRead(Integer pno) throws Exception;
	
	public List<WithdrawVO> withdrawHistoryList(SearchCriteria cri) throws Exception;
	public int withdrawHistoryListCount(SearchCriteria cri) throws Exception;
	public WithdrawVO withdrawHistoryRead(WithdrawVO withdrawVO) throws Exception;
	public List<WithdrawVO> withdrawHistoryReadAttach(WithdrawVO withdrawVO) throws Exception;
	
	public void withdrawModify(WithdrawVO withdrawVO) throws Exception;
	public void withdrawComplete(PayVO payVO) throws Exception;
}
