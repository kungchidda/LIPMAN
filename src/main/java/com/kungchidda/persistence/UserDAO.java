package com.kungchidda.persistence;

import java.util.Date;
import java.util.List;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next);
	
	public UserVO checkUserWithSessionKey(String value);

	public void join(UserVO user) throws Exception;
	
	public void updateSubscribedCnt(String subscribed) throws Exception;
	public void updateSubscriberCnt(String subscriber) throws Exception;
	
	public void update(UserVO user) throws Exception;
	
	public void addAttach(String profileFullName) throws Exception;
	public List<String> getAttach(Integer uno) throws Exception;
	public void deleteAttach(Integer uno) throws Exception;
	public void replaceAttach(String profileFullName, Integer uno) throws Exception;
	
	public void insertGenre(UserVO user) throws Exception;
	public void deleteGenre(UserVO user) throws Exception;
}
