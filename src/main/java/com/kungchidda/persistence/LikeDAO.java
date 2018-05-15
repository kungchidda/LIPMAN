package com.kungchidda.persistence;

import java.util.List;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.LikeVO;

public interface LikeDAO {

	public List<LikeVO> listPage(Integer bno, Criteria cri) throws Exception;
	public void create(LikeVO vo) throws Exception;
	public void delete(Integer lno) throws Exception;
	
	public int count(Integer bno) throws Exception;
	public int getBno(Integer lno) throws Exception;
	
}
