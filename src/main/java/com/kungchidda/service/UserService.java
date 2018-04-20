package com.kungchidda.service;

import java.util.Date;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	public void keepLogin(String uid, String sessionId, Date next) throws Exception;
	public UserVO checkLoginBefore(String value);
}
