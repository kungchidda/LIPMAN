package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.ReplyLikeVO;
import com.kungchidda.domain.ReplyVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.persistence.NotifyDAO;
import com.kungchidda.persistence.ReplyDAO;
import com.kungchidda.persistence.ReplyLikeDAO;

@Service
public class ReplyLikeServiceImpl implements ReplyLikeService {
	
	
	@Inject
	private ReplyLikeDAO replyLikeDAO;
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private NotifyDAO notifyDAO;
	
	@Transactional
	@Override
	public void addReplyLike(ReplyLikeVO vo) throws Exception{
		replyLikeDAO.create(vo);
		replyDAO.updateReplyLikeCnt(vo.getRno());
		
		NotifyVO notifyVO = new NotifyVO();
		ReplyVO replyVO = new ReplyVO();
		UserVO userVO = new UserVO();
		
		replyVO.setRno(vo.getRno());
		replyVO = notifyDAO.checkReplyForNotify(replyVO);
		userVO.setUid(vo.getUid());
		userVO = notifyDAO.checkUserForNotify(userVO);
		
		notifyVO.setSender(vo.getUid());
		notifyVO.setReceiver(replyVO.getUid());
		
		if(!notifyVO.getSender().equals(notifyVO.getReceiver()) && vo.getRlpo() == 1) {
			notifyVO.setType("lno");
			notifyVO.setNotifyThumbnail("/noty2.jpg");
			notifyVO.setUrl("/sboard/readPage?bno="+replyVO.getBno());
//				notifyVO.setContents(userVO.getUname()+"님이 " + replyVO.getReplytext() + "을 좋아합니다. ");
				notifyVO.setContents(replyVO.getReplytext() + "을 좋아합니다. ");
				notifyDAO.create(notifyVO);
			}
//			else {
//				notifyVO.setContents(userVO.getUname()+"님이 " + replyVO.getReplytext() + "을 싫어합니다. ");
//			}
			
	}
	
	@Override
	public List<ReplyLikeVO> listReplyLike(ReplyLikeVO vo) throws Exception {
		return replyLikeDAO.listReply(vo);
	}
	
	@Override
	public List<ReplyVO> infoReplyLike(Integer rno) throws Exception {
		return replyLikeDAO.infoReplyLike(rno);
	}

	@Transactional
	@Override
	public void removeReplyLike(ReplyLikeVO vo) throws Exception{
		//likeDAO.getBno(vo);
		replyLikeDAO.delete(vo);
		replyDAO.updateReplyLikeCnt(vo.getRno());
		
	}

	@Override
	public List<ReplyLikeVO> listReplyLikePage(Integer bno, Criteria cri) throws Exception {
		return replyLikeDAO.listReplyPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return replyLikeDAO.count(bno);
	}

}
