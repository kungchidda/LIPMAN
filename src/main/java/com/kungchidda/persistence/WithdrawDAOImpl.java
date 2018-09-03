package com.kungchidda.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kungchidda.domain.WithdrawVO;

@Repository
public class WithdrawDAOImpl implements WithdrawDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.withdrawMapper";
	
	@Override
	public void insert(WithdrawVO withdrawVO) throws Exception {
		session.insert(namespace+".insert", withdrawVO);
	}
	
	@Override
	public void insertAttach(WithdrawVO withdrawVO) throws Exception{
		session.insert(namespace+".insertAttach", withdrawVO);
	}
	
	@Override
	public WithdrawVO checkWithdraw(WithdrawVO withdrawVO) throws Exception{
		return session.selectOne(namespace + ".checkWithdraw", withdrawVO);
	}
	
	@Override
	public void modify(WithdrawVO withdrawVO) throws Exception {
		session.update(namespace+".modify", withdrawVO);
	}
}
