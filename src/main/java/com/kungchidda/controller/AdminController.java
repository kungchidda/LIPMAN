package com.kungchidda.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.UserVO;
import com.kungchidda.domain.WithdrawVO;
import com.kungchidda.service.AdminService;


@Controller
@RequestMapping("/lipmanAdmin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService adminService;
	
	
	@RequestMapping(value="/payHistoryList", method = RequestMethod.GET)
	public String payHistoryList(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception{
		logger.info("lipmanAdmin");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		uid = vo.getUid();
		logger.info("uid = " + uid);
		
		if(uid.equals("lipmanapp@gmail.com")) {
			model.addAttribute("payHistory", adminService.payHistoryList(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(adminService.payHistoryListCount(cri));
			model.addAttribute("pageMaker", pageMaker);
			return "/lipmanAdmin/payHistoryList";
		}
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/payHistoryRead", method = RequestMethod.GET)
	public String payHistoryRead(@RequestParam("pno") int pno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		uid = vo.getUid();
		logger.info("uid = " + uid);
		
		if(uid.equals("lipmanapp@gmail.com")) {
			model.addAttribute(adminService.payHistoryRead(pno));
			return "/lipmanAdmin/payHistoryRead";
		}
		return "redirect:/sboard/list";
		
	}
	
	@RequestMapping(value="/withdrawHistoryList", method = RequestMethod.GET)
	public String withdrawHistoryList(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception{
		logger.info("lipmanAdmin");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		uid = vo.getUid();
		logger.info("uid = " + uid);
		
		if(uid.equals("lipmanapp@gmail.com")) {
			model.addAttribute("withdrawHistory", adminService.withdrawHistoryList(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(adminService.withdrawHistoryListCount(cri));
			model.addAttribute("pageMaker", pageMaker);
			return "/lipmanAdmin/withdrawHistoryList";
		}
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/withdrawHistoryRead", method = RequestMethod.GET)
	public String withdrawHistoryRead(@RequestParam("wno") int pno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		uid = vo.getUid();
		logger.info("uid = " + uid);
		
		if(uid.equals("lipmanapp@gmail.com")) {
			model.addAttribute(adminService.withdrawHistoryRead(pno));
			model.addAttribute("withdrawFullName", adminService.withdrawHistoryReadAttach(pno));
			return "/lipmanAdmin/withdrawHistoryRead";
		}

		return "redirect:/sboard/list";
		
	}
	
	@RequestMapping(value="/withdrawModify", method = RequestMethod.POST)
	public String withdrawModifyPOST(WithdrawVO withdrawVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("withdraw");

		adminService.withdrawModify(withdrawVO);
		
		return "redirect:/lipmanAdmin/withdrawHistoryList";
	}
	
	
}
