package com.kungchidda.domain;

import java.util.Date;
import lombok.Data;

public @Data class BoardVO {
	
	private Integer bno;
	private String title;
	private String subtitle;
	private String content;
	private String uid;
	private String uname;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	
	private String[] files;
	
	private String fullName;

}
