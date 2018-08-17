package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;

public interface NotifyService {
	
	public void removeNotify(NotifyVO vo) throws Exception;
	public void removeAllNotify(NotifyVO vo) throws Exception;
	
	//댓글 페이징 추가
	public List<NotifyVO> notifyList(NotifyVO vo, Criteria cri) throws Exception;
	public int count(NotifyVO vo) throws Exception;
	
	public void readNotify(NotifyVO vo) throws Exception;
	public void deleteNotify(NotifyVO vo) throws Exception;
	
	public void deleteAllNotify(NotifyVO vo) throws Exception;

}
