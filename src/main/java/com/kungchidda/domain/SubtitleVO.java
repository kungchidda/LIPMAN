package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class SubtitleVO {
	
	private Integer sno;
	private Integer bno;
	private String title;
	private String subtitle;
	private Date updatedate;
	private String uid;
	
	private Integer tno;

}
