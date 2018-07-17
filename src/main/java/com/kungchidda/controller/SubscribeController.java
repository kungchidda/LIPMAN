package com.kungchidda.controller;

import java.util.List;

import javax.inject.Inject;

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

	
	@Inject
	private SubscribeService service;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
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
	

	@RequestMapping(value = "/count", method = RequestMethod.POST)
	public ResponseEntity<Integer> count(@RequestBody SubscribeVO vo){
		
		ResponseEntity<Integer> entity = null;
			int subsCount;
			try {
				subsCount = service.count(vo);
				entity = new ResponseEntity<Integer>(subsCount, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return entity;
	}
	
	
}
