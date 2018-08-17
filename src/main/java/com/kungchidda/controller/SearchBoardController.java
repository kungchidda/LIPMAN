package com.kungchidda.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.UserVO;
import com.kungchidda.service.BoardService;
import com.kungchidda.service.TitleService;
import com.kungchidda.util.MediaUtils;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private BoardService service;
	
	@Inject
	private TitleService titleService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
	    
		//String[] genreArr;
		if(cri.getGenre() != null) {
			cri.setGenreArr((cri.getGenre().split(",")));
		}
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	//무한 스크롤
	@RequestMapping(value="/listScroll", method = RequestMethod.GET)
	public void listScroll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request) throws Exception {
	//public void read(@RequestParam("bno") int bno, Model model) throws Exception {
		

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		String uid = "";
		if(vo != null) {
			uid = vo.getUid();
			logger.info("uid = " + uid);
			model.addAttribute(service.userRead(bno, uid));
		}else {
			model.addAttribute(service.read(bno));
		}
		//SearchCriteria cri = new SearchCriteria();
		cri.setPerPageNum(10);
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		service.modify(board);
		logger.info("subtitle = " + board.getSubtitle());

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		rttr.addAttribute("uid", vo.getUid());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
//		return "redirect:/sboard/list";
		return "redirect:/mypage/titleList";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(int tno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("register get ..........");
		model.addAttribute(titleService.read(tno));
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		logger.info("regist post ..........");
		logger.info(board.toString());
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		rttr.addAttribute("uid", vo.getUid());
		
		service.regist(board);

		rttr.addFlashAttribute("msg", "SUCCESS");

//		return "redirect:/sboard/list";
		return "redirect:/mypage/titleList";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/',  File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno")Integer bno) throws Exception{
		return service.getAttach(bno);
	}
	
	
	
	//페이징 처리를 위해 두 개의 @PathVariable을 이용해서 처리
		// /replies/게시물 번호/페이지 번호
		// GET 방식의 처리
		// 페이징 처리를 위해서 PART 2 에서 작성된 PageMaker를 가져와서 사용
		// Criteria와 이를 상속한 SearchCriteria, PageMaker는 모든 페이징 처리에서 공통으로 사용할 수 있도록 만들어진 클래스
		@RequestMapping(value = "/{tno}/{page}/{perPage}", method = RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> listPage(@PathVariable("tno") Integer tno, @PathVariable("page") Integer page, @PathVariable("perPage") Integer perPage, @ModelAttribute("cri") SearchCriteria scri, Model model, HttpServletRequest request){
			
			logger.info("/tno/page start");
			logger.info(scri.toString());
			String criUid = scri.getUid();
			HttpSession session = request.getSession();
			UserVO vo = (UserVO)session.getAttribute("login");
			String loginUid = "";
			if(vo != null) {
				loginUid = vo.getUid();
				if(loginUid != null) {
					loginUid = loginUid.trim();
				}
			}
			if(criUid != null) {
				criUid = criUid.trim();
			}

//			logger.info("criUid = " + criUid);
//			logger.info("loginUid = " + loginUid);
			
			ResponseEntity<Map<String, Object>> entity = null;
			
			try {
				Criteria cri = new Criteria();
				cri.setPage(page);
				//subtitle perPage 설정
				cri.setPerPageNum(perPage);
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				
				//Ajax로 호출될 것이므로 Model을 사용하지 못함
				//전달해야 하는 데이터들을 담기 위해서 Map 타입의 객체를 별도로 생성
				Map<String, Object> map = new HashMap<String, Object>();
				List<BoardVO> list;
//				List<BoardVO> list = service.listSubtitlePage(tno, cri);
//				List<BoardVO> list = service.mylistSubtitlePage(tno, cri);
				
				
				int SubtitleCount;
				
				if(loginUid.equals(criUid) && loginUid != null && criUid != null) {
					list = service.mylistSubtitlePage(tno, cri);
					SubtitleCount = service.mycount(tno);
				}else {
					list = service.listSubtitlePage(tno, cri, loginUid);
					SubtitleCount = service.count(tno);
				}
				map.put("list", list);
				
				pageMaker.setTotalCount(SubtitleCount);
				map.put("pageMaker", pageMaker);
				
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	
		@RequestMapping(value = "/readComplete", method = RequestMethod.POST)
		public ResponseEntity<String> readComplete(@RequestBody BoardVO vo) {
			
			ResponseEntity<String> entity = null;
			try {
				service.readComplete(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);			
			}
			return entity;
		}

		@RequestMapping(value = "/previewPage", method = RequestMethod.POST)
		public void previewPage(BoardVO board, Model model) throws Exception {
			
			logger.info(board.toString());
			model.addAttribute(board);
//			model.addAttribute("board", board);
			
		}

	
	
}
