package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.persistence.NotifyDAO;
import com.kungchidda.persistence.SubscribeDAO;
import com.kungchidda.persistence.UserDAO;

@Service
public class SubscribeServiceImpl implements SubscribeService {
	
	@Inject
	private SubscribeDAO subscribeDAO;
	
	@Inject
	private UserDAO userDAO;
	
	@Inject
	private NotifyDAO notifyDAO;
	
	@Transactional
	@Override
	public void addSubscribed(SubscribeVO vo) throws Exception{
		subscribeDAO.create(vo);
		
		userDAO.updateSubscribedCnt(vo.getSubscribed());
		userDAO.updateSubscriberCnt(vo.getSubscriber());
		
		NotifyVO notifyVO = new NotifyVO();
		UserVO userVO = new UserVO();
		
		userVO.setUid(vo.getSubscriber());
		userVO = notifyDAO.checkUserForNotify(userVO);
		
		notifyVO.setSender(vo.getSubscriber());
		notifyVO.setReceiver(vo.getSubscribed());

		if(!notifyVO.getSender().equals(notifyVO.getReceiver())) {
			
		
			notifyVO.setType("sno");
			notifyVO.setContents(userVO.getUname() + "님이 회원님을 구독하였습니다.");
			if(userVO.getProfileFullName() == null) {
				userVO.setProfileFullName("/account.png");
			}
			notifyVO.setNotifyThumbnail(userVO.getProfileFullName());
			notifyVO.setUrl("/mypage/titleList?uid="+userVO.getUid());
			
			notifyDAO.create(notifyVO);
		}
	}
	
	@Override
	public List<SubscribeVO> listSubscribe(SubscribeVO vo) throws Exception {
		return subscribeDAO.listSubscribe(vo);
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
	public int count(SubscribeVO vo) throws Exception {
		return subscribeDAO.count(vo);
	}

}
