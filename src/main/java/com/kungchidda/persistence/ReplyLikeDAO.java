package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.ReplyLikeVO;
import com.kungchidda.domain.ReplyVO;

public interface ReplyLikeDAO {

	public List<ReplyLikeVO> listReply(ReplyLikeVO vo) throws Exception;
	public List<ReplyLikeVO> listReplyPage(Integer bno, Criteria cri) throws Exception;
	public List<ReplyVO> infoReplyLike(Integer bno) throws Exception;
	public void create(ReplyLikeVO vo) throws Exception;
	public void delete(ReplyLikeVO vo) throws Exception;
	
	public int count(Integer bno) throws Exception;
	public int getRno(ReplyLikeVO vo) throws Exception;
	
}
