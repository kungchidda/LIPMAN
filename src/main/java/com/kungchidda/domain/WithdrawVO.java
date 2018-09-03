package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class WithdrawVO {
	
	private Integer wno;
	private String uid;
	private Integer type;
	private String registedNo;
	private String companyName;
	private String ceoName;
	private Integer taxType;
	private String bankName;
	private String accountNo;
	private String accountHolder;
	
	private String[] files;
	private String withdrawFullName;
	
	private Integer status;
	private Date regdate;

}
