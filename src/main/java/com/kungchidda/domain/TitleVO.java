package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

public @Data class TitleVO {

	private Integer tno;
	private String title;
	private String uid;
	private int titlelikecnt;
	private int titledislikecnt;
	private Date regdate;
	
	private String[] genreArr;
	
	private String[] files;
	private String fullName;
}
