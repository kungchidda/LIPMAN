package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SubscribeVO;

@Repository
public class SubscribeDAOImpl implements SubscribeDAO{
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.subscribeMapper";

	@Override
	public List<SubscribeVO> listSubscribe(SubscribeVO vo) throws Exception{
		return session.selectList(namespace + ".listSubscribe", vo);
	}
	
	
	@Override
	public void create(SubscribeVO vo) throws Exception{
		session.insert(namespace + ".create", vo);
	}
	
	
	@Override
	public void delete(SubscribeVO vo) throws Exception {
		session.update(namespace + ".delete", vo);
	}
	
	@Override
	public List<SubscribeVO> listPage(Integer bno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public int count(SubscribeVO vo) throws Exception {
		return session.selectOne(namespace + ".count", vo);
	}
	
	@Override
	public int getBno(SubscribeVO vo) throws Exception{
		return session.selectOne(namespace + ".getBno" , vo.getSno());
	}

}
