package com.kungchidda.service;

import com.kungchidda.domain.WithdrawVO;

public interface WithdrawService {
	
	public WithdrawVO insert(WithdrawVO withdrawVO) throws Exception;
	public WithdrawVO checkWithdraw(WithdrawVO withdrawVO) throws Exception;
	public WithdrawVO modify(WithdrawVO withdrawVO) throws Exception;
}
