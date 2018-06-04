package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubscribeVO;

public interface SubscribeDAO {

	public List<SubscribeVO> listSubscribe(SubscribeVO vo) throws Exception;
	public List<SubscribeVO> listSubscriber(SubscribeVO vo) throws Exception;
	public List<SubscribeVO> listPage(Integer bno, Criteria cri) throws Exception;
	public void create(SubscribeVO vo) throws Exception;
	public void delete(SubscribeVO vo) throws Exception;
	
	public int count(Integer bno) throws Exception;
	public int getBno(SubscribeVO vo) throws Exception;
	
}
