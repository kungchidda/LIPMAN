package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class SubscribeVO {
	
	private Integer fno;
	private String subscribed;
	private String subscriber;
	private Date regdate;

}
