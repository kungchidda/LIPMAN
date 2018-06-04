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

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.LikeVO;
import com.kungchidda.service.LikeService;


@RestController
@RequestMapping("/likes")
public class LikeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
	
	@Inject
	private LikeService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> addLike(@RequestBody LikeVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			service.removeLike(vo);
			service.addLike(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);			
		}
		return entity;
	}
	
	//특정 게시물의 전체 댓글 목록의 처리
	//GET 방식으로 처리, bno 필요
	@RequestMapping(value = "/info/{bno}", method = RequestMethod.GET)
	//URI 내의 경로 {bno}는 @PathVariable("bno")로 활용
	public ResponseEntity<List<BoardVO>> list (@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<BoardVO>> entity = null;
		logger.info("/info/bno GET start" + bno);
		try {
			entity = new ResponseEntity<>(service.infoLike(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/{bno}", method = RequestMethod.POST)
	public ResponseEntity<List<LikeVO>> list (@PathVariable("bno") Integer bno, @RequestBody LikeVO vo){
		
		ResponseEntity<List<LikeVO>> entity = null;
		try {
			vo.setBno(bno);
			entity = new ResponseEntity<>(service.listLike(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody LikeVO vo) {
		ResponseEntity<String> entity = null;
		logger.info("vo.getBno(); = " + vo.getBno());
		
		
		try {
			service.removeLike(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	


}
