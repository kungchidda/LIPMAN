package com.kungchidda.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kungchidda.domain.ReplyLikeVO;
import com.kungchidda.domain.ReplyVO;
import com.kungchidda.service.ReplyLikeService;


@RestController
@RequestMapping("/replylikes")
public class ReplyLikeController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyLikeController.class);
	
	@Inject
	private ReplyLikeService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> addReplyLike(@RequestBody ReplyLikeVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			service.removeReplyLike(vo);
			service.addReplyLike(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);			
		}
		return entity;
	}
	
	//특정 게시물의 전체 댓글 목록의 처리
	//GET 방식으로 처리, bno 필요
	@RequestMapping(value = "/info/{rno}", method = RequestMethod.GET)
	//URI 내의 경로 {bno}는 @PathVariable("bno")로 활용
	public ResponseEntity<List<ReplyVO>> listReply (@PathVariable("rno") Integer rno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		logger.info("/info/rno GET start" + rno);
		try {
			entity = new ResponseEntity<>(service.infoReplyLike(rno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/{rno}", method = RequestMethod.POST)
	public ResponseEntity<List<ReplyLikeVO>> list (@PathVariable("rno") Integer rno, @RequestBody ReplyLikeVO vo){
		
		ResponseEntity<List<ReplyLikeVO>> entity = null;
		try {
			vo.setRno(rno);
			entity = new ResponseEntity<>(service.listReplyLike(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody ReplyLikeVO vo) {
		ResponseEntity<String> entity = null;
		logger.info("vo.getRno(); = " + vo.getRno());
		
		
		try {
			service.removeReplyLike(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	


}
