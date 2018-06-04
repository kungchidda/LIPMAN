package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kungchidda.domain.MyPageVO;
import com.kungchidda.domain.SearchCriteria;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.myPageMapper";
	
	@Override
	public void create(MyPageVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public void add(MyPageVO vo) throws Exception {
		session.insert(namespace+".add", vo);
	}
	
	@Override
	public MyPageVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+".read", bno);
	}
	
	@Override
	public void update(MyPageVO vo) throws Exception {
		session.update(namespace +".update", vo);
	}
	
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}
	
	
	@Override
	public List<MyPageVO> listSearch(String uid, SearchCriteria cri) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("uid", uid);
		paramMap.put("cri", cri);
		return session.selectList(namespace + ".listSearch", paramMap);
	}
	
	@Override
	public List<MyPageVO> listSubscribedSearch(String uid, SearchCriteria cri) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("uid", uid);
		paramMap.put("cri", cri);
		return session.selectList(namespace + ".listSubscribedSearch", paramMap);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReplyCnt", paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		
		session.update(namespace + ".updateViewCnt", bno);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		session.insert(namespace+".addAttach", fullName);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return session.selectList(namespace+".getAttach", bno);
	}
	
	@Override
	public void deleteAttach(Integer bno) throws Exception{
		session.delete(namespace+".deleteAttach", bno);
	}
	
	@Override
	public void deleteReplyAll(Integer bno) throws Exception{
		session.delete(namespace+".deleteReplyAll", bno);
	}
	
	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach", paramMap);
	}
	
	
	@Override
	public void updateLikeCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateLikeCnt", bno);
	}
	
	

}
