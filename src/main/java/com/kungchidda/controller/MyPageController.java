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
	
//	@RequestMapping(value="/home/{uno}", method = RequestMethod.GET)
//	public void home(@ModelAttribute("cri") SearchCriteria cri, Model model, @PathVariable("uno") Integer uno) throws Exception{
//			
//			logger.info("/mypage/home/uno GET start " + uno);
//			logger.info("Request /mypage/home....................");
//			logger.info(cri.toString());
//			
//			model.addAttribute("list", service.listSearchCriteria(uno, cri));
//			PageMaker pageMaker = new PageMaker();
//			
//			pageMaker.setCri(cri);
//			
//			pageMaker.setTotalCount(service.listSearchCount(cri));
//			
//			model.addAttribute("pageMaker", pageMaker);
////			model.addAttribute("uno", uno);
//			
//	}
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public void home(HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info("/mypage/home/uno GET start");
			logger.info(cri.toString());

			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
//			String uid = (String)session.getAttribute("login.uid");
			String uid = vo.getUid();
			logger.info("vo.uid = " + vo.getUid());
			logger.info("uid = " + uid);
			
			model.addAttribute("list", service.listSearchCriteria(uid, cri));
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
//			model.addAttribute("uno", uno);
			
	}
	@RequestMapping(value="/subscribed", method = RequestMethod.GET)
	public void subscribed(HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info("/mypage/subscribed/ GET start");
			logger.info(cri.toString());

			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
//			String uid = (String)session.getAttribute("login.uid");
			String uid = vo.getUid();
			logger.info("vo.uid = " + vo.getUid());
			logger.info("uid = " + uid);
			
			model.addAttribute("list", service.listSubscribedSearchCriteria(uid, cri));
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
//			model.addAttribute("uno", uno);
			
	}
}
