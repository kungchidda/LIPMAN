package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.LikeVO;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.persistence.BoardDAO;
import com.kungchidda.persistence.LikeDAO;
import com.kungchidda.persistence.NotifyDAO;

@Service
public class LikeServiceImpl implements LikeService {
	
	
	@Inject
	private LikeDAO likeDAO;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Inject
	private NotifyDAO notifyDAO;
	
	@Transactional
	@Override
	public void addLike(LikeVO vo) throws Exception{
		likeDAO.create(vo);
		boardDAO.updateLikeCnt(vo.getBno());
		
		NotifyVO notifyVO = new NotifyVO();
		BoardVO boardVO = new BoardVO();
		UserVO userVO = new UserVO();
		
		boardVO.setBno(vo.getBno());
		boardVO = notifyDAO.checkBoardForNotify(boardVO);
		userVO.setUid(vo.getUid());
		userVO = notifyDAO.checkUserForNotify(userVO);
		
		notifyVO.setSender(vo.getUid());
		notifyVO.setReceiver(boardVO.getUid());
		
		if(!notifyVO.getSender().equals(notifyVO.getReceiver()) && vo.getLpo() == 1) {
			notifyVO.setType("lno");
			notifyVO.setUrl("/sboard/readPage?bno="+boardVO.getBno());
			notifyVO.setNotifyThumbnail(boardVO.getBoardFullName());
//			if(vo.getLpo() == 1) {
//				notifyVO.setContents(userVO.getUname()+"님이 " + boardVO.getSubtitle() + "을 좋아합니다. ");
				notifyVO.setContents("회원님의 \"" + boardVO.getSubtitle() + "\" 게시물을 좋아합니다. ");
//			}
//			else {
//				notifyVO.setContents(userVO.getUname()+"님이 " + boardVO.getSubtitle() + "을 싫어합니다. ");
//			}
			
			notifyDAO.create(notifyVO);
		}
	}
	
	@Override
	public List<LikeVO> listLike(LikeVO vo) throws Exception {
		return likeDAO.list(vo);
	}
	
	@Override
	public List<BoardVO> infoLike(Integer bno) throws Exception {
		return likeDAO.infoLike(bno);
	}

	@Transactional
	@Override
	public void removeLike(LikeVO vo) throws Exception{
		//likeDAO.getBno(vo);
		likeDAO.delete(vo);
		boardDAO.updateLikeCnt(vo.getBno());
		
	}

	@Override
	public List<LikeVO> listLikePage(Integer bno, Criteria cri) throws Exception {
		return likeDAO.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return likeDAO.count(bno);
	}

}
