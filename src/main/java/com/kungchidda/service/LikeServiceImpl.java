package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.LikeVO;
import com.kungchidda.persistence.BoardDAO;
import com.kungchidda.persistence.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Inject
	private LikeDAO likeDAO;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addLike(LikeVO vo) throws Exception{
		likeDAO.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(), 1);
	}

	@Transactional
	@Override
	public void removeLike(Integer rno) throws Exception{
		int bno = likeDAO.getBno(rno);
		likeDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public List<LikeVO> listLikePage(Integer bno, Criteria cri) throws Exception {
		return likeDAO.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return likeDAO.count(bno);
	}

}
