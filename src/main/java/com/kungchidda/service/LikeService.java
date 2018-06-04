package com.kungchidda.service;

import java.util.List;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.LikeVO;

public interface LikeService {
	
	public void addLike(LikeVO vo) throws Exception;
	public List<LikeVO> listLike(LikeVO vo) throws Exception;
	public List<BoardVO> infoLike(Integer bno) throws Exception;
	public void removeLike(LikeVO vo) throws Exception;
	
	//댓글 페이징 추가
	public List<LikeVO> listLikePage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;

}
