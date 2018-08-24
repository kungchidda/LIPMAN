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
import com.kungchidda.util.PasswordEncoding;
import com.kungchidda.util.SHAPasswordEncoder;

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
//				new StringBuffer().append("<!DOCTYPE html><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>LIPMAN</title><style>.email {display: grid;grid-template-columns: 600px;grid-template-rows: 180px 30px 30px 30px;grid-template-areas: 'a''b''c''d';justify-content: center;grid-gap: 5px;align-items: center;justify-items: center;padding-top: 50px;}.email .error-img {grid-area: a;}.email img {width: 450px;}.email .email-text-1 {grid-area: b;font-size: 15px;}.email .email-text-2 {grid-area: c;font-size: 15px;}.email .email-link {grid-area: d;font-size: 15px;color: blue;text-decoration: underline;}</style></head><body><!-- email page --><div class='email'><img src='http://127.0.0.1:8080/resources//png/logo-back.png' class='email-img'><p class='email-text-1'>가입 절차가 거의 완료되었습니다!</p><p class='email-text-2'>가입을 완료하시려면 아래 링크를 열어주세요!</p>").append("<a href='http://127.0.0.1:8080/user/emailConfirm?uid=").append(user.getUid()).append("&authKey=").append(key).append("' target='_blenk'>이메일 인증 확인</a></div></body></html>").toString());
				new StringBuffer().append("<!DOCTYPE html><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>LIPMAN</title><style>.email {display: grid;grid-template-columns: 400px;grid-template-rows: 180px 30px 30px 30px;grid-template-areas: 'a''b''c''d';justify-content: center;grid-gap: 5px;align-items: center;justify-items: center;padding-top: 50px;}.email .error-img {grid-area: a;}.email img {width: 250px;}.email .email-text-1 {grid-area: b;font-size: 15px;}.email .email-text-2 {grid-area: c;font-size: 15px;}.email .email-link {grid-area: d;font-size: 15px;color: blue;text-decoration: underline;}</style></head><body><!-- email page --><div class='email'><img src='https://lipman.app/resources//png/logo-back.png' class='email-img'><p class='email-text-1'>가입 절차가 거의 완료되었습니다!</p><p class='email-text-2'>가입을 완료하시려면 아래 링크를 열어주세요!</p>").append("<a href='https://lipman.app/user/emailConfirm?uid=").append(user.getUid()).append("&authKey=").append(key).append("' target='_blenk'>이메일 인증 확인</a></div></body></html>").toString());
//				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='https://lipman.app/user/emailConfirm?uid=").append(user.getUid()).append("&authKey=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("lipmanapp@gmail.com", "LIPMAN");
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
		dao.deleteGenre(user);
		if(user.getGenreArr() != null) {
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
	
	@Override
	public void forgotPassword(String uid) throws Exception {
		String upw = new TempKey().getKey(50, false); // 인증키 생성
		upw = upw.substring(0, 10);
		
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[LIPMAN 임시 비밀번호]");
		sendMail.setText(
//				new StringBuffer().append("<!DOCTYPE html><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>LIPMAN</title><style>.email {display: grid;grid-template-columns: 600px;grid-template-rows: 180px 30px 30px 30px;grid-template-areas: 'a''b''c''d';justify-content: center;grid-gap: 5px;align-items: center;justify-items: center;padding-top: 50px;}.email .error-img {grid-area: a;}.email img {width: 450px;}.email .email-text-1 {grid-area: b;font-size: 15px; color: red}.email .email-text-2 {grid-area: c;font-size: 15px;}.email .email-link {grid-area: d;font-size: 15px;color: blue;text-decoration: underline;}</style></head><body><!-- email page --><div class='email'><img src='http://127.0.0.1:8080/resources//png/logo-back.png' class='email-img'><h1 class='email-text-1'>").append(upw).append("</h1><p class='email-text-2'>임시 비밀번호로 로그인을 하여 주시기 바랍니다.</p></div></body></html>").toString());
				new StringBuffer().append("<!DOCTYPE html><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>LIPMAN</title><style>.email {display: grid;grid-template-columns: 400px;grid-template-rows: 180px 30px 30px 30px;grid-template-areas: 'a''b''c''d';justify-content: center;grid-gap: 5px;align-items: center;justify-items: center;padding-top: 50px;}.email .error-img {grid-area: a;}.email img {width: 250px;}.email .email-text-1 {grid-area: b;font-size: 15px; color: red}.email .email-text-2 {grid-area: c;font-size: 15px;}.email .email-link {grid-area: d;font-size: 15px;color: blue;text-decoration: underline;}</style></head><body><!-- email page --><div class='email'><img src='https://lipman.app/resources//png/logo-back.png' class='email-img'><h1 class='email-text-1'>").append(upw).append("</h1><p class='email-text-2'>임시 비밀번호로 로그인을 하여 주시기 바랍니다.</p></div></body></html>").toString());
				//new StringBuffer().append("<h1>임시 비밀번호</h1>").append(upw).toString());
		sendMail.setFrom("lipmanapp@gmail.com", "LIPMAN");
		sendMail.setTo(uid);
		sendMail.send();
		
		
		SHAPasswordEncoder shaPasswordEncoder = new SHAPasswordEncoder(512);
		shaPasswordEncoder.setEncodeHashAsBase64(true);
		PasswordEncoding passwordEncoding = new PasswordEncoding(shaPasswordEncoder);
		upw = passwordEncoding.encode(upw);
		
		
		dao.forgotPassword(uid, upw);
	}
	
	@Override
	public int forgotPasswordCheck(String uid) throws Exception {
		return dao.forgotPasswordCheck(uid);
	}
	
	
	
}
