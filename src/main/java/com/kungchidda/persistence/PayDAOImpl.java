package com.kungchidda.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
//import com.kungchidda.domain.Criteria;

@Repository
public class PayDAOImpl implements PayDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.payMapper";
	
	@Override
	public void payments(PayVO payVO) throws Exception {
		session.insert(namespace+".payments", payVO);
	}
	
	@Override
	public void execute(String orderNo) throws Exception {
		session.update(namespace+".execute", orderNo);
	}
	
	@Override
	public List<PayVO> payHistory(PayVO payVO, SearchCriteria cri) throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		String uid = payVO.getUid(); 
		paramMap.put("uid", uid);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".payHistory", paramMap);
	}
	
	@Override
	public int payHistoryCount(PayVO payVO) throws Exception{
		return session.selectOne(namespace + ".payHistoryCount", payVO);
	}
	
	@Override
	public int totalPoint(PayVO payVO) throws Exception{
		return session.selectOne(namespace + ".totalPoint", payVO);
	}
	
	@Override
	public int checkUserBuy(Integer bno, String uid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("uid", uid);
		
		return session.selectOne(namespace + ".checkUserBuy", paramMap);
	}
	
	@Override
	public void usePoint(PayVO payVO) throws Exception {
		session.insert(namespace+".usePoint", payVO);
	}
	
	@Override
	public int withdrawExecute(PayVO payVO) throws Exception {
		return session.insert(namespace+".withdrawExecute", payVO);
	}
	
	@Override
	public int checkOrderNo(String orderNo) throws Exception{
		return session.selectOne(namespace + ".checkOrderNo", orderNo);
	}
	
}
