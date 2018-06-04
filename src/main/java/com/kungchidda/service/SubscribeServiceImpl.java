package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.persistence.SubscribeDAO;
import com.kungchidda.persistence.UserDAO;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Inject
	private SubscribeDAO subscribeDAO;
	
	@Inject
	private UserDAO userDAO;
	
	@Transactional
	@Override
	public void addSubscribed(SubscribeVO vo) throws Exception{
		subscribeDAO.create(vo);
		userDAO.updateSubscribedCnt(vo.getSubscribed());
		userDAO.updateSubscriberCnt(vo.getSubscriber());
	}
	
	@Override
	public List<SubscribeVO> listSubscribe(SubscribeVO vo) throws Exception {
		return subscribeDAO.listSubscribe(vo);
	}
	
	@Override
	public List<SubscribeVO> listSubscriber(SubscribeVO vo) throws Exception {
		return subscribeDAO.listSubscriber(vo);
	}

	@Transactional
	@Override
	public void removeSubscribed(SubscribeVO vo) throws Exception{
		//likeDAO.getBno(vo);
		subscribeDAO.delete(vo);
		//boardDAO.updateLikeCnt(vo.getBno());
		userDAO.updateSubscribedCnt(vo.getSubscribed());
		userDAO.updateSubscriberCnt(vo.getSubscriber());
		
	}

	@Override
	public List<SubscribeVO> listSubscribedPage(Integer bno, Criteria cri) throws Exception {
		return subscribeDAO.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return subscribeDAO.count(bno);
	}

}
