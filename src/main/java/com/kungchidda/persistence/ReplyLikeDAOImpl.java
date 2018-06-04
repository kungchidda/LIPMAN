package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.ReplyLikeVO;
import com.kungchidda.domain.ReplyVO;

@Repository
public class ReplyLikeDAOImpl implements ReplyLikeDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.replyLikeMapper";

	@Override
	public List<ReplyLikeVO> listReply(ReplyLikeVO vo) throws Exception{
		return session.selectList(namespace + ".listReply", vo);
	}
	
	@Override
	public List<ReplyVO> infoReplyLike(Integer rno) throws Exception{
		return session.selectList(namespace + ".infoReplyLike", rno);
	}
	
	@Override
	public void create(ReplyLikeVO vo) throws Exception{
		session.insert(namespace + ".create", vo);
	}
	
	
	@Override
	public void delete(ReplyLikeVO vo) throws Exception {
		session.update(namespace + ".delete", vo);
	}
	
	@Override
	public List<ReplyLikeVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		
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
	public int getRno(ReplyLikeVO vo) throws Exception{
		return session.selectOne(namespace + ".getRno" , vo.getRlno());
	}
}
