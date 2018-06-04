package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubscribeVO;

public interface SubscribeService {

	public void addSubscribed(SubscribeVO vo) throws Exception;
	public List<SubscribeVO> listSubscribe(SubscribeVO vo) throws Exception;
	public List<SubscribeVO> listSubscriber(SubscribeVO vo) throws Exception;
	public void removeSubscribed(SubscribeVO vo) throws Exception;
	
	//페이징 추가
	public List<SubscribeVO> listSubscribedPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
}
