package com.kungchidda.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.UserVO;
import com.kungchidda.service.BoardService;
import com.kungchidda.service.MyPageService;
import com.kungchidda.service.PayService;


@Controller
@RequestMapping("/pay/*")
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Inject
	private PayService payService;
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/charge", method = RequestMethod.GET)
	public String charge(@RequestParam("status") String status, Model model, HttpServletRequest request) throws Exception{
		logger.info("pay charge");
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		if(vo != null) {
			uid = vo.getUid();
			logger.info("uid = " + uid);
			model.addAttribute(myPageService.setting(uid));
			model.addAttribute("status", status);
		}else {
			return "redirect:/";
		}
		return "/pay/charge";
	
	}
	

	@RequestMapping(value="/payments", method = RequestMethod.POST)
//	public void toss(@RequestBody PayVO payVO) throws Exception{
	public String payments(PayVO payVO, HttpServletRequest request) throws Exception{
		
		logger.info("start payments with toss");
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		uid = vo.getUid();
		payVO.setUid(uid);
		payVO = payService.payments(payVO);
		String checkOutPage = payVO.getCheckoutPage();
		return "redirect:"+checkOutPage;
	
	}
	
	@RequestMapping(value="/execute", method = RequestMethod.GET)
	public void execute(@ModelAttribute("status") String status, @ModelAttribute("orderNo") String orderNo) throws Exception{
		logger.info("execute payments");
		if(status.equals("PAY_COMPLETE")) {
			payService.execute(orderNo);
		}
	}
	
	@RequestMapping(value="/success", method = RequestMethod.GET)
	public void success() throws Exception{
		logger.info("success payments");
	}
	
	
	@RequestMapping(value="/fail", method = RequestMethod.GET)
	public void fail() throws Exception{
		logger.info("fail payments");
	}
	
	@RequestMapping(value="/history", method = RequestMethod.GET)
	public void history(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception{
		logger.info("history payments");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		uid = vo.getUid();
		logger.info("uid = " + uid);
		model.addAttribute(myPageService.setting(uid));
		
		PayVO payVO = new PayVO();
		payVO.setUid(uid);
		
		model.addAttribute("payHistory", payService.payHistory(payVO, cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(payService.payHistoryCount(payVO));
		model.addAttribute("pageMaker", pageMaker);

//		model.addAttribute("totalPoint", payService.totalPoint(payVO));
		
		
	}
	
	@RequestMapping(value="/totalPoint", method = RequestMethod.POST)
	public ResponseEntity<Integer> totalPoint(@RequestBody PayVO payVO){
		logger.info("totalPoint payments");
		ResponseEntity<Integer> entity = null;
		int totalPoint = 0;
		try {
			totalPoint = payService.totalPoint(payVO);
			entity = new ResponseEntity<Integer>(totalPoint, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/confirm", method = RequestMethod.GET)
	public String confirm(@RequestParam("target") int bno, Model model, HttpServletRequest request) throws Exception{

		logger.info("confirm bno = " + bno);
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		
		BoardVO boardVO = new BoardVO();
		boardVO = boardService.checkContent(bno);
		
		
		if(vo != null) {
			logger.info("vo != null");
			uid = vo.getUid();
			if(payService.checkUserBuy(bno, uid) == 1 || boardVO.getUid().equals(uid)) {
				return "redirect:/sboard/readPage?bno="+bno;
			}
		}
		
		
		model.addAttribute("boardVO", boardVO);
		
		return "/pay/confirm";
	}
}
