package com.kungchidda.domain;

import java.util.Date;
import lombok.Data;

public @Data class MyPageVO {
	
	private Integer tno;
	private Integer bno;
	private String title;
	private String subtitle;
	private String content;
	private String uid;
	private String uname;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	private int titlelikecnt;
	private int titledislikecnt;
	
	private String gname;
	private String genre;
	private String[] genreArr;
	
	private String[] files;
	private String titleFullName;
	private String boardFullName;

}
