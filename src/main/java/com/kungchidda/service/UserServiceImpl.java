package com.kungchidda.service;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;
import com.kungchidda.mail.MailHandler;
import com.kungchidda.mail.TempKey;
import com.kungchidda.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	@PreAuthorize("#userVO.uid == authentication.name or hasRole(‘ROLE_ADMIN')")
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	
	@Override
	@PreAuthorize("#userVO.uid == authentication.name or hasRole(‘ROLE_ADMIN')")
	public UserVO refresh(LoginDTO dto) throws Exception {
		return dao.refresh(dto);
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
		
		String key = new TempKey().getKey(50, false); // 인증키 생성

		dao.createAuthKey(user.getUid(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[LIPMAN 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://127.0.0.1:8080/user/emailConfirm?uid=").append(user.getUid()).append("&authKey=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("kungchidda@gmail.com", "LIPMAN 개발자");
		sendMail.setTo(user.getUid());
		sendMail.send();
		
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
	
	@Override
	public int existAccount(UserVO vo) throws Exception{
		return dao.existAccount(vo);
	}
	
	@Override
	public int auth(String uid, String authKey) throws Exception {
		return dao.auth(uid, authKey);
	}
}
