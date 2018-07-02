package com.kungchidda.service;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;
import com.kungchidda.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	@Override
	@PreAuthorize("#userVO.uid == authentication.name or hasRole(‘ROLE_ADMIN')")
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	
	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		dao.keepLogin(uid, sessionId, next);
		
	}
	
	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}

	@Transactional
	@Override
	public void join(UserVO user) throws Exception{
		dao.join(user);
		
		
	}
	
	
	@Transactional
	@Override
	public void modify(UserVO user) throws Exception{
		dao.update(user);
		Integer uno = user.getUno();
		
		
		String[] files = user.getFiles();
		logger.info("files = " + files);
		if(files != null) {
			logger.info("files != null ");

			dao.deleteAttach(uno);
			for(String fileName : files) {
				dao.replaceAttach(fileName, uno);
			}
		}
		if(user.getGenreArr() != null) {
			dao.deleteGenre(user);
			dao.insertGenre(user);
		}
	}
}
