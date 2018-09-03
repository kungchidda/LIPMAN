package com.kungchidda.persistence;

import com.kungchidda.domain.WithdrawVO;

public interface WithdrawDAO {
	
	public void insert(WithdrawVO withdrawVO) throws Exception;
	public void insertAttach(WithdrawVO withdrawVO) throws Exception;
	public WithdrawVO checkWithdraw(WithdrawVO withdrawVO) throws Exception;
	public void modify(WithdrawVO withdrawVO) throws Exception;
}
