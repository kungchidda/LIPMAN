package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.persistence.NotifyDAO;

@Service
public class NotifyServiceImpl implements NotifyService {
	
	@Inject
	private NotifyDAO notifyDAO;
	

	@Transactional
	@Override
	public void removeNotify(NotifyVO vo) throws Exception{
		notifyDAO.removeNotify(vo);
	}
	
	@Transactional
	@Override
	public void removeAllNotify(NotifyVO vo) throws Exception{
		notifyDAO.removeAllNotify(vo);
	}

	@Override
	public List<NotifyVO> notifyList(NotifyVO vo, Criteria cri) throws Exception {
		return notifyDAO.listPage(vo, cri);
	}
	
	@Override
	public int count(NotifyVO vo) throws Exception {
		return notifyDAO.count(vo);
	}
	
	@Override
	public int checkNewNotify(NotifyVO vo) throws Exception {
		return notifyDAO.checkNewNotify(vo);
	}
	
	@Override
	public void readNotify(NotifyVO vo) throws Exception{
		notifyDAO.readNotify(vo);
	}
	
	@Override
	public void deleteNotify(NotifyVO vo) throws Exception{
		notifyDAO.deleteNotify(vo);
	}
	
	@Override
	public void deleteAllNotify(NotifyVO vo) throws Exception{
		notifyDAO.deleteAllNotify(vo);
	}
	
}
