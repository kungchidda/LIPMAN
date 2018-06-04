package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.ReplyLikeVO;
import com.kungchidda.domain.ReplyVO;
import com.kungchidda.persistence.ReplyDAO;
import com.kungchidda.persistence.ReplyLikeDAO;

@Service
public class ReplyLikeServiceImpl implements ReplyLikeService {
	
	
	@Inject
	private ReplyLikeDAO replyLikeDAO;
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Transactional
	@Override
	public void addReplyLike(ReplyLikeVO vo) throws Exception{
		replyLikeDAO.create(vo);
		replyDAO.updateReplyLikeCnt(vo.getRno());
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
