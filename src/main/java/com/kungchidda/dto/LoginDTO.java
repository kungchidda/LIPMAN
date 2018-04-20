package com.kungchidda.dto;

import lombok.Data;

public @Data class LoginDTO {
	
	private String uid;
	private String upw;
	private boolean useCookie;

}
