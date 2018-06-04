package com.kungchidda.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.SubtitleVO;
import com.kungchidda.service.SubtitleService;

//REST Client를 이용해서 테스트
//등록 작업은 '/replies' URI, POST 방식으로 전송
@RestController
@RequestMapping("/subtitles")
public class SubtitleController {
	@Inject
	private SubtitleService service;

	//페이징 처리를 위해 두 개의 @PathVariable을 이용해서 처리
	// /replies/게시물 번호/페이지 번호
	// GET 방식의 처리
	// 페이징 처리를 위해서 PART 2 에서 작성된 PageMaker를 가져와서 사용
	// Criteria와 이를 상속한 SearchCriteria, PageMaker는 모든 페이징 처리에서 공통으로 사용할 수 있도록 만들어진 클래스
	@RequestMapping(value = "/{bno}/{perPage}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno,@PathVariable("perPage") Integer perPage, @PathVariable("page") Integer page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(perPage);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			//Ajax로 호출될 것이므로 Model을 사용하지 못함
			//전달해야 하는 데이터들을 담기 위해서 Map 타입의 객체를 별도로 생성
			Map<String, Object> map = new HashMap<String, Object>();
			List<SubtitleVO> list = service.listSubtitlePage(bno, cri);
			
			map.put("list", list);
			
			int SubtitleCount = service.count(bno);
			pageMaker.setTotalCount(SubtitleCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
