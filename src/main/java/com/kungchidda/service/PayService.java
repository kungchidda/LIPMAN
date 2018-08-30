package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;

public interface PayService {
	
	public PayVO payments(PayVO payVO) throws Exception;
	public void execute(String orderNo) throws Exception;
	public List<PayVO> payHistory(PayVO payVO, SearchCriteria cri) throws Exception;
	public int payHistoryCount(PayVO payVO) throws Exception;
	public int totalPoint(PayVO payVO) throws Exception;
	public int checkUserBuy(Integer bno, String uid) throws Exception;
}
