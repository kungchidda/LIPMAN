package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.ReplyLikeVO;
import com.kungchidda.domain.ReplyVO;

public interface ReplyLikeService {
	
	public void addReplyLike(ReplyLikeVO vo) throws Exception;
	public List<ReplyLikeVO> listReplyLike(ReplyLikeVO vo) throws Exception;
	public List<ReplyVO> infoReplyLike(Integer rno) throws Exception;
	public void removeReplyLike(ReplyLikeVO vo) throws Exception;
	
	//댓글 페이징 추가
	public List<ReplyLikeVO> listReplyLikePage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;

}
