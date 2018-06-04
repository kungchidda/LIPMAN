package com.kungchidda.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.service.SubscribeService;

@RestController
@RequestMapping("/subscribes")
public class SubscribeController {

private static final Logger logger = LoggerFactory.getLogger(SubscribeController.class);
	
	@Inject
	private SubscribeService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> addLike(@RequestBody SubscribeVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			service.addSubscribed(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//특정 게시물의 전체 댓글 목록의 처리
	//GET 방식으로 처리, bno 필요
	//@RequestMapping(value = "/info/{subscribed}", method = RequestMethod.GET)
//	@RequestMapping(value = "/info", method = RequestMethod.GET)
	@RequestMapping(value = "/subscriberList", method = RequestMethod.POST)
	//URI 내의 경로 {bno}는 @PathVariable("bno")로 활용
//	public ResponseEntity<List<SubscribeVO>> list (@PathVariable("subscribed") String subscribed){
	public ResponseEntity<List<SubscribeVO>> subscriberList (@RequestBody SubscribeVO vo){
		
		ResponseEntity<List<SubscribeVO>> entity = null;
		logger.info("/info/subscribed GET start" + vo);
		try {
			entity = new ResponseEntity<>(service.listSubscriber(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/subscribeList", method = RequestMethod.POST)
	public ResponseEntity<List<SubscribeVO>> subscribeList (@RequestBody SubscribeVO vo){
		
		ResponseEntity<List<SubscribeVO>> entity = null;
		try {
			//vo.setSubscribed(subscribed);
			entity = new ResponseEntity<>(service.listSubscribe(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody SubscribeVO vo) {
		ResponseEntity<String> entity = null;
		
		
		try {
			service.removeSubscribed(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	

	
}
