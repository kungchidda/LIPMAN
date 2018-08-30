package com.kungchidda.domain;

import java.util.Date;
import lombok.Data;

public @Data class BoardVO {
	
	private Integer tno;
	private Integer bno;
	private String title;
	private String subtitle;
	private String content;
	private String fileList;
	private String uid;
	private String uname;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	private int likecnt;
	private int dislikecnt;
	private String gname;
	private String genre;
	private String[] genreArr;
	
	
	private String[] files;
	private String[] tags;
	private String tag;
	
	private String titleFullName;
	private String boardFullName;
	private String profileFullName;
	
	private int uread;
	private int point;
}
