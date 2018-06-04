package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.LikeVO;

public interface LikeDAO {

	public List<LikeVO> list(LikeVO vo) throws Exception;
	public List<LikeVO> listPage(Integer bno, Criteria cri) throws Exception;
	public List<BoardVO> infoLike(Integer bno) throws Exception;
	public void create(LikeVO vo) throws Exception;
	public void delete(LikeVO vo) throws Exception;
	
	public int count(Integer bno) throws Exception;
	public int getBno(LikeVO vo) throws Exception;
	
	
}
