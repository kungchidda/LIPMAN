package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class TitleVO {

	private Integer tno;
	private String title;
	private String uid;
	private Date regdate;
	
	private String[] files;
	private String fullName;
}
