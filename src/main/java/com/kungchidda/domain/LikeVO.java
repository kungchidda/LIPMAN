package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class LikeVO {
	
	private Integer lno;
	private Integer bno;
	private Integer lpo;
	private String uid;
	private Date regdate;

}
