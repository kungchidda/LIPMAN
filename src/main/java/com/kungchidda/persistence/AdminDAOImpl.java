package com.kungchidda.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.WithdrawVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.adminMapper";
	
	@Override
	public List<PayVO> payHistoryList(SearchCriteria cri) throws Exception{
		return session.selectList(namespace + ".payHistoryList", cri);
	}
	
	@Override
	public int payHistoryListCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace + ".payHistoryListCount", cri);
	}
	
	@Override
	public PayVO payHistoryRead(Integer pno) throws Exception {
		return session.selectOne(namespace+".payHistoryRead", pno);
	}
	
	@Override
	public List<WithdrawVO> withdrawHistoryList(SearchCriteria cri) throws Exception{
		return session.selectList(namespace + ".withdrawHistoryList", cri);
	}
	
	@Override
	public int withdrawHistoryListCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace + ".withdrawHistoryListCount", cri);
	}
	
	@Override
	public WithdrawVO withdrawHistoryRead(Integer wno) throws Exception {
		return session.selectOne(namespace+".withdrawHistoryRead", wno);
	}
	
	@Override
	public List<WithdrawVO> withdrawHistoryReadAttach(Integer wno) throws Exception{
		return session.selectList(namespace + ".withdrawHistoryReadAttach", wno);
	}
	
	@Override
	public void withdrawModify(WithdrawVO withdrawVO) throws Exception {
		session.update(namespace+".withdrawModify", withdrawVO);
	}
	
}
