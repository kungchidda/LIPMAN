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
import com.kungchidda.domain.PayVO;
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
	
//	@RequestMapping(value="/payHistoryRead", method = RequestMethod.GET)
//	public String payHistoryRead(@RequestParam("pno") int pno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception {
//		
//		HttpSession session = request.getSession();
//		UserVO vo = (UserVO)session.getAttribute("login");
//		String uid = "";
//		uid = vo.getUid();
//		logger.info("uid = " + uid);
//		
//		if(uid.equals("lipmanapp@gmail.com")) {
//			model.addAttribute(adminService.payHistoryRead(pno));
//			return "/lipmanAdmin/payHistoryRead";
//		}
//		return "redirect:/sboard/list";
//		
//	}
	
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
	
	@RequestMapping(value="/withdrawHistoryReadWno", method = RequestMethod.GET)
	public String withdrawHistoryReadWno(@RequestParam("wno") int wno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception {
		logger.info("@RequestParam wno = " + wno);
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String loginID = "";
		loginID = vo.getUid();
		logger.info("loginID = " + loginID);
		
		if(loginID.equals("lipmanapp@gmail.com")) {
			WithdrawVO withdrawVO = new WithdrawVO();
			withdrawVO.setWno(wno);
			model.addAttribute(adminService.withdrawHistoryRead(withdrawVO));
			model.addAttribute("withdrawFullName", adminService.withdrawHistoryReadAttach(withdrawVO));
			return "/lipmanAdmin/withdrawHistoryRead";
		}

		return "redirect:/sboard/list";
		
	}
	
	@RequestMapping(value="/payHistoryRead", method = RequestMethod.GET)
	public String payHistoryRead(@RequestParam("pno") int pno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String loginID = "";
		loginID = vo.getUid();
		logger.info("loginID = " + loginID);
		
		if(loginID.equals("lipmanapp@gmail.com")) {
			PayVO payVO = new PayVO();
			payVO = adminService.payHistoryRead(pno);
			WithdrawVO withdrawVO = new WithdrawVO();
			withdrawVO.setUid(payVO.getUid());
			withdrawVO = adminService.withdrawHistoryRead(withdrawVO);
			if(withdrawVO != null) {
				model.addAttribute(adminService.withdrawHistoryRead(withdrawVO));
				model.addAttribute("withdrawFullName", adminService.withdrawHistoryReadAttach(withdrawVO));
			}
			model.addAttribute(adminService.payHistoryRead(pno));
			return "/lipmanAdmin/payHistoryRead";
		}

		return "redirect:/sboard/list";
		
	}
	
	@RequestMapping(value="/withdrawModify", method = RequestMethod.POST)
	public String withdrawModifyPOST(WithdrawVO withdrawVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("withdraw");

		adminService.withdrawModify(withdrawVO);
		
		return "redirect:/lipmanAdmin/withdrawHistoryList";
	}
	
	@RequestMapping(value="/withdrawComplete", method = RequestMethod.POST)
	public String withdrawComplete(PayVO payVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("withdraw");

		adminService.withdrawComplete(payVO);
		
		return "redirect:/lipmanAdmin/payHistoryList";
	}
	
	
}
