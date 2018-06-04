package com.kungchidda.persistence;

import java.util.Date;

import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next);
	
	public UserVO checkUserWithSessionKey(String value);

	public void join(UserVO user) throws Exception;
	
	public void updateSubscribedCnt(String subscribed) throws Exception;
	public void updateSubscriberCnt(String subscriber) throws Exception;
}
