package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.ReplyVO;
import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.domain.UserVO;

public interface NotifyDAO {
	// ReplyDAO는 우선적으로 필요한 댓글의 리스트와 댓글 등록, 수정, 삭제 기능을 정의
	public void create(NotifyVO vo) throws Exception;
	public void update(NotifyVO vo) throws Exception;
	
	public void removeNotify(NotifyVO vo) throws Exception;
	public void removeAllNotify(NotifyVO vo) throws Exception;
	

	// 페이징 처리를 하기 위해 Criteria cri 파라미터 추가
	public List<NotifyVO> listPage(NotifyVO vo, Criteria cri) throws Exception;
	// 페이징 처리를 하기 위해 count 추가
	public int count(NotifyVO vo) throws Exception;
	public int checkNewNotify(NotifyVO vo) throws Exception;
	
	public void updateNotifyCnt(NotifyVO vo) throws Exception;
	
	
	
	public BoardVO checkBoardForNotify(BoardVO boardVO) throws Exception;
	public ReplyVO checkReplyForNotify(ReplyVO replyVO) throws Exception;
	public UserVO checkUserForNotify(UserVO userVO) throws Exception;
	public List<SubscribeVO> checkSubscriberForNotify(SubscribeVO subscribeVO) throws Exception;
	
	public int getLastInsertBno(String uid) throws Exception;
	public void readNotify(NotifyVO vo) throws Exception;
	public void deleteNotify(NotifyVO vo) throws Exception;
	public void deleteAllNotify(NotifyVO vo) throws Exception;
	
}
