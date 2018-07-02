package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class SubscribeVO {
	
	private Integer sno;
	private String subscribed;
	private String subscriber;
	private Date regdate;

	private String uname;
}
