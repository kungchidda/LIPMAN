package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

//게시물과 마찬가지로 댓글 역시 같은 방식
public @Data class PayVO {
	
	private Integer pno;
	private String uid;
	private String orderNo;
	private Integer amount;
	private Integer bno;
	private String productDesc;
	private Long code;
	private String payToken;
	private String checkoutPage;
	private Integer point;
	
	private Date regdate;

}
