package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.LikeVO;

@Repository
public class LikeDAOImpl implements LikeDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.likeMapper";

	
	@Override
	public void create(LikeVO vo) throws Exception{
		session.insert(namespace + ".create", vo);
	}
	
	
	@Override
	public void delete(Integer rno) throws Exception {
		session.update(namespace + ".delete", rno);
	}
	
	@Override
	public List<LikeVO> listPage(Integer bno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(namespace + ".count", bno);
	}
	
	@Override
	public int getBno(Integer lno) throws Exception{
		return session.selectOne(namespace + ".getBno" , lno);
	}
}
