package com.kungchidda.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;
import com.kungchidda.service.UserService;
import com.kungchidda.util.PasswordEncoding;
import com.kungchidda.util.SHAPasswordEncoder;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
//	@Autowired
//	StandardPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("referer", referer);
		logger.info("referer = " + referer);

		return "/user/login";
	}


	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

//		String encPassword = passwordEncoder.encode(dto.getUpw());
//		dto.setUpw(encPassword);
		SHAPasswordEncoder shaPasswordEncoder = new SHAPasswordEncoder(512);
		shaPasswordEncoder.setEncodeHashAsBase64(true);
		PasswordEncoding passwordEncoding = new PasswordEncoding(shaPasswordEncoder);
		dto.setUpw(passwordEncoding.encode(dto.getUpw()));
		UserVO vo = service.login(dto);

		if (vo == null) {
			return;
		}

		model.addAttribute("userVO", vo);

		// loginCookie 값이 유지되는 시간 정보를 데이터 베이스에 저장
		if (dto.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			UserVO vo = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUid(), session.getId(), new Date());
			}

		}
		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(UserVO user, Model model) throws Exception {
		logger.info("join get ..........");
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("join post ..........");
		logger.info(user.toString());

//		String encPassword = passwordEncoder.encode(user.getUpw());
//		user.setUpw(encPassword);
		SHAPasswordEncoder shaPasswordEncoder = new SHAPasswordEncoder(512);
		shaPasswordEncoder.setEncodeHashAsBase64(true);
		PasswordEncoding passwordEncoding = new PasswordEncoding(shaPasswordEncoder);
		user.setUpw(passwordEncoding.encode(user.getUpw()));
		
		service.join(user);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value = "/setting", method = RequestMethod.POST)
	public String modifyProfilePOST(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("uid = " + user.getUid());
		logger.info("upw = " + user.getUpw());
		logger.info("uname = " + user.getUname());
		logger.info("file = " + user.getFiles());
		logger.info("genre = " + user.getGenre());
		logger.info("genreArr = " + user.getGenreArr());
		
		if(user.getUpw() != "") {
			logger.info("upw != ''" + user.getUpw());
			SHAPasswordEncoder shaPasswordEncoder = new SHAPasswordEncoder(512);
			shaPasswordEncoder.setEncodeHashAsBase64(true);
			PasswordEncoding passwordEncoding = new PasswordEncoding(shaPasswordEncoder);
			user.setUpw(passwordEncoding.encode(user.getUpw()));
		}
		service.modify(user);

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());
		
		return "redirect:/mypage/setting";
	}
	
	
}
