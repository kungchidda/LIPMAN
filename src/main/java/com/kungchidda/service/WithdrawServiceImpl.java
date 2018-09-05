package com.kungchidda.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.WithdrawVO;
import com.kungchidda.persistence.WithdrawDAO;

@Service
public class WithdrawServiceImpl implements WithdrawService{
	
	@Inject
	private WithdrawDAO withdrawDAO;
	
	@Transactional
	@Override
	public WithdrawVO insert(WithdrawVO withdrawVO) throws Exception{

		String[] files = withdrawVO.getFiles();
		
		withdrawDAO.insert(withdrawVO);
		withdrawVO = withdrawDAO.checkWithdraw(withdrawVO);
		if(files !=null) {
			for(String fileName : files) {
				withdrawVO.setWithdrawFullName(fileName);
				withdrawDAO.insertAttach(withdrawVO);
			}
		}
		
		return withdrawVO;
	}
	
	@Transactional
	@Override
	public WithdrawVO checkWithdraw(WithdrawVO withdrawVO) throws Exception{
		withdrawVO = withdrawDAO.checkWithdraw(withdrawVO);
		return withdrawVO;
	}
	
	@Transactional
	@Override
	public WithdrawVO modify(WithdrawVO withdrawVO) throws Exception{

		String[] files = withdrawVO.getFiles();
		
		withdrawDAO.modify(withdrawVO);
//		withdrawVO = withdrawDAO.checkWithdraw(withdrawVO);
		if(files !=null) {
			
			for(String fileName : files) {
				withdrawVO.setWithdrawFullName(fileName);
				
				withdrawDAO.deleteAttach(withdrawVO);
				withdrawDAO.insertAttach(withdrawVO);
			}
		}
		
		return withdrawVO;
	}
	
}
