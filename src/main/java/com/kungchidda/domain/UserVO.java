package com.kungchidda.domain;

import lombok.Data;

public @Data class UserVO {
	
	private int uno;
	private String uid;
	private String upw;
	private String uname;
	private int upoint;
	private int subscribedcnt;
	private int subscribercnt;
	
	private String gname;
	private String genre;
	private String[] genreArr;

	private String[] files;
	
	private String fullName;
}
