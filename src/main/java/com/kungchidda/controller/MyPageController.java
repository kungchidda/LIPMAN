package com.kungchidda.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.UserVO;
import com.kungchidda.service.MyPageService;


@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private MyPageService service;
	
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public void home(HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info(cri.toString());

			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
			String uid = vo.getUid();
			logger.info("vo.uid = " + vo.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("homeList", service.listSearchCriteria(uid, cri));
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value="/subscribed", method = RequestMethod.GET)
	public void subscribed(HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info("/mypage/subscribed/ GET start");
			logger.info(cri.toString());

			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
			String uid = vo.getUid();
			logger.info("vo.uid = " + vo.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("subscribedList", service.listSubscribedSearchCriteria(uid, cri));
//			model.addAttribute("subscriberList", service.listSubscriberSearchCriteria(uid, cri));
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			
	}
	
	
	@RequestMapping(value="/subscriber", method = RequestMethod.GET)
	public void subscriber(HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info("/mypage/subscriber/ GET start");
			logger.info(cri.toString());

			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
			String uid = vo.getUid();
			logger.info("vo.uid = " + vo.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("list", service.listSubscriberSearchCriteria(uid, cri));
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			
	}
	
	
	@RequestMapping(value="/setting", method = RequestMethod.GET)
	public void setting(HttpServletRequest request, Model model) throws Exception{
			
		
			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
			String uid = vo.getUid();
			logger.info("vo.uid = " + vo.getUid());
			logger.info("uid = " + uid);
			
			model.addAttribute(service.setting(uid));
			
			
	}
	
	@RequestMapping(value="/user/titleList", method = RequestMethod.GET)
//	public void userHome(@ModelAttribute("cri") SearchCriteria cri, Model model, @RequestBody MyPageVO vo) throws Exception{
	public void userHome(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info(cri.toString());
			
			String uid = "";
			uid = cri.getUid();
			logger.info("cri.uid = " + cri.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("homeList", service.listSearchCriteria(uid, cri));
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
	}
	
}
