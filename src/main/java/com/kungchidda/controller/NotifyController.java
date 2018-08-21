package com.kungchidda.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.UserVO;
import com.kungchidda.service.NotifyService;

@Controller
@RequestMapping("/notify/*")
public class NotifyController {

	private static final Logger logger = LoggerFactory.getLogger(NotifyController.class);
	
	@Inject
	private NotifyService notifyService;
	
	@RequestMapping(value="/notifyList/{page}", method = RequestMethod.POST)
//	public void notifyList(Model model, HttpServletRequest request) throws Exception{
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("page") Integer page, @RequestBody NotifyVO vo, HttpServletRequest request){

		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(10);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			
			NotifyVO notifyVO = new NotifyVO();
			HttpSession session = request.getSession();
			UserVO userVO = (UserVO)session.getAttribute("login");
			String uid = "";
			//Ajax로 호출될 것이므로 Model을 사용하지 못함
			//전달해야 하는 데이터들을 담기 위해서 Map 타입의 객체를 별도로 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(userVO != null) {
				uid = userVO.getUid();
				logger.info("uid = " + uid);
				notifyVO.setReceiver(uid);
				List<NotifyVO> notifyList = notifyService.notifyList(notifyVO, cri);
				map.put("notifyList", notifyList);
			}
				
			
//			if(vo != null) {
//				uid = vo.getReceiver();
//				logger.info("uid = " + uid);
//				notifyVO.setReceiver(uid);
//				List<NotifyVO> list = notifyService.notifyList(notifyVO, cri);
//				map.put("list", list);
//			}
			
			int notifyCount = notifyService.count(notifyVO);
			pageMaker.setTotalCount(notifyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	
	@RequestMapping(value = "/readNotify", method = RequestMethod.POST)
	public ResponseEntity<String> readNotify(@RequestBody NotifyVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			notifyService.readNotify(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/deleteNotify", method = RequestMethod.POST)
	public ResponseEntity<String> deleteNotify(@RequestBody NotifyVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			notifyService.deleteNotify(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/deleteAllNotify", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAllNotify(@RequestBody NotifyVO vo) {
		ResponseEntity<String> entity = null;
		try {
			notifyService.deleteAllNotify(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/checkNewNotify", method = RequestMethod.POST)
	public ResponseEntity<Integer> count(@RequestBody NotifyVO vo){
		
		ResponseEntity<Integer> entity = null;
			int notifyCount;
			try {
				notifyCount = notifyService.checkNewNotify(vo);
				entity = new ResponseEntity<Integer>(notifyCount, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return entity;
	}
	
	
}
