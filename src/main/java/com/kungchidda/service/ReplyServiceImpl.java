package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.ReplyVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.persistence.BoardDAO;
import com.kungchidda.persistence.NotifyDAO;
import com.kungchidda.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Inject
	private NotifyDAO notifyDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception{
		replyDAO.create(vo);

		boardDAO.updateReplyCnt(vo.getBno(), 1);
		
		NotifyVO notifyVO = new NotifyVO();
		BoardVO boardVO = new BoardVO();
		UserVO userVO = new UserVO();
		
		boardVO.setBno(vo.getBno());
		boardVO = notifyDAO.checkBoardForNotify(boardVO);
		userVO.setUid(vo.getUid());
		userVO = notifyDAO.checkUserForNotify(userVO);

		notifyVO.setSender(vo.getUid());
		notifyVO.setReceiver(boardVO.getUid());
		
		if(!notifyVO.getSender().equals(notifyVO.getReceiver())) {
			notifyVO.setType("bno");
			if(userVO.getProfileFullName() == null) {
				userVO.setProfileFullName("/account.png");
			}
			notifyVO.setNotifyThumbnail(userVO.getProfileFullName());
			notifyVO.setUrl("/sboard/readPage?bno="+boardVO.getBno()+"#repliesDiv");
			notifyVO.setContents(vo.getUname() +"님이 " + boardVO.getSubtitle() + "에 댓글을 남겼습니다. " + "\"" + vo.getReplytext() + "\"");
			
			notifyDAO.create(notifyVO);
		}
	}
	
	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		return replyDAO.list(bno);
	}
	
	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		replyDAO.update(vo);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception{
		int bno = replyDAO.getBno(rno);
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		return replyDAO.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return replyDAO.count(bno);
	}
	
}
