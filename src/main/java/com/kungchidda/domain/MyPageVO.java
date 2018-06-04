package com.kungchidda.domain;

import java.util.Date;
import lombok.Data;

public @Data class MyPageVO {
	
	private Integer bno;
	private String title;
	private String subtitle;
	private String content;
	private String uid;
	private String uname;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	private int likecnt;
	private int unlikecnt;
	
	private String[] files;
	
	private String fullName;

}
