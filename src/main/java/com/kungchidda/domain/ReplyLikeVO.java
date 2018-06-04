package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class ReplyLikeVO {
	
	private Integer rlno;
	private Integer rno;
	private Integer rlpo;
	private String uid;
	private Date regdate;

}
