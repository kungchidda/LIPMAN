package com.kungchidda.domain;

import java.util.Date;

import lombok.Data;

//게시물과 마찬가지로 댓글 역시 같은 방식
public @Data class ReplyVO {
	
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String uid;
	private String uname;
	private Integer replylikecnt;
	private Integer replydislikecnt;
	
	private String profileFullName;
	
	private Date regdate;
	private Date updatedate;

}
