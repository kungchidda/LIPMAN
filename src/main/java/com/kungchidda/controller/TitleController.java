package com.kungchidda.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.TitleVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.service.TitleService;
import com.kungchidda.util.MediaUtils;

@Controller
@RequestMapping("/title/*")
public class TitleController {

	private static final Logger logger = LoggerFactory.getLogger(TitleController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private TitleService service;
	
	@RequestMapping(value="/titlelist", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	//무한 스크롤
	@RequestMapping(value="/titlelistScroll", method = RequestMethod.GET)
	public void listScroll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readTitle", method = RequestMethod.GET)
	public void read(@RequestParam("tno") int tno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(tno));
		
		//SearchCriteria cri = new SearchCriteria();
		cri.setPerPageNum(20);
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		
		
	}

	@RequestMapping(value = "/removeTitle", method = RequestMethod.POST)
	public String remove(HttpServletRequest request, @RequestParam("tno") int tno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		
//		ResponseEntity<List<BoardVO>> entity = null;
//		try {
//			entity = new ResponseEntity<>(service.getAttach(tno), HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		logger.info(entity.toString());
		
		List<BoardVO> list = service.getAttach(tno);
		String[] fileList;

		ArrayList<String> deleteFileList;
		deleteFileList = new ArrayList<String>();

		if(list.size()>0) {
			for(int i=0; i<list.size(); i++) {
				String deleteFile;
				String front;
				String end;
				String deleteThumbnailFile;
//				logger.info("removeTitle gettitleFullName["+i+"] = " + list.get(i).getTitleFullName());
				deleteThumbnailFile = list.get(i).getTitleFullName();
				deleteFileList.add(deleteThumbnailFile);
				//s_ 붙은 썸네일만 지워도 같이 지워지네
//				front = deleteFile.substring(0, 12);
//				end = deleteFile.substring(12);
//				deleteThumbnailFile =  front + "s_" + end;
//				deleteFileList.add(deleteThumbnailFile);
				
//				logger.info("removeTitle getBoardFullName["+i+"] = " + list.get(i).getBoardFullName());
				deleteThumbnailFile = list.get(i).getBoardFullName();
				deleteFileList.add(deleteThumbnailFile);
//				front = deleteFile.substring(0, 12);
//				end = deleteFile.substring(12);
//				deleteThumbnailFile =  front + "s_" + end;
//				deleteFileList.add(deleteThumbnailFile);
				
//				logger.info("removeTitle getFileList["+i+"] = " + list.get(i).getFileList());
				String temp = list.get(i).getFileList();
				fileList = temp.split("<br>");

				for(int j =0; j<fileList.length; j++) {
					int fileNameLength = fileList[j].length() -2;
					deleteFile = fileList[j].substring(32, fileNameLength);
//					deleteFileList.add(deleteFile);
					front = deleteFile.substring(0, 12);
					end = deleteFile.substring(12);
					deleteThumbnailFile =  front + "s_" + end;
					deleteFileList.add(deleteThumbnailFile);
				}
			}
		}
		
//		if(deleteFileList == null || deleteFileList.size() ==0) {
//		}
		
		for(String fileName : deleteFileList) {
//			logger.info("delete start fileName = " + fileName);
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/',  File.separatorChar)).delete();
			}
			
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		
		
		service.remove(tno);
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		rttr.addAttribute("uid", vo.getUid());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/mypage/titleList";
	}
	
	@RequestMapping(value = "/modifyTitle", method = RequestMethod.GET)
	public void modifyPagingGET(int tno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(tno));
	}

	@RequestMapping(value = "/modifyTitle", method = RequestMethod.POST)
	public String modifyPagingPOST(HttpServletRequest request, TitleVO title, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info(cri.toString());
		
		int tno = title.getTno();
		String titleName = title.getTitle();
		logger.info("titleName = " + titleName);
		logger.info("tno = " + tno);
		
		service.modify(title);
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		rttr.addAttribute("uid", vo.getUid());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());
		
		return "redirect:/mypage/titleList";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(TitleVO title, Model model) throws Exception {
		logger.info("register get ..........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(HttpServletRequest request, TitleVO title, RedirectAttributes rttr) throws Exception {
		logger.info("regist post ..........");
		logger.info(title.toString());

		service.regist(title);

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		rttr.addAttribute("uid", vo.getUid());
		rttr.addFlashAttribute("msg", "SUCCESS");

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
	
//	@RequestMapping("/getAttach/{tno}")
//	@ResponseBody
//	public List<String> getAttach(@PathVariable("tno")Integer tno) throws Exception{
//		return service.getAttach(tno);
//	}
}
