package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class NotifyVO {
	
	private Integer nno;
	private String sender;
	private String receiver;
	private String type;
	private Integer type_num;
	private String notifyThumbnail;
	private String contents;
	private String url;
	private Integer readNotify;
	
	private Date regdate;
	private Date updatedate;

}
