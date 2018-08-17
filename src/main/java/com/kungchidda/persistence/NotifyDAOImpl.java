package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.ReplyVO;
import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.domain.UserVO;

@Repository
public class NotifyDAOImpl implements NotifyDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.notifyMapper";
	
	
	@Override
	public void create(NotifyVO vo) throws Exception{
		session.insert(namespace + ".create", vo);
	}
	
	@Override
	public void update(NotifyVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}
	
	@Override
	public List<NotifyVO> listPage(NotifyVO vo, Criteria cri) throws Exception {
		
		String receiver = vo.getReceiver();
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("receiver", receiver);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public int count(NotifyVO vo) throws Exception {
//		String receiver = vo.getReceiver();
		return session.selectOne(namespace + ".count", vo);
	}
	

	@Override
	public void updateNotifyCnt(NotifyVO vo) throws Exception {
//		String receiver = vo.getReceiver();
		session.update(namespace + ".updateNotifyCnt", vo);
	}

	@Override
	public BoardVO checkBoardForNotify(BoardVO boardVO) throws Exception{
		return session.selectOne(namespace + ".checkBoardForNotify", boardVO);
	}
	
	@Override
	public ReplyVO checkReplyForNotify(ReplyVO replyVO) throws Exception{
		return session.selectOne(namespace + ".checkReplyForNotify", replyVO);
	}
	
	@Override
	public UserVO checkUserForNotify(UserVO userVO) throws Exception{
		return session.selectOne(namespace + ".checkUserForNotify", userVO);
	}
	
	@Override
	public List<SubscribeVO> checkSubscriberForNotify(SubscribeVO subscribeVO) throws Exception{
		return session.selectList(namespace + ".checkSubscriberForNotify", subscribeVO);
	}
	
	@Override
	public void removeNotify(NotifyVO vo) throws Exception{
		session.update(namespace + ".removeNotify", vo);
	}
	
	@Override
	public void removeAllNotify(NotifyVO vo) throws Exception{
		session.update(namespace + ".removeAllNotify", vo);
	}
	
	@Override
	public int getLastInsertBno(String uid) throws Exception{
		return session.selectOne(namespace + ".getLastInsertId", uid);
	}
	
	@Override
	public void readNotify(NotifyVO vo) throws Exception{
		session.update(namespace + ".readNotify", vo);
	}
	@Override
	public void deleteNotify(NotifyVO vo) throws Exception{
		session.update(namespace + ".deleteNotify", vo);
	}
	
	@Override
	public void deleteAllNotify(NotifyVO vo) throws Exception{
		session.update(namespace + ".deleteAllNotify", vo);
	}
}
